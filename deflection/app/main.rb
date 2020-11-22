
#
# DEFLECTION - deflect a moving player into randomly placed targets.
# Cobbled together by red_menace[at]menace-enterprises[dot]com, November 2020.
#
# The playing board is a grid of squares populated with targets that must be hit.
# Your player is represented by a ball that enters along a side of the playing
# field - the location is random, but is hinted at by a countdown label.
# The ball is deflected by pieces placed onto the board by right/left clicking in
# a square - these pieces cannot be (re)moved, but may be changed.
# There is a display of the number of targets remaining and elapsed/remaining time.
#
# You win and progress when all targets are hit (the square will change color).
#
# Difficulty is by game mode, grid size (which is also used in determining the number
# of targets), player speed, and time:
#     Game modes are:
#        normal         just hit all targets; edges wrap
#        timed          a countdown timer is added
#        edges          the game is over if you go off an edge
#        combo1         timed + edges
#        hits           the game is over if you hit previous targets
#        combo2         timed + hits
#        combo3         edges + hits
#     Grid sizes are 13x9, 17x12, 23x16, 26x18, and 34x24.
#     Speeds are 3, 4, 6, 9, 13 (the speed also appears higher in denser grids).
#     Targets are some (height), more ((width+height)/2), and lots (width).
#
#     Countdown time is scaled from the grid size and player speed, and probably
#     needs to be (re)adjusted for the number of targets and game mode.
#
# You lose (settings stay the same) if the chosen difficulties are triggered, or if
# the ball has traveled the equivalent of 3 board widths without hitting a target.
#

require 'app/classes.rb'

##############################
#### Game setup stuff     ####
##############################

# Globals and initial settings.
def set_up_setup
   # general settings
   $game_mode = :normal       # game mode (normal, timed, edges, combo1, hits, combo2)
   $board_size = 80           # board square size (pixels)
   $player_speed = 3          # movement increment (pixels)
   $targets = :some           # :some, :more, :lots
   $start_delay = 6           # initial start delay/countdown (seconds)
   $countdown = 45            # timed game countdown (seconds)
   $time_warning = 9          # countdown time warning (25% left)
   
   # game items
   $board = nil               # the playing board (object)
   $piece_list = []           # list of game pieces (deflectors, etc)
   $target_list = []          # list of targets
   $player = nil              # the player piece (object)
   $current_square = []       # the current player square
   $previous_square = []      # the previous player square
   $in_progress = false       # is an action for a square in progress?
   $elapsed_time = 0          # elapsed game time
   $game_running = false      # is the game running?
   $one_shot = false          # one-shot trigger for game over sound
   
   # menu selection items
   $mode_choices = ['normal', 'timed', 'edges', 'combo1', 'hits', 'combo2', 'combo3']
   $size_choices = [80, 60, 45, 40, 30]   # square sizes that scale reasonably
   $speed_choices = [3, 4, 6, 9, 13]      # steps are 1, 2, 3, and 4
   $target_choices = [:some, :more, :lots]
   $menu_edge = 1040                      # initial board/menu edge
   
   # other
   $color_shift = [128, 128, 128]   # background tint
   $tone_index = 5                  # initial index into the tone scale
   $consecutive = 0                 # consecutive squares without action...
   $cheat = false                   # ...unless this mode is enabled?!
   
   # initial setup
   create_board
   create_player
end

# (Re)start game with current settings.
def restart(time = 6)
   $start_delay = time
   $game_running = true
   $elapsed_time = 0
   $one_shot = false
   $consecutive = 0
   $board = nil
   $piece_list = []
   $target_list = []
   $player = nil
   $args.outputs.static_solids.clear  # clear out the old board
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
   offsets = [-3, -2, -1, 1, 2, 3]  # try not to line up too close
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
   $start_delay -= 1 if $start_delay && ($args.state.tick_count % 60).zero?
   $start_delay = nil if $start_delay < 0
   unless $start_delay.nil?
      x, y = $current_square
      $args.outputs.sprites << Piece.new(x, y, 'sprites/white_square.png', :empty, BLUE).values
      scale = $board_size.idiv(2)
      $args.outputs.labels << [$board.grid[x][y].x + scale,
                               $board.grid[x][y].y + scale + scale.idiv(2) + 2,
                               $start_delay.to_s,
                               $board_size.idiv(40) * 5,  # scale to square size
                               1,
                               *WHITE]
   end
   $start_delay
end


##############################
#### Instructions & Menu  ####
##############################

