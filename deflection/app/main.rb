
#
# DEFLECTION - deflect a moving player into randomly placed targets.
# Cobbled together by red_menace[at]menace-enterprises[dot]com, November 2020.
#
# The playing board is a grid of squares populated with targets that must be hit.
# Your player is represented by a ball that enters along a side of the playing
# field - the location is random, but is hinted at by a countdown label.
# The ball is deflected by pieces placed onto the board by right/left clicking in
# a square - these pieces cannot be (re)moved, but may be changed.
# The game is over when all targets are hit (the target square changes color).
# There is a display of the number of targets remaining and elapsed/remaining time.
#
# Difficulty is by game mode, grid size (which determines the number of targets),
# player speed, and time:
#     Game modes stack, and are:
#        simple         just hit all targets; edges wrap
#        timed          a countdown is added (also to the following modes)
#        edges          timed, plus the game is over if you go off an edge
#        hits           edges, plus the game is over if you hit previous targets
#     Grid sizes are 13x9, 17x12, 23x16, 26x18, and 34x24.
#     Speeds are 3, 4, 6, 9, 13 (the speed also appears to be higher in denser grids).
#     Targets are some (height), more ((width+height)/2), and lots (width)
#
#     Countdown time is scaled from the grid size and player speed, and may
#     need to be adjusted for the number of targets and game mode.
#

require 'app/classes.rb'

##############################
#### Game setup stuff     ####
##############################

# Globals and initial settings.
def set_up_setup
   # general settings
   $game_mode = :simple       # game mode (simple, timed, edges, hits)
   $board_size = 80           # board square size (pixels)
   $player_speed = 3          # movement increment (pixels)
   $targets = :some           # :some, :more, :lots
   $start_delay = 5           # initial start delay/countdown (seconds)
   $countdown = 45            # timed game countdown (seconds)
   $time_warning = 9          # countdown time warning (25% left)
   
   # game items
   $board = nil               # the playing board (object)
   $piece_list = []               # list of game pieces (deflectors, etc)
   $target_list = []              # list of targets
   $player = nil              # the player piece (object)
   $current_square = []       # the current player square
   $previous_square = []      # the previous player square
   $in_progress = false       # is an action for a square in progress?
   $elapsed_time = 0          # elapsed game time
   $game_running = false      # is the game running?
   $one_shot = false          # one-shot trigger for game over sound
   
   # menu selection items
   $mode_choices = ['simple', 'timed', 'edges', 'hits']
   $size_choices = [80, 60, 45, 40, 30]   # square sizes that scale reasonably
   $speed_choices = [3, 4, 6, 9, 13]      # steps are 1, 2, 3, and 4
   $target_choices = [:some, :more, :lots]
   $menu_edge = 1040                      # initial board/menu edge
   
   # other
   $color_shift = [128, 128, 128]   # background tint
   $tone_index = 5                  # initial index into the tone scale
   
   # initial setup
   create_board
   create_player
end

# (Re)start game with current settings.
def restart
   $start_delay = 5
   $game_running = true
   $elapsed_time = 0
   $one_shot = false
   $board = nil
   $piece_list = []
   $target_list = []
   $player = nil
   $gtk.args.outputs.static_solids.clear  # clear out the old board
   create_board
   multiplier = { '80': 1, '60': 1.75, '45': 3, '40': 4, '30': 7 }[$board_size.to_s.to_sym]
   $countdown = (20 * multiplier - ($player_speed.idiv(2) * multiplier) + 2).to_i
   $time_warning = ($countdown * 0.25).to_i  # percentage for color change
   create_player
end

# Create a new board and add targets.
def create_board
   $board = Board.new
   $menu_edge = $board.width * $board_size
   used = []  # keep track of previous target locations
   width, height = $board.width - 2, $board.height - 2  # stay off edges
   number = case $targets
            when :some then height
            when :more then (width + height).idiv(2)
            when :lots then width + 2
            end
   number.times do  # randomly scatter targets onto the board
      possible = [rand(width).to_i + 1, rand(height).to_i + 1]
      while used.include?(possible) || too_near?(used, possible)
         possible = [rand(width).to_i + 1, rand(height).to_i + 1]
      end
      used << possible
      $target_list << Piece.new(*possible, 'sprites/white_square.png', :target, RED).values
      $board.grid[possible[0]][possible[1]][:piece] = :target
   end
