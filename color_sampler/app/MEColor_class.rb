
#
#  A class for creating and manipulating RGB color hashes by name or index.
#
#  A basic default color set is included, other sets are from included modules.
#  Color sets include keys for the palette display name and count, for example:
#     SET_NAME = { palette_name: 'Display Name', palette_count: 32,
#                  'color_name' =>     [r, g, b],
#                  'color_index' =>    [r, g, b] }
#
#  Plain hashes can also be passed to the RGB by color or index methods; they
#  should only have color name keys.  Care should be taken with key names for
#  indexed sets to prevent overwriting and preserve order if merging with other
#  sets.  A percentage can also be used for the index, and indexes will wrap.
#
#  Values are 0-255 integers instead of 0.0 - 1.0 floats to match existing
#  web documentation, tools, and DragonRuby GTK, although there are a few
#  conversion methods to work with hexadecimals and floats.
#
#  Class Methods:
#     Color.color_set(set_name = 'Basics')
#     Color.base_color_set(set_name = 'Basics')
#     Color.color_group(name_array = nil, names_only = false)
#     Color.merged_set
#     Color.rgb_by_name(color_name = 'gray', set = 'Basics')
#     Color.name_group(name_array = [], set = 'Basics')
#     Color.rgb_by_index(color_index = 0, set = 'Basics')
#     Color.index_group(index_array = [], set = 'Basics')
#     Color.lookup(rgb_array, set = nil)
#     Color.rgb_from_hex(hex_string)
#     Color.hex_from_rgb(rgb_array)
#     Color.float_from_rgba(int_rgba)
#     Color.rgba_from_float(float_rgba)
#     Color.new(color_name = 'gray', set = 'Basics', transparency = 255)
#  Instance methods:
#     c.set_color(color_name = 'gray', set = 'Basics', transparency = nil)
#     c.alpha=(transparency)
#     c.opposite(name_lookup = nil)
#     c.contrast(name_lookup = nil)
#     c.lshift(name_lookup = nil)
#     c.rshift(name_lookup = nil)
#     c.shade(amount = 0.0, name_lookup = nil)
#     c.tint(amount = 0.0, name_lookup = nil)
#


class Colors

   include RGBby64Colors
   include HTMLColors
   include CrayonColors
   include CircularGrayColors
   include CircularRainbowColors
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

   attr_reader :name,   # the color or index name
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
         symbol = set_name.to_s.upcase.to_sym
         self.const_defined?(symbol) ? self.const_get(symbol) : BASICS
      end
      
      
      def base_color_set(set_name = 'Basics')
      # Return the hash for the specified color set name less any palette keys.
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
         rgb = color_name.to_s.include?('palette_') ? nil : set[color_name.to_s]
         rgb.nil? ? [128, 128, 128] : rgb
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
      # Indexes wrap to the number of colors, and can also be a percentage (0.0 - 1.0).
      # Returns an [r, g, b] array.
         if (set.class == Hash)  # passed color hash without set tags
            hash_arg = true
            count = set.length
         else  # get an included color hash
            hash_arg = false
            set = color_set(set)
            count = set.length - 2  # don't count set tags
         end
         if color_index.class == Float && color_index <= 1  # percent
            color_index = Integer(color_index.abs * count + 0.5)
         end 
         color_index = color_index % count  # wrap
         color_index = (color_index < 0) ? color_index + count : color_index
         hash_arg ? color_index : color_index += 2  # offset index
         rgb = set[set.keys[color_index]]
      end


      def index_group(index_array = [], set = 'Basics')
      # Get an array of RGB values for multiple color indexes.
      # Returns an array of [r, g, b] arrays.
         index_array.each_with_object([]) do |item, group|
            group << rgb_by_index(item, set)
         end
      end


      def lookup(rgb_array, set = nil)
      # Try to find a color name for the specified RGB array.
      # The merged set is searched unless a color set is specified.
      # Returns 'unknown' if the RGB array is not found in the color set name or hash.
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
            return int_rgba unless item.class == Integer
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
      color(color_name, set, transparency)  # continue setup
   end


   ##################################################
   #  ――― Instance Methods ―――
   ##################################################

   def color(color_name = 'gray', set = 'Basics', transparency = nil)
   # Set color attributes for the specified name.
   # A nil transparency keeps the current setting.
   # Returns the new color - a gray color is used if the name is not specified or found.
      color_name = set.keys.sample if color_name.to_s == 'random'
      @rgb = Colors.rgb_by_name(color_name, set)
      @name = (@rgb == [128, 128, 128]) ? 'gray' : color_name
      alpha(transparency) unless transparency.nil?
      @rgba = @rgb + [@alpha]
      @hex = Colors.hex_from_rgb(@rgb)
      self
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
   alias alpha= alpha
   
   
   def opposite(name_lookup = nil)
   # Set complementary RGB values.
   # Returns the [r, g, b] array.
      @rgb = [ 255 - @rgb[0], 255 - @rgb[1], 255 - @rgb[2] ]
      update(name_lookup)
   end
   
   
   def contrast(name_lookup = nil)
   # Set contrasting black or white RGB values.
   # Returns the [r, g, b] array.
      sum = @rgb.inject(0){|sum, x| sum + x }
      @rgb = (sum / 3) < 128 ? [255, 255, 255] : [0, 0, 0]
      update(name_lookup)
   end


   def lshift(name_lookup = nil)
   # Shift RGB array values left (b <- r, r <- g, g <- b).
   # Returns the [r, g, b] array.
      @rgb = [ @rgb[1], @rgb[2], @rgb[0] ]
      update(name_lookup)
   end


   def rshift(name_lookup = nil)
   # Shift RGB array values right (r -> g, g -> b, b -> r).
   # Returns the [r, g, b] array.
      @rgb = [ @rgb[2], @rgb[0], @rgb[1] ]
      update(name_lookup)
   end
   
   
   def shade(amount = 0.0, name_lookup = nil)
   # Subtract shade (toward black) from RGB array values.
   # Amount can be an integer (0 - 255) or percentage (0.0 - 1.0).
   # Returns the [r, g, b] array.
      @rgb = @rgb.each_with_object([]) do |item, result|
         if amount.class == Float && amount <= 1.0
            value = Integer(item * (1.0 - amount) + 0.5)
         else
            value = item - Integer(amount)
         end
         result << [0, value, 255].sort[1]
      end
      update(name_lookup)
   end

   
   def tint(amount = 0.0, name_lookup = nil)
   # Add tint (toward white) to RGB array values.
   # Amount can be an integer (0 - 255) or percentage (0.0 - 1.0).
   # Returns the [r, g, b] array.
      @rgb = @rgb.each_with_object([]) do |item, result|
         if amount.class == Float && amount <= 1.0
            value = Integer(item + ((255 - item) * amount) + 0.5)
         else
            value = item + Integer(amount)
         end
         result << [0, value, 255].sort[1]
      end
      update(name_lookup)
   end


   ##################################################
   #  ――― Private / Protected Methods ―――
   ##################################################
   
   private

   def update(name_lookup = nil)
   # Update color attributes from the current RGB value.
   # The name isn't updated by default, as most likely there won't be a match.
   # Returns the [r, g, b] array.
      @rgba = @rgb + [@alpha]
      @hex = Colors.hex_from_rgb(@rgb)
      @name = Colors.lookup(@rgb) unless name_lookup.nil?
      @rgb
   end

end

