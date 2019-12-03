
#
#  An example demonstrating the Color class.
#


$dragon.require('app/Colors.rb')  # the class


class Sample
   attr_accessor :outputs

   # Show color sets with swatches and names.
   def show
      top, left = 690, 15
      outputs.labels << [left, top + 15, 'Color set groups']
      top -= 36
      [BASICS, REDS, PINKS, ORANGES, YELLOWS, GREENS, CYANS,
       BLUES, PURPLES, BROWNS, WHITES, GRAYS].each do |group|
         label_text = "#{group[:group_name]}  (#{group[:group_count]})"
         spacer = ' ' * ((16 - label_text.length) / 2)  # center the label (total 16)
         outputs.labels << [left, top + 15, spacer + label_text, -4, 0]
         top -= 18
         group.each_key do |key|
            next if key.start_with?('group_')
            outputs.solids << [left, top, 100, 17, Color.rgb_color(key, group)]
            outputs.labels << [left + 105, top + 15, key, -4, 0]
            top -= 18
            if top < 50  # new column
               top = 690
               left += 250
            end
         end
      end
      outputs.labels << [15, 40, "Press space to continue, or wait #{($starting / 60).round} seconds ..."]
      $starting -= 1
   end
   
end


class Boxes
   attr_accessor :state, :inputs, :outputs

   # Create a random rectangle.
   def rectangle
      box = Color.new('random', 255 - rand(192))
      [ rand(1280), rand(720),            # location
        260 - rand(250), 260 - rand(250), # size 10-260 x 10-260
        *box.rgba ]                       # color and opacity values
   end


   # Draw random rectangles of random colors at randon locations (randomly).
   def main
      outputs.labels << [0, 20, "#{$increment}"]
      state.boxes ||= 200.map { rectangle }
      outputs.solids << state.boxes
      state.boxes.slice!(0, $increment)  # cycle in a few new rectangles
      state.boxes += $increment.map { rectangle }  # new array triggers update
   end
   
end


# change speed in 3 ranges (10, 5, or 1) - apparent change in
# speed is a result of shifting in/out more rectanges at a time
def change_speed(step)
   step = step.negative? ? -1 : 1
   case
   when $increment < 10 then $increment += (1 * step)
   when $increment < 50 then $increment += (5 * step)
   else
      $increment += (10 * step)
   end 
end


# the main loop
def tick args
   $samples.outputs = args.outputs
   $example.state = args.state
   $example.inputs = args.inputs
   $example.outputs = args.outputs
   
   $starting > 0 ? $samples.show : $example.main
   
   case  # get key inputs
   when args.inputs.keyboard.key_down.up  # speed up
      change_speed(1) unless $increment >= 100
   when args.inputs.keyboard.key_down.right  # full speed
      $increment = 100
   when args.inputs.keyboard.key_down.down  # slow down
      change_speed(-1) unless $increment <= 0
   when args.inputs.keyboard.key_down.left  # stop
      $increment = 0 
   when args.inputs.keyboard.key_down.space  # single step
      $starting = 0
      $example.state.boxes = nil
   when args.inputs.keyboard.key_down.enter  # restart countdown
      $starting = 30 * 60 
      $increment = 5
   when args.inputs.keyboard.key_down.q  # quit
      exit
   end
end


$samples = Sample.new
$example = Boxes.new

$starting = 60 * 30  # timeout
$increment = 5  # 'speed'

