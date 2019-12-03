
#
#  Standard color name definitions (RGB 0 - 255).
#
#  Most modern browsers and applications support pretty much any color,
#  but these are the earlier web-safe colors that have been given names.
#

# Basic colors and inverses
# Conflicting inverse color names are resolved with 'light[er]' and 'dark[er]'
BASICS = { group_name: 'Basics', group_count: 23,
   'black' =>  [0, 0, 0],         'white' =>         [255, 255, 255],
   'blue' =>   [0, 0, 255],       'yellow' =>        [255, 255, 0],
   'lime' =>   [0, 255, 0],       'magenta' =>       [255, 0, 255],
   'aqua' =>   [0, 255, 255],     'red' =>           [255, 0, 0],
   'navy' =>   [0, 0, 128],       'lighteryellow' => [255, 255, 128],
   'green' =>  [0, 128, 0],       'lightmagenta' =>  [255, 128, 255],
   'teal' =>   [0, 128, 128],     'lightred' =>      [255, 128, 128],
   'maroon' => [128, 0, 0],       'lightercyan' =>   [128, 255, 255],
   'purple' => [128, 0, 128],     'lightergreen' =>  [128, 255, 128],
   'olive' =>  [128, 128, 0],     'lighterblue' =>   [128, 128, 255],
   'gray' =>   [128, 128, 128],     
   'silver' => [192, 192, 192],   'darkergray' =>    [64, 64, 64] }


# HTML colors by group (140) - color names are lower case
# https://www.w3schools.com/colors/colors_groups.asp
# https://www.rapidtables.com/web/color/html-color-codes.html
REDS = { group_name: 'Reds', group_count: 9,
   'lightsalmon' => [255, 160, 122],   'salmon' =>     [250, 128, 114],
   'darksalmon' =>  [233, 150, 122],   'lightcoral' => [240, 128, 128],
   'indianred' =>   [205, 92, 92],     'crimson' =>    [220, 20, 60],
   'red' =>         [255, 0, 0],       'firebrick' =>  [178, 34, 34],
   'darkred' =>     [139, 0, 0] }


PINKS = { group_name: 'Pinks', group_count: 6,
   'pink' =>          [255, 192, 203],   'lightpink' =>       [255, 182, 193],
   'hotpink' =>       [255, 105, 180],   'deeppink' =>        [255, 20, 147],
   'palevioletred' => [219, 112, 147],   'mediumvioletred' => [199, 21, 133] }


ORANGES = { group_name: 'Oranges', group_count: 5,
   'orange' =>    [255, 165, 0],    'darkorange' => [255, 140, 0],
   'coral' =>     [255, 127, 80],   'tomato' =>     [255, 99, 71],
   'orangered' => [255, 69, 0] }
   

YELLOWS = { group_name: 'Yellows', group_count: 11,
   'yellow' =>               [255, 255, 0],     'gold' =>         [255, 215, 0],     
   'lightyellow' =>          [255, 255, 224],   'lemonchiffon' => [255, 250, 205],
   'lightgoldenrodyellow' => [250, 250, 210],   'papayawhip' =>   [255, 239, 213],
   'moccasin' =>             [255, 228, 181],   'peachpuff' =>    [255, 218, 185],
   'palegoldenrod' =>        [238, 232, 170],   'khaki' =>        [240, 230, 140],
   'darkkhaki' =>            [189, 183, 107] }


GREENS = { group_name: 'Greens', group_count: 19,
   'greenyellow' =>       [173, 255, 47],    'chartreuse' =>     [127, 255, 0],
   'lawngreen' =>         [124, 252, 0],     'lime' =>           [0, 255, 0],
   'yellowgreen' =>       [154, 205, 50],    'limegreen' =>      [50, 205, 50],
   'palegreen' =>         [152, 251, 152],   'lightgreen' =>     [144, 238, 144],
   'mediumspringgreen' => [0, 250, 154],     'springgreen' =>    [0, 255, 127],
   'mediumseagreen' =>    [60, 179, 113],    'seagreen' =>       [46, 139, 87],
   'forestgreen' =>       [34, 139, 34],     'green' =>          [0, 128, 0],
   'darkgreen' =>         [0, 100, 0],       'olive' =>          [128, 128, 0],
   'olivedrab' =>         [107, 142, 35],    'darkolivegreen' => [85, 107, 47],
   'darkseagreen' =>      [143, 188, 143] }
   

CYANS = { group_name: 'Cyans', group_count: 13,
   'lightcyan' =>        [224, 255, 255],   'aqua' =>            [0, 255, 255],
   'cyan' =>             [0, 255, 255],     'paleturquoise' =>   [175, 238, 238],
   'aquamarine' =>       [127, 255, 212],   'turquoise' =>       [64, 224, 208],
   'darkturquoise' =>    [0, 206, 209],     'mediumturquoise' => [72, 209, 204],
   'mediumaquamarine' => [102, 205, 170],   'lightseagreen' =>   [32, 178, 170],
   'cadetblue' =>        [95, 158, 160],    'darkcyan' =>        [0, 139, 139],
   'teal' =>             [0, 128, 128] }