# Show instructions for the current game mode setting.
def instructions
   labels, offset = [], 340
   labels << [$menu_edge + 20, offset -= 15, 'Hit all targets with the ball', -3, 0, *WHITE]
   labels << [$menu_edge + 20, offset -= 15, 'by placing deflectors in its', -3, 0, *WHITE]
   labels << [$menu_edge + 20, offset -= 15, $cheat ? 'path.' : 'path to progress.', -3, 0, *WHITE]
   labels << [$menu_edge + 20, offset - 15, "* 'no hits' counter disabled", -3, 0, *WHITE] if $cheat
   offset = offset -= 15  # advance line regardless of that last one
   choices = $mode_choices[0]
   choices = ['edges', 'timed'] if choices == 'combo1' 
   choices = ['hits', 'timed'] if choices == 'combo2'
   choices = ['hits', 'edges'] if choices == 'combo3'
   Array(choices).each do |choice|
      case choice
      when 'timed'
         labels << [$menu_edge + 20, offset -= 15, '+ beat the countdown timer', -3, 0, *WHITE]
      when 'edges'
         labels << [$menu_edge + 20, offset -= 15, "+ don't fall off the edges", -3, 0, *WHITE]
      when 'hits'
         labels << [$menu_edge + 20, offset -= 15, "+ don't run into previously", -3, 0, *WHITE]
         labels << [$menu_edge + 20, offset -= 15, '   hit targets', -3, 0, *WHITE]
      end
   end
   $args.outputs.labels << labels
end

# Get text for the menu labels.
# Returns text for the game mode, grid size, player speed, and target quantity.
def menu_texts
   mode = case $mode_choices[0]
            when 'combo1' then ['timed', 'edges']
            when 'combo2' then ['timed', 'hits']
            when 'combo3' then ['hits', 'edges']
            else Array($mode_choices[0])
            end.join('+') << "#{$cheat ? : '*' : ''}"
   size = $size_choices[0]
   grid = "#{1040.idiv(size)}x#{720.idiv(size)}"
   speed_index = [3, 4, 6, 9, 13].index($speed_choices[0])
   speed = ['slowest', 'slow', 'medium', 'fast', 'fastest'][speed_index]
   [mode, grid, speed, $target_choices[0].to_s]
end

# Show the game menu (right side of board/screen).
def show_menu
   tint_background
   instructions
   labels, offset = [], 565
   mode_text, grid_text, speed_text, target_text = menu_texts
   labels << [$menu_edge + 25, offset -= 25, '[R]un new game:', 0, 0, *WHITE]
   labels << [$menu_edge + 43, offset -= 25, "[M]ode = #{mode_text}", 0, 0, *WHITE]
   labels << [$menu_edge + 43, offset -= 25, "[G]rid = #{grid_text}", 0, 0, *WHITE]
   labels << [$menu_edge + 43, offset -= 25, "[S]peed = #{speed_text}", 0, 0, *WHITE]
   labels << [$menu_edge + 43, offset -= 25, "[T]argets = #{target_text}", 0, 0, *WHITE]
   labels << [$menu_edge + 25, offset -= 25, '[F]orfeit / Stop', 0, 0, *WHITE]
   labels << [$menu_edge + 25, offset -= 25, '[Q]uit', 0, 0, *WHITE]
   labels << [$menu_edge + 25, 180, 'Left click', 0, 0, *WHITE]
   labels << [$menu_edge + 25, 160, 'or arrow', 0, 0, *WHITE]
   labels << [$menu_edge + 25, 120, 'Right click', 0, 0, *WHITE]
   labels << [$menu_edge + 25, 100, 'or arrow', 0, 0, *WHITE]
   $args.outputs.labels << labels
   $args.outputs.primitives << [$menu_edge + 170, 140, 40, 40, 'sprites/menu_backslash.png'].sprite
   $args.outputs.primitives << [$menu_edge + 170, 80, 40, 40, 'sprites/menu_slash.png'].sprites
end


##############################
#### Control Stuff        ####
##############################

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
   elsif keys.include?(:c) then $cheat = !$cheat  # ?!
   elsif keys.include?(:q) then exit  # quit
   end
end

# Handle controller buttons.
def do_controller(inputs)
   # if I had a controller to test, this would do some of the same stuff as do_mouse
end

# Handle mouse clicks.
# Control key doesn't work with a mouse/trackpad, so left/right arrows also work as a click.
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


##############################
#### The Main Game Stuff  ####
##############################