end

# Check horizontal/vertical spacing for targets.
def too_near?(existing, new)
   offsets = [-3, -2, -1, 1, 2, 3]
   offsets.each { |x| return true if existing.include?([new[0] + x, new[1]]) }
   offsets.each { |y| return true if existing.include?([new[0], new[1] + y]) }
   false
end

# Create a new player and entry point.
# Returns the board sqare.
def create_player
   x, y, $current_square = 0, 0, [0, 0]  # yep, I just did that
   if rand < 0.5  # left/right
      y = rand($board.height - 2) + 1
      $player = Player.new(x, y, (rand < 0.5 ? :left : :right))
   else  # up/down
      x = rand($board.width - 2) + 1
      $player = Player.new(x, y, (rand < 0.5 ? :up : :down))
   end
   case $player.direction  # set up player screen position
   when :left  # wrap to right edge
      x = $board.width - 1
      $player.x = $menu_edge
   when :right then $player.x = -$board_size.idiv(2)
   when :up then $player.y = -$board_size.idiv(2)
   when :down  # wrap to top edge
      y = $board.height - 1
      $player.y = (719 + $board_size.idiv(2)).to_i
   end
   $current_square = [x.clamp(0, $board.width - 1), y.clamp(0, $board.height - 1)]  # the entry square
end

# Hint where the player will enter the field with a countdown label.
# Returns the countdown time.
def game_starting?
   $start_delay -= 1 if $start_delay && ($gtk.args.state.tick_count % 60).zero?
   $start_delay = nil if $start_delay < 0
   unless $start_delay.nil?
      x, y = $current_square
      $gtk.args.outputs.sprites << Piece.new(x, y, 'sprites/white_square.png', :empty, BLUE).values
      scale = $board_size.idiv(2)
      $gtk.args.outputs.labels << [$board.grid[x][y].x + scale,
                                   $board.grid[x][y].y + scale + scale.idiv(2) + 2,
                                   $start_delay.to_s,
                                   $board_size.idiv(40) * 5,  # scale to square size
                                   1,
                                   *WHITE]
   end
   $start_delay
end


##############################
#### The Main Game Stuff  ####
##############################

# Show instructions for the current game mode setting.
def instructions(outputs)
   set = case $mode_choices[0]  # game modes stack
         when 'timed' then 1
         when 'edges' then 2
         when 'hits' then 3
         else 0  # simple
         end
   outputs.labels << [$menu_edge + 20, 540, 'Hit all targets with the ball', -3, 0, *WHITE]
   outputs.labels << [$menu_edge + 20, 525, 'by placing deflectors in its', -3, 0, *WHITE]
   outputs.labels << [$menu_edge + 20, 510, 'path. A new game is run with', -3, 0, *WHITE]
   outputs.labels << [$menu_edge + 20, 495, 'the menu settings below.', -3, 0, *WHITE]
   outputs.labels << [$menu_edge + 20, 480, 'There is now a countdown', -3, 0, *WHITE] if set > 0
   outputs.labels << [$menu_edge + 20, 465, 'timer to beat.', -3, 0, *WHITE] if set > 0
   outputs.labels << [$menu_edge + 20, 450, "Don't fall off the edges.", -3, 0, *WHITE] if set > 1
   outputs.labels << [$menu_edge + 20, 435, "... and don't run into", -3, 0, *WHITE] if set > 2
   outputs.labels << [$menu_edge + 20, 420, 'previously hit targets.', -3, 0, *WHITE] if set > 2
end

