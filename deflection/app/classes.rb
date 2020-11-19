
#
# DEFLECTION - deflect a moving player into randomly placed targets.
# Cobbled together by red_menace[at]menace-enterprises[dot]com, November 2020.
#
# These are the game classes and their methods:
#     Board - holds game board information such as size, data for the squares,
#             and has utility methods for conversions to/from screen coordinates.
#     Piece - has information for a piece on the board.
#     Player - keeps information about the player piece, and includes methods
#              for updating and centering the position.
#

# Some color constants
RED = [255, 0, 0]          # indicates a target square
GREEN = [0, 255, 0]        # a target that has been hit
BLUE = [0, 0, 255]         # game pieces (deflectors) and the ball entry point
BLACK = [0, 0, 0]
DARK_GRAY = [64, 64, 64]
GRAY = [128, 128, 128]
SILVER = [192, 192, 192]
WHITE = [255, 255, 255]

##############################
#### The game board       ####
##############################
class Board

   attr_accessor :grid     # grid of squares and their data
   attr_reader :size       # the board square size
   attr_reader :width      # number of squares wide
   attr_reader :height     # number of squares high

   def initialize
      @width = 1040.idiv($board_size)  # space for menu and scoreboard
      @height = 720.idiv($board_size)
      $gtk.args.outputs.static_solids << create_grid
   end
   
   # Create a 2-dimensional grid of squares with default data.
   # Background shows through spaces between squares for grid lines.
   def create_grid
      @grid = Array.new(@width) do |x|
         Array.new(@height) do |y|
            {x: x * $board_size + 2,  # screen left - border is 2
             y: y * $board_size + 2,  # screen bottom
             w: $board_size - 4,  # reduce a bit for grid lines - spaces are 4
             h: $board_size - 4,
             r: 192,
             g: 192,  # lighter gray than the default background
             b: 192,
             piece: :empty}  # see Piece class for values
         end
      end
   end
   
   # Get the board square at the specified screen point (does not wrap).
   def square(screen_x, screen_y)
      [screen_x.idiv($board_size).clamp(0, @width - 1),
       screen_y.idiv($board_size).clamp(0, @height - 1)]
   end
   
   # Get the screen rectangle for the specified board square (lower left).
   def square_rect(board_x, board_y)
      info = @grid[board_x.clamp(0, @width - 1)][board_y.clamp(0, @width - 1)]
      [info[:x] - 1, info[:y] - 1, $board_size - 2, $board_size - 2]  # offset for grid lines
   end
   
   # Get the hash of the board square at the specified screen point.
   def square_info(screen_x, screen_y)
      square_x, square_y = square(screen_x, screen_y)
      @grid[square_x][square_y]
   end
   
end


##############################
#### The game pieces      ####
##############################
class Piece

   attr_accessor :path     # sprite file path
   attr_accessor :type     # :target, :hitting, :hit, :slash, :backslash, :empty
   attr_accessor :color    # sprite tint
   attr_reader :x, :y      # board square location
   attr_reader :rect       # sprite rectangle [x, y, w, h]
   
   def initialize(board_x, board_y, path, type = :empty, color = WHITE)
      @x, @y = board_x, board_y
      @path = path
      @type = type
      @color = color
      @rect = $board.square_rect(@x, @y)  # screen
   end
   
   # Return an array of values for output rendering.
   def values
      @rect + [@path, 0, 255, *@color]
   end
   
end


##############################
#### The player piece     ####
##############################
class Player

   attr_accessor :x, :y       # screen location
   attr_accessor :path        # sprite file path
   attr_accessor :direction   # current direction (:up, :down, :left, :right)
   attr_accessor :color       # sprite tint
   attr_reader :scale         # player sprite size
   attr_reader :fall          # nil for wraparound, otherwise boolean if fell off edge
   
   def initialize(board_x, board_y, direction = :right)
      info = $board.grid[board_x][board_y]  # board square hash
      @scale = $board_size.idiv(2)
      offset = ($board_size - @scale).idiv(2) - 2  # border space is 2
      @x, @y = info[:x] + offset, info[:y] + offset  # location from board square
      @direction = direction
      @fall = ($game_mode == :simple || $game_mode == :timed) ? nil : false
      @color = WHITE
      @path = 'sprites/white_circle.png'
   end
   
   # Return an array of values for output rendering.
   def values
      offset = @scale.idiv(2)
      x = @x + offset  # center
      y = @y + offset
      [@x, @y, @scale, @scale, @path, 0, 255, *@color]
   end
   
   # Return the direction vector array.
   def vector
      case @direction
      when :up then [0, $player_speed]
      when :down then [0, -$player_speed]
      when :left then [-$player_speed, 0]
      when :right then [$player_speed, 0]
      else
         [0, 0]  # oops (stop)
      end
   end
   
   # Update the player position from the current settings.
   # Returns the current board square under the center of the player.
   def update
      @x, @y = [@x, @y].zip(vector).map { |a, b| a + b }  # add arrays
      max_x = $board_size * $board.width.to_i
      if @fall.nil?  # wraparound
         @x = -$board_size.idiv(2) if @x > (max_x + $board_size.idiv(4)).to_i
         @x = (max_x + $board_size.idiv(4)).to_i if @x < -$board_size.idiv(2)
         @y = -@scale if @y > 719
         @y = 719 if @y < -@scale
      else  # fall off edge
         return [0, 0] if $elapsed_time < 2  # unless starting, which is off the edge
         @fall = true if @y < 0 ||
                         @y > 719 ||
                         @x < 0 ||
                         @x > max_x
      end
      $board.square(*center)
   end
   
   # Return player center point.
   def center
      offset = @scale.idiv(2)
      [@x + offset, @y + offset]
   end
   
   # (Re)align the player sprite with board square centers.
   def realign
      info = $board.square_info(*center)  # square rectangle
      offset = ($board_size - @scale).idiv(2) - 2  # offset to center  
      @x = info[:x] + offset  # reset to rectangle + offsets
      @y = info[:y] + offset
   end
   
end