BLUES = { group_name: 'Blues', group_count: 18,
   'steelblue' =>    [70, 130, 180],    'lightsteelblue' =>  [176, 196, 222],
   'lightblue' =>    [173, 216, 230],   'powderblue' =>      [176, 224, 230],
   'lightskyblue' => [135, 206, 250],   'skyblue' =>         [135, 206, 235],
   'deepskyblue' =>  [0, 191, 255],     'cornflowerblue' =>  [100, 149, 237],
   'dodgerblue' =>   [30, 144, 255],    'royalblue' =>       [65, 105, 225],
   'blue' =>         [0, 0, 255],       'mediumblue' =>      [0, 0, 205],
   'darkblue' =>     [0, 0, 139],       'navy' =>            [0, 0, 128],
   'midnightblue' => [25, 25, 112],     'mediumslateblue' => [123, 104, 238],
   'slateblue' =>    [106, 90, 205],    'darkslateblue' =>   [72, 61, 139] }


PURPLES = { group_name: 'Purples', group_count: 15,
   'lavender' =>     [230, 230, 250],   'thistle' =>      [216, 191, 216],
   'plum' =>         [221, 160, 221],   'violet' =>       [238, 130, 238],
   'orchid' =>       [218, 112, 214],   'fuchsia' =>      [255, 0, 255],
   'magenta' =>      [255, 0, 255],     'mediumorchid' => [186, 85, 211],
   'meduimpurple' => [147, 112, 219],   'blueviolet' =>   [138, 43, 226],
   'darkviolet' =>   [148, 0, 211],     'darkorchid' =>   [153, 50, 204],
   'darkmagenta' =>  [139, 0, 139],     'purple' =>       [128, 0, 128],
   'indigo' =>       [75, 0, 130] }


BROWNS = { group_name: 'Browns', group_count: 17,
   'cornsilk' =>      [255, 248, 220],   'blanchedalmond' => [255, 235, 205],
   'bisque' =>        [255, 228, 196],   'navajowhite' =>    [255, 222, 173],
   'wheat' =>         [245, 222, 179],   'burlywood' =>      [222, 184, 135],
   'tan' =>           [210, 180, 140],   'rosybrown' =>      [188, 143, 143],
   'sandybrown' =>    [244, 164, 96],    'goldenrod' =>      [218, 165, 32],
   'darkgoldenrod' => [184, 134, 11],    'peru' =>           [205, 133, 63],
   'chocolate' =>     [210, 105, 30],    'saddlebrown' =>    [139, 69, 19],
   'sienna' =>        [160, 82, 45],     'brown' =>          [165, 42, 42],
   'maroon' =>        [128, 0, 0] }


WHITES = { group_name: 'Whites', group_count: 17,
   'white' =>      [255, 255, 255],   'snow' =>          [255, 250, 250],
   'honeydew' =>   [240, 255, 240],   'mintcream' =>     [245, 255, 250],
   'azure' =>      [240, 255, 255],   'aliceblue' =>     [240, 248, 255],
   'ghostwhite' => [248, 248, 255],   'whitesmoke' =>    [245, 245, 245],
   'seashell' =>   [255, 245, 238],   'beige' =>         [245, 245, 220],
   'oldlace' =>    [253, 245, 230],   'floralwhite' =>   [255, 250, 240],
   'ivory' =>      [255, 255, 240],   'antiquewhite' =>  [250, 235, 215],
   'linen' =>      [250, 240, 230],   'lavenderblush' => [255, 240, 245],
   'mistyrose' =>  [255, 228, 225] }


GRAYS = { group_name: 'Grays', group_count: 10,
   'gainsboro' =>      [220, 220, 220],   'lightgray' => [211, 211, 211],
   'silver' =>         [192, 192, 192],   'darkgray' =>  [169, 169, 169],
   'gray' =>           [128, 128, 128],   'dimgray' =>   [105, 105, 105],
   'lightslategray' => [119, 136, 153],   'slategray' => [112, 128, 144],
   'darkslategray' =>  [47, 79, 79],      'black' =>     [0, 0, 0] }


# full set (147)
COLORS = { group_name: 'Full_Set', group_count: 147 }
         .merge([BASICS, REDS, PINKS, ORANGES, YELLOWS, GREENS, CYANS, BLUES, PURPLES,
         BROWNS, WHITES, GRAYS].reduce(&:merge).reject { |k, _| k.include?('group_') })


#
#  A class for creating and manipulating the above RGB colors by name.
#

