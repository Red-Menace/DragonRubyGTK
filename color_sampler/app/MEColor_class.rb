
#
#  A class for creating and manipulating RGB color hashes by name or index.
#
#  A default color set is defined in the class, other sets are from included modules.
#  Color sets include keys for the palette display name and count, for example:
#     SET_NAME = { palette_name: 'Display Name', palette_count: 32,
#                  'color_name' =>     [r, g, b],
#                  'color_index' =>    [r, g, b] }
#  Note that the indexing methods don't count these keys when using named
#  color sets (e.g. the first actual color is 0).
#
#  Color.new will look up the color set hash if a name is provided, or a color set
#  hash can also be used.  Color sets must have the palette keys listed above.
#
#  The class RGB by color or index methods will also accept color hashes.  Care
#  should be taken with key names for indexed sets to prevent overwriting and
#  preserve order if merging with other sets.  A percentage can also be used for
#  the index, and indexes will wrap.
#
#  Values are 0-255 integers instead of 0.0 - 1.0 floats to match existing
#  web documentation, tools, and DragonRuby GTK, although there are a few
#  conversion methods to work with hexadecimals and floats.
#
#  Class Methods:
#     Colors.color_set(set_name = 'Basics')
#     Colors.base_color_set(set_name = 'Basics')
#     Colors.color_group(name_array = nil, names_only = false)
#     Colors.merged_set
#     Colors.rgb_by_name(color_name = 'gray', set = 'Basics')
#     Colors.name_group(name_array = [], set = 'Basics')
#     Colors.rgb_by_index(color_index = 0, set = 'Basics')
#     Colors.index_group(index_array = [], set = 'Basics')
#     Colors.name_from_rgb(rgb_array, set = nil)
#     Colors.rgb_from_hex(hex_string)
#     Colors.hex_from_rgb(rgb_array)
#     Colors.float_from_rgba(int_rgba)
#     Colors.rgba_from_float(float_rgba)
#     Colors.new(color = 'gray', set = 'Basics', transparency = 255)
#  Instance methods:
#     c.set_color(color = 'gray', set = 'Basics', transparency = nil)
#     c.offset(amount = 0)
#     c.alpha(transparency)
#     c.opposite(lookup = nil)
#     c.contrast(lookup = nil)
#     c.lshift(lookup = nil)
#     c.rshift(lookup = nil)
#     c.tint(amount = 0.0, lookup = nil)
#