# Check if the game is over.
def game_over?
   x, y = $current_square
   color = ($game_mode == :timed || $game_mode == :combo1) &&
           $countdown <= $time_warning ? RED : WHITE
   time = $game_mode == :timed || $game_mode == :combo1 ? $countdown : $elapsed_time
   center = 1280 - (1280 - $menu_edge).idiv(2)
   $args.outputs.labels << [center, 645, "Time: #{format_time(time)}", 2, 1, *color]
   if $elapsed_time > 1800 ||
      (($game_mode == :timed || $game_mode == :combo1) && $countdown <= 0)
      common_label(690, 'TIME IS UP!', 'buzzer')
   elsif ($game_mode == :hits || $game_mode == :combo2) &&
         $board.grid[x][y][:piece] == :hit
      common_label(690, 'Hit previous target', 'bang')
   elsif $player.fall
      common_label(690, 'Fell off the edge', 'oh_no')
   elsif $target_list.count.zero?
      common_label(600, 'All targets hit!', 'flourish', WHITE)
      return true if $cheat  # don't progress
      progress
      restart(11)
   elsif !$cheat && $consecutive >= ($board.width * 3).to_i
      common_label(690, "No hits in #{$consecutive} squares", 'buzzer')
   elsif !$game_running
      common_label(690, 'Game stopped', nil, WHITE)
   else
      return false
   end
   true
end

# Expand 'game over' labels.
def common_label(y, text, sound = nil, color = RED)
   $args.outputs.labels << [1280 - (1280 - $menu_edge).idiv(2), y, text, 2, 1, *color]
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
      $args.outputs.sounds << 'sounds/tink.wav'  # 'sounds/click.wav'
      $consecutive = 0
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

# Update if entering a new board square
def update_square(x, y)
   return if $current_square == [x, y] || $start_delay
   $previous_square = $current_square.dup
   $current_square = [x, y]
   $in_progress = false
   $consecutive += 1
   info = $board.grid[$previous_square[0]][$previous_square[1]]
   info[:piece] = :hit if info[:piece] == :hitting
end

# Main engine loop
def tick(args)
   set_up_setup if args.state.tick_count.zero?
   args.outputs.background_color = DARK_GRAY
   args.outputs.sprites << $piece_list
   args.outputs.sprites << $target_list
   do_keyboard(args.inputs)
   show_menu
   return if game_over?
   center = $menu_edge + (1280 - $menu_edge).idiv(2)
   if game_starting?
      args.outputs.labels << [center, 690, "Ready in #{$start_delay}", 2, 1, *WHITE]
   else
      if (args.state.tick_count % 60).zero?
         $elapsed_time += 1
         $countdown -= 1
      end
      do_controller(args.inputs)
      do_mouse(args.inputs)
      update_square(*$player.update)
      perform_action
      args.outputs.sprites << $player.values
      args.outputs.labels << [center, 690, 'GO!', 2, 1, *WHITE]
      args.outputs.labels << [center, 600, "Targets: #{$target_list.count}", 2, 1, *WHITE]
      args.outputs.labels << [center, 40, "Framerate: #{format('%.2f', args.gtk.current_framerate)}", 0, 1, *WHITE]
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

# Shift deflector sound up/down a note and play it.
def thing_that_goes_ping
   notes = [440, 494, 523, 587, 659, 698, 784, 880, 988, 1047, 1175]
   $tone_index = (rand < 0.5 ? $tone_index - 1 : $tone_index + 1).clamp(0, notes.count - 1)
   $args.outputs.sounds << "sounds/ping#{notes[$tone_index]}.wav"  # 'sounds/boing.wav'
end

# Play a sound once at game end.
def one_shot(sound)
   return if $one_shot
   $args.outputs.sounds << sound
   $one_shot = true
end

# Increase current game settings (wraps to beginning) - does not change game mode.
def progress
   $target_choices.rotate!(1)  # cycle targets
   if $target_choices[0] == :some  # wrapped from maximum
      $speed_choices.rotate!(1)  # cycle speed
      if $speed_choices[0] == 3  # wrapped from maximum
         $size_choices.rotate!(1)  # cycle grid size
      end
   end
end

# Slowly shift the menu background tint.
def tint_background
   if ($args.state.tick_count % 10).zero?
      color = $color_shift[element = rand(3)]  # ... and I did that too for the big finish
      $color_shift[element] = (rand < 0.5 ? color + 2 : color - 2).clamp(128, 255)
   end
   $args.outputs.primitives << [$menu_edge, 0, 1280 - $menu_edge, 719,
                                    'sprites/background.png',
                                    0, 255, *$color_shift].sprites
end

