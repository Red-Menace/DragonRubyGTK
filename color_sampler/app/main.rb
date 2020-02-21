
require 'palettes/RGB_by_64_color_set.rb'
require 'palettes/html_color_set.rb'
require 'palettes/crayon_color_set.rb'
require 'palettes/circular_gray_color_set.rb'
require 'palettes/circular_rainbow_color_set.rb'
require 'palettes/xkcd_color_set.rb'

require 'app/MEColor_class.rb'


def file_display
# get file text based on color set
   case $color_set
   when 'RGB_by_64' then "File:  'palettes/RGB_by_64_color_set.rb'"
   when 'html' then "File:  'palettes/html_color_set.rb'"
   when 'crayons' then "File:  'palettes/crayon_color_set.rb'"
   when 'circular_rainbow' then "File:  'palettes/circular_rainbow_color_set.rb'"
   when 'circular_grays' then "File:  'palettes/circular_gray_color_set.rb'"
   when 'xkcd' then "File:  'palettes/xkcd_color_set.rb'"
   else
      "Basic (default) color set"
   end
end


def do_key_press(keyboard)
# get a key press to set the color set
   keys = keyboard.truthy_keys
   case
   when keys.include?(:six) then $color_set = 'RGB_by_64'
   when keys.include?(:h) then $color_set = 'html'
   when keys.include?(:c) then $color_set = 'crayons'
   when keys.include?(:r) then $color_set = 'circular_rainbow'
   when keys.include?(:g) then $color_set = 'circular_grays'
   when keys.include?(:x) then $color_set = 'xkcd'
   when keys.include?(:q)  # quit
      exit
   else
      $color_set = 'basics'
   end
   $set = Colors.base_color_set($color_set)
   $number = $set.length
   keyboard.truthy_keys.clear
end


#  There aren't any optimizations, so the game loop is not overly speedy.
#  The color sets are just being thrown out there.
def tick args
   
   do_key_press(args.inputs.keyboard) if args.inputs.keyboard.truthy_keys.length > 1
   
   #top half and file label
   args.outputs.solids << [0, 360, 1280, 360, 255, 255, 255]
   args.outputs.labels << [20, 600, file_display, 2, 0, 0, 0, 0]
   
   # bottom half and color set label
   args.outputs.solids << [0, 0, 1280, 360, 0, 0, 0]
   args.outputs.labels << [20, 140, "Color set is '#{$color_set}', with #{$number} colors.", 2, 0, 255, 255, 255]
   args.outputs.labels << [20, 40, "[(b)ase, (c)rayons, (g)rays, (h)tml, (r)ainbow, (x)kcd, (6)4, (q)uit]", 2, 0, 255, 255, 255]
   
   width = 1280.idiv($number)  # width for each color
   offset = (1280 - ($number * width)).idiv(2)  # center
   count = 0
   (0..($number - 1)).each do |item|  # go though each actual color index
      (count..(count + width)).each do |x|  # and draw width number of lines
         x = x + offset
         rgb = Colors.rgb_by_index(item, $set)  # look up the color
         args.outputs.lines << [x, 180, x, 540, *rgb]
      end
      count += width  # for the next one
   end

end

$color_set = 'basics'  # see do_key_press
$set = Colors.base_color_set($color_set)
$number = $set.length