class Colors

   include HTMLColors
   include CrayonColors
   include CircularGrayColors
   include CircularRainbowColors
   include RainbowOneColors
   include RainbowTwoColors
   include RGBby64Colors
   include XKCDColors
  

   # Basic colors and inverses (23) - color names are lower case.
   # Provides a default set if other color sets have not been included.
   BASICS = { palette_name: 'Basics', palette_count: 23,
      'red' =>             [255, 0, 0],         #FF0000
      'aqua' =>            [0, 255, 255],       #00FFFF
      
      'lime' =>            [0, 255, 0],         #00FF00
      'magenta' =>         [255, 0, 255],       #FF00FF
      
      'blue' =>            [0, 0, 255],         #0000FF
      'yellow' =>          [255, 255, 0],       #FFFF00
      
      'lighterred' =>      [255, 128, 128],     #FF8080
      'teal' =>            [0, 128, 128],       #008080
      
      'lightergreen' =>    [128, 255, 128],     #80FF80
      'purple' =>          [128, 0, 128],       #800080
      
      'lighterblue' =>     [128, 128, 255],     #8080FF
      'olive' =>           [128, 128, 0],       #808000
      
      'maroon' =>          [128, 0, 0],         #800000
      'lightercyan' =>     [128, 255, 255],     #80FFFF
      
      'green' =>           [0, 128, 0],         #008000
      'lightermagenta' =>  [255, 128, 255],     #FF80FF
      
      'navy' =>            [0, 0, 128],         #000080
      'lighteryellow' =>   [255, 255, 128],     #FFFF80
      
      'black' =>           [0, 0, 0],           #000000
      'white' =>           [255, 255, 255],     #FFFFFF
      
      'gray' =>            [128, 128, 128],     #808080
      'silver' =>          [192, 192, 192],     #C0C0C0
      'darkergray' =>      [64, 64, 64] }       #404040


   ##################################################
   # ――― Attributes ―――
   ##################################################

   attr_reader :set,    # the color set name
               :name,   # the color or index name
               :rgb,    # [red, green, blue] components (0 - 255)
               :alpha,  # transparency (0 - 255)
               :rgba,   # [red, green, blue, alpha] components
               :hex     # hexadecimal equivalent for @rgb (0080FF, etc)


   ##################################################
   #  ――― Class Methods ―――
   ##################################################

   class << self

      def color_set(set_name = 'Basics')
      # Return the hash for the specified color set name.
         return BASICS if set_name.to_s == ''
         symbol = set_name.to_s.upcase.to_sym
         self.const_defined?(symbol) ? self.const_get(symbol) : BASICS
      end
      
      
      def base_color_set(set_name = 'Basics')
      # Return the hash for the specified color set name, less any palette keys.
         color_set(set_name).reject { |key, _| key.to_s.include?('palette_') }
      end
      

      def color_group(name_array = nil, names_only = false)
      # Return an array of hashes for multiple color set names.
      # Returns all included color sets if the name_array parameter is nil.
      # Only the palette names are returned if the names_only flag is trueish.
         sets = name_array.nil? ? Colors.constants : Array(name_array)
         sets.each_with_object([]) do |name, output|
            output << (names_only ? color_set(name)[:palette_name] : color_set(name))
         end
      end
      
      
      def merged_set
      # Return a merged hash of all included color sets.
      # Individual palette keys are merged into a single entry.
      # Take care with indexed color sets to keep desired wrapping, indexes, etc.
         set = color_group.reduce(&:merge).reject { |key, _| key.to_s.include?('palette_') }
         { palette_name: 'Merged Set', palette_count: set.length }.merge(set)
      end


      def rgb_by_name(color_name = 'gray', set = 'Basics')
      # Get RGB values for a color name from a color set name or hash.
      # A gray color is used if the name is not specified or found.
      # Returns an [r, g, b] array.
         set = (set.class == Hash) ? set : color_set(set)
         color_name = set.keys.sample if color_name.to_s == 'random'
         rgb = set[color_name.to_s]
         rgb.class != Array ? [128, 128, 128] : rgb
      end


      def name_group(name_array = [], set = 'Basics')
      # Get an array of RGB values for multiple color names.
      # Returns an array of [r, g, b] arrays.
         name_array.each_with_object([]) do |item, group|
            group << rgb_by_name(item, set)
         end
      end


      def rgb_by_index(color_index = 0, set = 'Basics')
      # Get RGB values by indexing into a color set name or hash.
      # Useful for circular sets or sets that use nameless colors.
      # Indexes wrap to the number of colors.
      # Returns an [r, g, b] array.
         set = (set.class == Hash) ? set : color_set(set)
         count = set.length - 2 # don't count palette keys
         color_index = color_index % count  # wrap
         color_index = (color_index < 0) ? color_index + count : color_index
         rgb = set[set.keys[color_index + 2]]
      end


      def index_group(index_array = [], set = 'Basics')
      # Get an array of RGB values for multiple color indexes.
      # Returns an array of [r, g, b] arrays.
         index_array.each_with_object([]) do |item, group|
            group << rgb_by_index(item, set)
         end
      end


      def name_from_rgb(rgb_array, set = nil)
      # Look up a color name for an RGB array from a color set name or hash.
      # The merged set is used unless a color set is specified.
      # Returns 'unknown' if the RGB array is not found.
         set = merged_set if set.nil?
         name = (set.class == Hash) ? set.key(rgb_array) : color_set(set).key(rgb_array)
         name.nil? ? 'unknown' : name
      end


      def rgb_from_hex(hex_string)
      # Get RGB for a hexadecimal string (0080FF, etc).
      # Returns an [r, g, b] array of integer (0 - 255) values.
         hex_string += '000000'  # pad for incorrect length
         hex_string[0] = '' if hex_string.start_with?('#')
         [ hex_string[0..1].hex, hex_string[2..3].hex, hex_string[4..5].hex ]
      end


      def hex_from_rgb(rgb_array)
      # Get hex for an [r, g, b] array of integer (0 - 255) values.
      # Returns a hexadecimal string (0080FF, etc).
         rgb = rgb_array.map(&:abs)
         format('%02X%02X%02X', rgb[0], rgb[1], rgb[2])
      end

    
      def float_from_rgba(int_rgba)
      # Convert an integer rgba array (0 - 255) to float values (0.0 - 1.0).
      # Returns the original item if it doesn't contain integers.
         rgba = int_rgba.map do |item|
            return int_rgba unless item.class == Fixnum
            item = [0.0, (Float(item) / 255).round(2), 1.0].sort[1]
         end
      end


      def rgba_from_float(float_rgba)
      # Convert a float rgba array (0.0 - 1.0) to integer values (0 - 255).
      # Returns the original item if it doesn't contain floats.
         rgba = float_rgba.map do |item|
            return float_rgba unless item.class == Float
            item = [0, Integer((item * 255) + 0.5), 255].sort[1]
         end
      end

   end


   ##################################################
   # ――― Initialization ―――
   ##################################################
   
   def initialize(color_name = 'gray', set = 'Basics', transparency = 255)
   # Set up a new color object with the specified name, color set, and transparency.
   # Using nil or the default for the transparency sets it to 255 (opaque).
      transparency = 255 if transparency.nil?
      set_color(color_name, set, transparency)  # continue setup
   end


   ##################################################
   #  ――― Instance Methods ―――
   ##################################################

   def set_color(color = 'gray', set = 'Basics', transparency = nil)
   # Set color attributes for a color name or index from a color set name or hash.
   # A nil transparency keeps the current setting.
   # Returns the new color - a gray color is used if the name or index is not found.
      set = (set.class == Hash) ? set : Colors.color_set(set)
      if color.class == Fixnum  # index
         count = set.length - 2 # don't count palette keys
         index = color % count  # wrap
         index = (index < 0) ? index + count : index
         color = set.keys[index + 2]
         @rgb = set[color]
      else
         @rgb = Colors.rgb_by_name(color, set)
      end
      @name = (@rgb == [128, 128, 128]) ? 'gray' : color
      @set = set[:palette_name]
      alpha(transparency) unless transparency.nil?
      @rgba = @rgb + [@alpha]
      @hex = Colors.hex_from_rgb(@rgb)
      self
   end


   def offset(amount = 0)
   # Set a new color by offsetting from the current color by a +/- integer
   # amount or percentage (0.0 - 1.0).  Indexes wrap to the number of colors.
   # Returns the new color.
      return self if amount == 0
      set = Colors.color_set(@set)
      count = set.length - 2
      if amount.class == Float && amount <= 1.0  # percent
         amount = Integer(amount * count + 0.05)
      end
      index = set.keys.index(@name) - 2 + amount
      set_color(index, set, nil)  # set the new color
   end
   
   
   def alpha(transparency)
   # Set the color's transparency from an integer (0 - 255) or percentage (0.0 - 1.0).
   # Returns the alpha value (0 - 255).
      @alpha = transparency
      @alpha *= 255 if transparency.class == Float && transparency <= 1.0
      @alpha = [0, @alpha.round.to_i, 255].sort[1]
      @rgba = @rgb + [Integer(@alpha)]
      @alpha
   end


   def opposite(lookup = nil)
   # Set the color to its complementary RGB values.
   # Returns the [r, g, b] array.
      @rgb = [ 255 - @rgb[0], 255 - @rgb[1], 255 - @rgb[2] ]
      update(lookup)
   end


   def contrast(lookup = nil)
   # Set the color to contrasting black or white RGB values.
   # Returns the [r, g, b] array.
      sum = @rgb.inject(0){|sum, x| sum + x }
      @rgb = (sum / 3) < 128 ? [255, 255, 255] : [0, 0, 0]
      update(lookup)
   end


   def lshift(lookup = nil)
   # Shift the color's RGB array values left (b <- r, r <- g, g <- b).
   # Returns the [r, g, b] array.
      @rgb = [ @rgb[1], @rgb[2], @rgb[0] ]
      update(lookup)
   end


   def rshift(lookup = nil)
   # Shift the color's RGB array values right (r -> g, g -> b, b -> r).
   # Returns the [r, g, b] array.
      @rgb = [ @rgb[2], @rgb[0], @rgb[1] ]
      update(lookup)
   end


   def tint(amount = 0.0, lookup = nil)
   # Add tint (toward white) or subtract shade (toward black) to RGB array values.
   # Amount can be +/- integer (0 - 255) or percentage (0.0 - 1.0).
   # Returns the [r, g, b] array.
      @rgb = @rgb.each_with_object([]) do |component, result|
         if amount.class == Float && amount.abs <= 1.0
            if amount < 0
               value = Integer(component * (1.0 + amount) + 0.5)
            else
               value = Integer(component + ((255 - component) * amount) + 0.5)
            end
         else
            value = component + Integer(amount)
         end
         result << [0, value, 255].sort[1]
      end
      update(lookup)
   end


   ##################################################
   #  ――― Private / Protected Methods ―――
   ##################################################
   
   private

   def update(lookup = nil)
   # Update color attributes for the current RGB value in the current color set.
   # The name isn't looked up by default, as most RGB changes will result in 'unknown'.
   # Returns the [r, g, b] array.
      @rgba = @rgb + [@alpha]
      @hex = Colors.hex_from_rgb(@rgb)
      @name = Colors.name_from_rgb(@rgb, @set) unless lookup.nil?
      @rgb
   end

end