class Color

   ##################################################
   # ――― Attributes ―――
   ##################################################

            
   attr_reader :name,   # the color name - default color will be 'gray'
               :rgb,    # [red, green, blue] components 0 - 255
               :alpha,  # transparency 0 - 255
               :rgba,   # [red, green, blue, alpha] components
               :hex     # hexadecimal equivalent for RGB (0080FF, etc)


   ##################################################
   #  ――― Class Methods ―――
   ##################################################
   
   class << self
   
      # Get RGB values for a color name from the specified color_set hash.
      # A gray color is used if the name is not specified or found.
      # Returns an [r, g, b] array.
      def rgb_color(color_name = 'gray', color_set = COLORS)
         color_set = COLORS if color_set.class != Hash
         if color_name.to_s == 'random'
            name_list = color_set.keys.reject { |k| k.include?('group_') }  # don't include info
            color_name = name_list.sample
         end
         color_set[color_name.to_s].tap { |rgb| rgb = [128, 128, 128] if rgb.nil? }
      end
      
      
      # Get multiple RGB values for the specified names.
      # Returns an array of RGB arrays.
      def rgb_group(name_array = [], color_set = COLORS)
         name_array.each_with_object([]) do |item, group|
            group << Color.rgb_color(item, color_set)
         end
      end


      # Get RGB for a hexadecimal (0080FF, etc) string.
      # Returns an [r, g, b] array of integer (0 - 255) values.
      def rgb_from_hex(hex_string)
         hex_string += '000000'  # pad for incorrect length
         hex_string[0] = '' if hex_string.start_with?('#')
         [ hex_string[0..1].hex, hex_string[2..3].hex, hex_string[4..5].hex ]
      end


      # Get hex for an [r, g, b] array of integer (0 - 255) values.
      # Returns a hexadecimal string (0080FF, etc).
      def hex_from_rgb(rgb_array)
         rgb = rgb_array.dup.map(&:abs)
         format('%02X%02X%02X', rgb[0], rgb[1], rgb[2])
      end
      
      
      # Convert integer rgb array (0 - 255) to float values (0.0 - 1.0).
      # Returns the original argument if it doesn't contain integers.
      def rgb_to_float(rgb_array)
         rgb = rgb_array.dup.map do |item|
            return rgb_array unless item.class == Fixnum
            item = [0.0, item.abs / 255, 1.0].sort[1]
         end
      end
      
      
      # Convert float rgb array (0.0 - 1.0) to integer values (0 - 255).
      # Returns the original argument if it doesn't contain floats.
      def float_to_rgb(rgb_array)
         rgb = rgb_array.dup.map do |item|
            return rgb_array unless item.class == Float
            item = [0, (item.abs * 255).to_i, 255].sort[1]
         end
      end

   end


   ##################################################
   # ――― Initialization ―――
   ##################################################
   
   # Initialize a new color object, with the specified name, transparency, and color set.
   # Specifying nil (or using the default) for the transparency sets it to 255 (opaque).
   # The new color will be a default gray if the name is not specified or found.
   def initialize(color_name = 'gray', transparency = 255, color_set = COLORS)
      transparency = 255 if transparency.nil?
      color(color_name, transparency, color_set)
   end


   ##################################################
   #  ――― Instance Methods ―――
   ##################################################

   # Set color properties from the specified name.
   # Specifying nil (or using the default) for the transparency keeps the current setting.
   # Returns the new color - a default gray is used if the name is not specified or found.
   def color(color_name = 'gray', transparency = nil, color_set = COLORS)
      color_set = COLORS if color_set.class != Hash
      @rgb = Color.rgb_color(color_name, color_set)
      alpha(transparency) unless transparency.nil?
      @rgba = @rgb.dup << @alpha
      @hex = Color.hex_from_rgb(@rgb)
      @name = color_set.key(@rgb)
      @name = 'gray' if @name.nil?  # bad color_set
      self
   end
   alias color= color


   # Set the color's transparency.
   # Returns the alpha value.
   def alpha(transparency)
      @alpha = [0, transparency.to_i, 255].sort[1]  # 0 - 255
      @rgba = @rgb.dup << @alpha
      @alpha
   end
   alias alpha= alpha


   # Get complementary RGB values.
   # Returns an [r, g, b] array.
   def opposite
      [ 255 - @rgb[0], 255 - @rgb[1], 255 - @rgb[2] ]
   end


   # Shift RGB array values left (b <- r, r <- g, g <- b)
   # Returns an [r, g, b] array.
   def lshift
      [ @rgb[1], @rgb[2], @rgb[0] ]
   end


   # Shift RGB aray values right (r -> g, g -> b, b -> r)
   # Returns an [r, g, b] array.
   def rshift
      [ @rgb[2], @rgb[0], @rgb[1] ]
   end

end

