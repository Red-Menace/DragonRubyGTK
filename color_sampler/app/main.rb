
#
#  Color class example / palette sampler.
#
#  Initial color display is from the Basic (default) set.
#
#  Each time a new color set is chosen (the options are shown along
#  the bottom of the display), a set of static lines are generated using
#  the palette colors.  The tint/shade of the colors can also be varied.
#
#  The current color name and RGB at the mouse location is also shown,
#  although a large color set such as xkcd will only be using a single
#  line per color.
#


require 'palettes/crayon_color_set.rb'
require 'palettes/circular_gray_color_set.rb'
require 'palettes/html_color_set.rb'
require 'palettes/circular_rainbow_color_set.rb'
require 'palettes/rainbow_one_color_set.rb'
require 'palettes/rainbow_two_color_set.rb'
require 'palettes/RGB_by_64_color_set.rb'
require 'palettes/xkcd_color_set.rb'

require 'app/MEColor_class.rb'


def file_display(color_set)
# get file text based on color set
   case color_set
   when 'crayons' then "File:  'palettes/crayon_color_set.rb'"
   when 'circular_grays' then "File:  'palettes/circular_gray_color_set.rb'"
   when 'html' then "File:  'palettes/html_color_set.rb'"
   when 'circular_rainbow' then "File:  'palettes/circular_rainbow_color_set.rb'"
   when 'rainbow_one' then "File:  'palettes/rainbow_one_color_set.rb'"
   when 'rainbow_two' then "File:  'palettes/rainbow_two_color_set.rb'"
   when 'RGB_by_64' then "File:  'palettes/RGB_by_64_color_set.rb'"
   when 'xkcd' then "File:  'palettes/xkcd_color_set.rb'"
   else
      'Basic (default) color set'
   end
end


def do_key_press(args)
# get a key press to choose the color set
   keys = args.inputs.keyboard.truthy_keys
   color_set = case
               when keys.include?(:b) then 'basics'
               when keys.include?(:one) then 'rainbow_one'
               when keys.include?(:two) then 'rainbow_two'
               when keys.include?(:c) then 'crayons'
               when keys.include?(:g) then 'circular_grays'
               when keys.include?(:h) then 'html'
               when keys.include?(:r) then
                  keys.include?(:shift) ? 'RGB_by_64' : 'circular_rainbow'
               when keys.include?(:x) then 'xkcd'
               when keys.include?(:q)  # quit
                  exit
               end
   unless color_set.nil?
      args.state.color_set = color_set
      args.state.set = Colors.color_set(color_set)
      args.state.number = args.state.set.length - 2
      args.state.tint = 0  # reset for new color set
      args.state.new_sample = true
   end
   args.inputs.keyboard.truthy_keys.clear
end


def do_tint(args)
   args.state.repeating += 1
   return unless args.state.repeating % 10 == 0  # slow down
   args.state.repeating = 0
   key_held = args.inputs.keyboard.key_held
   if key_held.zero
      args.state.tint = 0  # reset
   elsif key_held.equal_sign || key_held.plus
      args.state.tint += 5  # lighter
   elsif key_held.hyphen || key_held.underscore
      args.state.tint -= 5  # darker
   else
      return
   end
   args.state.tint = args.state.tint.clamp(0, 255)
   args.inputs.keyboard.truthy_keys.clear
   args.state.new_sample = true
end


def do_mouse(args)
# display name and RGB of the color at the mouse location
   width = 1280.idiv(args.state.number)  # width for each color
   offset = (1280 - (args.state.number * width)).idiv(2)  # center
   x, y = args.mouse.x, args.mouse.y
   index = (x - offset).idiv width
   key = args.state.set.keys[index + 2]  # the key/color name
   if !key.nil? && x >= offset && y >= 220 && y <= 580  # only the color set
      name_text = "The color at the mouse pointer is \"#{key}\""
      name_text += " - rgb#{Colors.new(key, args.state.set).tint(args.state.tint)} (tint = #{args.state.tint})"  # RGB with any tint
      args.outputs.labels << [20, 130, name_text, 2, 0, 255, 255, 255]
   end
end


def build_sample(args)
# Make and return an array of lines from the color set.
   args.outputs.static_lines.clear
   sample = []
   
   width = 1280.idiv(args.state.number)  # width for each color
   offset = (1280 - (args.state.number * width)).idiv(2)  # center
   count = 0
   (0..(args.state.number - 1)).each do |item|  # go though each color item
      (count..(count + width)).each do |x|  # and draw width number of lines
         x += offset
         color = Colors.new(item, args.state.set)  # look up the color by index
         color.tint!(args.state.tint)  # tint/shade it
         sample << [x, 220, x, 580, *color.rgb]
      end
      count += width  # for the next one
   end
   args.state.new_sample = false
   sample
end


def defaults(args)
   args.state.color_set = 'basics'
   args.state.set = Colors.color_set('basics')
   args.state.number = args.state.set.length - 2  # skip palette tags
   args.state.tint = 0
   args.state.repeating = 0
   args.state.new_sample = true
end


def tick(args)
   defaults(args) if args.state.tick_count == 0
   
   #top half with file label
   args.outputs.solids << [0, 400, 1280, 320, 255, 255, 255]
   args.outputs.labels << [20, 690, "Framerate: #{args.gtk.current_framerate.to_i}", 2, 0, 0, 0, 0] 
   args.outputs.labels << [20, 660, file_display(args.state.color_set), 2, 0, 0, 0, 0]
   
   # bottom half with color set label and options
   args.outputs.solids << [0, 0, 1280, 400, 0, 0, 0]
   args.state.text = "The name of this color set is '#{args.state.color_set}', it has #{args.state.number} colors."
   args.outputs.labels << [20, 160, args.state.text, 2, 0, 255, 255, 255]
   args.outputs.labels << [20, 40, "tint[-|0|+], rainbow(1)(2)(r), (b)asics, (c)rayon, (g)rays, (h)tml, (R)GBby64, (x)kcd, (q)uit", 2, 0, 255, 255, 255]
   
   do_tint(args) if args.inputs.keyboard.key_held.truthy_keys  # repeating
   do_key_press(args) if args.inputs.keyboard.truthy_keys.length > 1
   do_mouse(args)
   args.outputs.static_lines << build_sample(args) if args.state.new_sample
end