# Show the game menu (right side of board/screen).
def show_menu(outputs)
   tint_background
   outputs.labels << [$menu_edge + 25, 365, '[R]un game:', 0, 0, *WHITE]
   prefix = ['edges', 'hits'].include?($mode_choices[0]) ? '+ ' : ''
   outputs.labels << [$menu_edge + 43, 343, "[M]ode = #{prefix}#{$mode_choices[0]}", 0, 0, *WHITE]
   size = $size_choices[0]
   grid_text = "#{1040.idiv(size)}x#{720.idiv(size)}"
   outputs.labels << [$menu_edge + 43, 321, "[G]rid = #{grid_text}", 0, 0, *WHITE]
   speed_index = [3, 4, 6, 9, 13].index($speed_choices[0])
   speed_text = ['slowest', 'slow', 'medium', 'fast', 'fastest'][speed_index]
   outputs.labels << [$menu_edge + 43, 299, "[S]peed = #{speed_text}", 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 43, 277, "[T]argets = #{$target_choices[0].to_s}", 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 25, 255, '[F]orfeit', 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 25, 233, '[Q]uit', 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 25, 175, 'Left click', 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 25, 155, 'or arrow', 0, 0, *WHITE]
   outputs.primitives << [$menu_edge + 170, 135, 40, 40, 'sprites/menu_backslash.png'].sprite
   outputs.labels << [$menu_edge + 25, 115, 'Right click', 0, 0, *WHITE]
   outputs.labels << [$menu_edge + 25, 95, 'or arrow', 0, 0, *WHITE]
   outputs.primitives << [$menu_edge + 170, 75, 40, 40, 'sprites/menu_slash.png'].sprites
   instructions(outputs)
end

# Check if the game is over.
def game_over?
   x, y = $current_square
   color = ($game_mode != :simple) &&
           ($countdown <= $time_warning) ? RED : WHITE
   time = ($game_mode == :simple) ? $elapsed_time : $countdown
   center = 1280 - (1280 - $menu_edge).idiv(2)
   $gtk.args.outputs.labels << [center, 645, "Time: #{format_time(time)}", 2, 1, *color]
   if $elapsed_time > 1810 || ($game_mode != :simple && $countdown <= 0)
      common_label(690, 'TIME IS UP!', 'buzzer')
   elsif ($game_mode == :hits) && ($board.grid[x][y][:piece] == :hit)
      common_label(690, 'Hit previous target', 'bang')
   elsif $player.fall
      common_label(690, 'Fell off the edge', 'oh_no')
   elsif $target_list.count.zero?
      common_label(600, 'All targets hit!', 'flourish')
   elsif !$game_running
      common_label(690, 'Game stopped')
   else
      return false
   end
   true
end

# Expand 'game over' labels.
def common_label(y, text, sound = nil)
   $gtk.args.outputs.labels << [1280 - (1280 - $menu_edge).idiv(2), y, text, 2, 1, *WHITE]
   one_shot("sounds/#{sound}.wav") unless sound.nil?
end

# Check the board piece at the current location and perform the appropriate action
def perform_action
   info = $board.square_info(*$player.center)
   x, y = $board.square(*$player.center)
   case info[:piece]
   when :target  # remove target from list and change square piece/color
      $board.grid[x][y].merge!({ r: 0, g: 255, b: 0, piece: :hitting })
      remove_item(x, y, $target_list)
      $gtk.args.outputs.sounds << 'sounds/tink.wav'  # 'sounds/click.wav'
   when :empty
      $in_progress = false  # reset when no action to perform
   when :slash then deflect(:slash)
   when :backslash then deflect(:backslash)
   end
end

# Change direction based on board piece.
def deflect(which)
   return if $in_progress  # action for the square is already in progress
   $player.realign  # not much deflect animation
   $player.direction = case $player.direction
                       when :up then which == :slash ? :right : :left
                       when :down then which == :slash ? :left : :right
                       when :left then which == :slash ? :down : :up
                       when :right then which == :slash ? :up : :down
                       end
   thing_that_goes_ping
   $in_progress = true  # flag to avoid retriggering
end

# Handle key presses.
def do_keyboard(inputs)
   keys = inputs.keyboard.truthy_keys
   if keys.include?(:m) then $mode_choices.rotate!(1)  # cycle game modes
   elsif keys.include?(:g) then $size_choices.rotate!(1)  # cycle grid sizes
   elsif keys.include?(:s) then $speed_choices.rotate!(1) # cycle speeds
   elsif keys.include?(:t) then $target_choices.rotate!(1) # cycle target amounts
   elsif keys.include?(:r)  # restart with current settings
      $game_mode = $mode_choices[0].to_sym
      $board_size = $size_choices[0]
      $player_speed = $speed_choices[0]
      $targets = $target_choices[0]
      restart
   elsif keys.include?(:f) then $game_running = false  # forfeit/stop current game
   elsif keys.include?(:q) then exit  # quit
   end
end

# Handle controller buttons.
def do_controller(inputs)
   # if I had a controller to test, this would do some of the same stuff as do_mouse
