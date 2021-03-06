
#
#  An example demonstrating the Color class.
#
#  The initial color display is from the HTML set.
#
#  250 (default) rectangles are drawn each tick
#  with random size, location, color, and opacity.
#  0 - 100 new rectangles are cycled in each tick.
#


# get some additional colors
require 'app/html_color_set.rb'

# and the class that uses them
require 'app/MEColor_class.rb'


class Sample

   attr_accessor :outputs


   def show  # show the color set with swatches and names
      top, left = 690, 15
      outputs.labels << { x: left,
                          y: top + 15,
                          text: 'Color set groups',
                          font: 'fonts/Arial Rounded Bold.ttf' }
      top -= 36
      Colors.color_group(['Basics', 'Reds', 'Pinks', 'Oranges', 'Yellows',
                            'Greens', 'Cyans', 'Blues', 'Purples', 'Browns',
                            'Whites', 'Grays']).each do |group|
         label_text = "#{group[:palette_name]}  (#{group[:palette_count]})"
         spacer = ' ' * ((22 - label_text.length) / 2)  # center the label
         outputs.labels << { x: left,
                             y: top + 15,
                             text: spacer + label_text,
                             size_enum: -4,
                             alignment_enum: 0,
                             font: 'fonts/Arial Rounded Bold.ttf' }
         top -= 18
         group.each_key do |key|
            next if key.to_s.include?('palette_')
            outputs.solids << [left, top, 100, 17, Colors.rgb_by_name(key, group[:palette_name])]
            outputs.labels << [left + 105, top + 15, key, -4, 0]
            top -= 18
            if top < 50  # new column
               top = 690
               left += 250
            end
         end
      end
      outputs.labels << { x: 15,
                          y: 40,
                          text: "Press space to continue, or wait #{($starting / 60).round} seconds ...",
                          font: 'fonts/Arial Rounded Bold.ttf' }
      outputs.labels << { x: 1015,
                          y: 105,
                          size_enum: -4,
                          text: 'Arrow keys = speed up, down, stop, full',
                          font: 'fonts/Arial Rounded Bold.ttf' }
      outputs.labels << { x: 1015,
                          y: 90,
                          size_enum: -4,
                          text: 'Space = randomize boxes',
                          font: 'fonts/Arial Rounded Bold.ttf' }
      outputs.labels << { x: 1015,
                          y: 75,
                          size_enum: -4,
                          text: 'Return = this color display',
                          font: 'fonts/Arial Rounded Bold.ttf' }
      outputs.labels << { x: 1015,
                          y: 60,
                          size_enum: -4,
                          text: 'q = quit',
                          font: 'fonts/Arial Rounded Bold.ttf' }
     $starting -= 1
   end
      
end


class Boxes

   attr_accessor :state, :inputs, :outputs

   def rectangle  # create a random rectangle
      box = Colors.new('random', $full_set, 255 - rand(192))  # color
      [ rand(1280), rand(720),            # location
        260 - rand(250), 260 - rand(250), # size 10-260 x 10-260
        *box.rgba ]                       # color and opacity values
   end


   def main  # draw random rectangles of random colors at randon locations (randomly)
      new_boxes = "#{$increment} new boxes in #{QUANTITY} per tick,"
      framerate = "framerate: #{$gtk.current_framerate.to_i}"
      outputs.labels << { x: 0,
                          y: 20,
                          text: " #{new_boxes}  #{framerate}", 
                          font: 'fonts/Arial Rounded Bold.ttf' }
      state.boxes ||= QUANTITY.map { rectangle }  # keep track of the boxes
      outputs.solids << state.boxes
      state.boxes.slice!(0, $increment)  # cycle in a few new ones
      state.boxes += $increment.map { rectangle }
   end
      
end


def change_speed(speed)  # shift in more or less rectanges at a time
   curve = [0, 1, 2, 4, 9, 16, 25, 36, 49, 64, 100]  # speed curve (per tick)
   $increment = curve[speed]
   if $increment > QUANTITY  # speed limit
      $speed = (curve.select { |i| i <= QUANTITY }).count - 1
      $increment = curve[$speed]
   end
end


def do_key_press(keyboard)  # handle key presses (modifier keys are ignored)
   keys = keyboard.truthy_keys
   case
   when keys.include?(:up)  # speed up
      change_speed($speed += 1) unless $speed >= 10
   when keys.include?(:right)  # full speed
      change_speed($speed = 10)
   when keys.include?(:down)  # slow down
      change_speed($speed -= 1) unless $speed <= 0
   when keys.include?(:left)  # stop
      change_speed($speed = 0)
   when keys.include?(:space)  # single step
      $starting = 0
      $example.state.boxes = nil
   when keys.include?(:enter)  # restart countdown
      $starting = 30 * 60 
      change_speed($speed = 4)
   when keys.include?(:q)  # quit
      exit
   end
   keyboard.truthy_keys.clear
end


def setup
   $full_set = Colors.color_set('Merged Set')  # all the colors

   QUANTITY = 250  # number of boxes per tick (try to keep under 1500 or so)
   $starting = 60 * 30  # timeout
   change_speed($speed = 4)

   $samples = Sample.new
   $example = Boxes.new
   
end


def tick args  # the main render loop
   setup if args.state.tick_count == 0
   $samples.outputs = args.outputs
   $example.state = args.state
   $example.inputs = args.inputs
   $example.outputs = args.outputs
   $starting > 0 ? $samples.show : $example.main
   do_key_press(args.inputs.keyboard) unless args.inputs.keyboard.truthy_keys.empty?
end