end

# Handle mouse clicks.
# Control doesn't work with a mouse/trackpad, so left/right arrows also work as a click.
def do_mouse(inputs)
   return unless (click = inputs.mouse.click) ||  # yes, I did that too
                 inputs.keyboard.key_down.left || inputs.keyboard.key_down.right
   mouse_x, mouse_y = click ? inputs.mouse.click.point : inputs.mouse.point
   return unless mouse_x <= $menu_edge && mouse_x >= 0 && mouse_y <= 719 && mouse_y >= 0
   left = click ? inputs.mouse.button_left : !!inputs.keyboard.key_down.left
   right = click ? inputs.mouse.button_right : !!inputs.keyboard.key_down.right
   x, y = $board.square(mouse_x, mouse_y)
   info = $board.grid[x][y]
   new_piece = if right && [:empty, :backslash].include?(info[:piece]) then :slash
               elsif left && [:empty, :slash].include?(info[:piece]) then :backslash
               else nil
               end
   return if new_piece.nil?
   info[:piece] = new_piece.to_sym
   remove_item(x, y, $piece_list)  # remove the old one
   $piece_list << Piece.new(x, y, "sprites/#{new_piece}.png", :slash, BLUE).values
end

# Remove item at board location from the specified array
def remove_item(x, y, item_array)
   item_array.delete_if do |item|
      x1, y1 = $board.square(item[0], item[1])  # item square
      x == x1 && y == y1
   end
end

# Update if entering a new board square
def update_square(x, y)
   return if $current_square == [x, y] || $start_delay
   $previous_square = $current_square.dup
   $current_square = [x, y]
   $in_progress = false
   info = $board.grid[$previous_square[0]][$previous_square[1]]
   info[:piece] = :hit if info[:piece] == :hitting
end

# Main engine loop
def tick(args)
   set_up_setup if args.state.tick_count.zero?
   outputs = args.outputs
   outputs.background_color = DARK_GRAY
   outputs.sprites << $piece_list
   outputs.sprites << $target_list
   do_keyboard(args.inputs)
   show_menu(outputs)
   return if game_over?
   center = $menu_edge + (1280 - $menu_edge).idiv(2)
   if game_starting?
      outputs.labels << [center, 690, "Ready in #{$start_delay}", 2, 1, *WHITE]
   else
      if (args.state.tick_count % 60).zero?
         $elapsed_time += 1
         $countdown -= 1
      end
      do_controller(args.inputs)
      do_mouse(args.inputs)
      update_square(*$player.update)
      perform_action
      outputs.sprites << $player.values
      outputs.labels << [center, 690, 'GO!', 2, 1, *WHITE]
      outputs.labels << [center, 600, "Targets: #{$target_list.count}", 2, 1, *WHITE]
      outputs.labels << [center, 40, "Framerate: #{format('%.2f', args.gtk.current_framerate)}", 0, 1, *WHITE]
   end
end


##############################
#### Miscellaneous Stuff  ####
##############################

# Format elapsed seconds into mm:ss
def format_time(seconds)
   seconds > 1800 ? '@%$!!' : format('%02d:%02d',
                                     (seconds.idiv(60) % 60).to_s,
                                     (seconds % 60).to_s)
end

# Slide deflector sound up/down a note.
def thing_that_goes_ping
   notes = [440, 494, 523, 587, 659, 698, 784, 880, 988, 1047, 1175]
   $tone_index = (rand < 0.5 ? $tone_index - 1 : $tone_index + 1).clamp(0, notes.count - 1)
   $gtk.args.outputs.sounds << "sounds/ping#{notes[$tone_index]}.wav"  # 'sounds/boing.wav'
end

# Play a sound once at game end.
def one_shot(sound)
   return if $one_shot
   $gtk.args.outputs.sounds << sound
   $one_shot = true
end

# Slowly shift the menu background tint.
def tint_background
   if ($gtk.args.state.tick_count % 10).zero?
      color = $color_shift[element = rand(3)]  # ... and I did that too for the big finish
      $color_shift[element] = (rand < 0.5 ? color + 2 : color - 2).clamp(128, 255)
   end
   $gtk.args.outputs.primitives << [$menu_edge, 0, 1280 - $menu_edge, 719,
                                    'sprites/background.png',
                                    0, 255, *$color_shift].sprites
end

