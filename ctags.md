
### DragonRuby GTK [v65/2.0] extraction from ctags (emacs) 2020-12-10

Note that backticks are used to escape methods bracketed in double underscores (formatting).

#### Select sources are also available on [GitHub](https://github.com/DragonRuby/dragonruby-game-toolkit-contrib/tree/master/dragon)
----


#### ./dragon/numeric_deprecated.rb

- module NumericDeprecated
   - def perc_to_zero start, duration
   - def perc_to_one start, duration
   - def pos?
   - def neg?

#### ./dragon/console_deprecated.rb

- module ConsoleDeprecated
   - def addtext *args
   - def addsprite *args

#### ./dragon/outputs_deprecated.rb

- module GTK
   - module FlatArrayDeprecated
     - def + other
- module GTK
   - module OutputsDeprecated
     - def `__raise_deprecated_primitive_assignment__` prop
     - def `__raise_property_renamed__` old_name, new_name
     - def solids= value
     - def sprites= value
     - def lines= value
     - def labels= value
     - def borders= value
     - def primitives= value
     - def reserved= value
     - def static_solids= value
     - def static_sprites= value
     - def static_lines= value
     - def static_labels= value
     - def static_borders= value
     - def static_primitives= value
     - def static_reserved= value
     - def static_background_color= value
     - def static_background_color

#### ./dragon/runtime_docs.rb

- module RuntimeDocs
   - def docs_class
   - def docs_reset
   - def docs_calcstringbox
   - def docs_write_file
- class GTK::Runtime

#### ./dragon/outputs.rb

- module GTK
   - class Sound
     - def self.parse v
     - def initialize opts = {}
- module GTK
   - class FlatArray < Array
     - def [] *args
     - def initialize reference_name, mark_method, outputs_with_ids
     - def resolve_collection target
     - def mark_and_id! o
     - def resolved? o
     - def add_dwim os
     - def << other
- module GTK
   - class PixelArray
     - def initialize
- module GTK
   - class Outputs   # Each Outputs is a single render pass to a render target (or the window framebuffer).
     - def initialize opts = {}
     - def __initialize_primitives
     - def default_background_color
     - def background_color= value
     - def background_color
     - def tick
     - def can_screenshot?
     - def clear_non_static
     - def clear_non_static_reserved
     - def clear
     - def inspect
     - def serialize
     - def [] value

#### ./dragon/open_entity_docs.rb

- module OpenEntityDocs
   - def docs_class
   - def docs_as_hash
- class GTK::OpenEntity

#### ./dragon/string.rb

- class String
   - def wrapped_lines_recur word, rest, length, aggregate
   - def end_with_bang?
   - def without_ending_bang
   - def wrapped_lines length
   - def wrap length
   - def multiline?
   - def indent_lines amount, char = " "
   - def quote
   - def trim
   - def trim!
   - def ltrim
   - def ltrim!
   - def rtrim
   - def rtrim!
   - def serialize

#### ./dragon/args_deprecated.rb

- module GTK
   - module ArgsDeprecated
     - def dragon
     - def game

#### ./dragon/help.rb

- module GTK
   - class Help
     - def self.primitive_contract primitive_name
     - def self.label_contract
     - def self.solid_border_contract
     - def self.label_contract
     - def self.sprite_contract
     - def self.code_for_class_attributes_as_hash klass
     - def self.serialization_implementation_help klass
   - def serialize
   - def inspect
   - def to_s
     - def self.serialization_too_large

#### ./dragon/console_color.rb

- module GTK
   - class Console
     - class Color
         - def initialize(color)
         - def mult_alpha(alpha_modifier)
         - def to_a
         - def to_h

#### ./dragon/array_docs.rb

- module ArrayDocs
   - def docs_method_sort_order
   - def docs_include_any?
   - def docs_class
   - def docs_reject_nil
   - def docs_reject_false
   - def docs_product
   - def docs_map_2d
   - def docs_any_intersect_rect?
   - class Player
       - def initialize x, y, w, h
       - def serialize
       - def inspect
       - def to_s
   - def docs_map
   - def docs_each
- class Array

#### ./dragon/array.rb

- class Array
   - def reject_nil
   - def reject_false
   - def product other_array = nil
   - def serialize
   - def to_a_pairs
   - def pairs_to_hash
   - def map_2d
   - def any_intersect_rect? other, tolerance = 0.1
   - def sample
   - def rest
   - def << other
   - def + other
   - def include_any? *items
   - def map_with_index *opts, &block

#### ./dragon/attr_sprite.rb

- module AttrRect
   - def left
   - def right
   - def bottom
   - def top
- module AttrSprite
   - def primitive_marker
   - def sprite
   - def x1
   - def x1= value
   - def y1
   - def y1= value

#### ./dragon/tests.rb

- module GTK
   - class Tests
     - def initialize
     - def run_test m
     - def test_methods_focused
     - def test_methods
     - def start
     - def mark_test_failed m, e
     - def running?
     - def log_inconclusive m
     - def log_passed m
     - def log_no_tests_found
     - def test_game_over args, assert
     - def log_test_running m
     - def test_signature_invalid_exception? e, m
     - def log_test_signature_incorrect m
     - def print_summary

#### ./dragon/geometry.rb

- module GTK
   - module Geometry
     - def self.cubic_bezier t, a, b, c, d
     - def inside_rect? outer
     - def intersect_rect? other, tolerance = 0.1
     - def intersects_rect? *args
     - def scale_rect_extended percentage_x: percentage_x,
     - def scale_rect percentage, *anchors
     - def angle_to other_point
     - def angle_from other_point
     - def point_inside_circle? circle_center_point, radius
     - def center_inside_rect other_rect
     - def center_inside_rect_y other_rect
     - def center_inside_rect_x other_rect
     - def anchor_rect anchor_x, anchor_y
     - def angle_given_point other_point
     - def self.shift_line line, x, y
     - def self.intersects_rect? *args
     - def self.line_y_intercept line
     - def self.angle_between_lines line_one, line_two, replace_infinity: nil
     - def self.line_slope line, replace_infinity: nil
     - def self.ray_test point, line
     - def self.line_rect line
     - def self.line_intersect line_one, line_two
     - def self.contract_intersect_rect?
     - def self.intersect_rect? rect_one, rect_two, tolerance = 0.1
     - def self.to_square size, x, y, anchor_x = 0.5, anchor_y = nil
     - def self.distance point_one, point_two
     - def self.angle_from start_point, end_point
     - def self.angle_to start_point, end_point
     - def self.point_inside_circle? point, circle_center_point, radius
     - def self.inside_rect? inner_rect, outer_rect
     - def self.scale_rect_extended rect,
     - def self.scale_rect rect, percentage, *anchors

#### ./dragon/class.rb

- class Class
   - def to_s

#### ./dragon/numeric.rb

- class Numeric
   - def seconds
   - def half
   - def to_byte
   - def elapsed_time tick_count_override = nil
   - def elapsed_time_percent duration
   - def new?
   - def elapsed? offset = 0, tick_count_override = Kernel.tick_count
   - def frame_index *opts
   - def zero?
   - def zero
   - def one
   - def two
   - def five
   - def ten
   - def shift_right i
   - def shift_left i
   - def shift_up i
   - def shift_down i
   - def randomize *definitions
   - def rand_sign
   - def rand_ratio
   - def remainder_of_divide n
   - def ease_extended tick_count_override, duration, default_before, default_after, *definitions
   - def global_ease duration, *definitions
   - def ease duration, *definitions
   - def ease_spline_extended tick_count_override, duration, spline
   - def global_ease_spline duration, spline
   - def ease_spline duration, spline
   - def to_radians
   - def to_degrees
   - def to_square x, y, anchor_x = 0.5, anchor_y = nil
   - def vector max_value = 1
   - def vector_y max_value = 1
   - def vector_x max_value = 1
   - def x_vector max_value = 1
   - def y_vector max_value = 1
   - def mod n
   - def mod_zero? *ns
   - def zmod? n
   - def mult n
   - def fdiv n
   - def idiv n
   - def towards target, magnitude
   - def map_with_ys ys, &block
   - def combinations other_int
   - def percentage_of n
   - def cap i
   - def cap_min_max min, max
   - def lesser other
   - def greater other
   - def subtract i
   - def minus i
   - def add i
   - def plus i
   - def numbers
   - def >= other
   - def > other
   - def <= other
   - def < other
   - def == other
   - def map
   - def map_with_index
   - def check_numeric! sender, other
   - def - other
   - def + other
   - def * other
   - def / other
   - def serialize
   - def from_top
   - def from_right
- class Fixnum
   - def - other
   - def even?
   - def odd?
   - def + other
   - def * other
   - def / other
   - def == other
   - def sign
   - def pos?
   - def neg?
   - def cos
   - def sin
   - def to_sf
   - def ifloor int
- class Float
   - def - other
   - def + other
   - def * other
   - def / other
   - def serialize
   - def sign
   - def replace_infinity scalar
   - def to_sf
   - def ifloor int
- class Integer
   - def round *args

#### ./dragon/console_menu.rb

- module GTK
   - class Console
     - class Menu
       - def initialize console
       - def record_clicked
       - def replay_clicked
       - def reset_clicked
       - def scroll_up_clicked
       - def scroll_down_clicked
       - def show_menu_clicked
       - def close_clicked
       - def hide_menu_clicked
       - def framerate_diagnostics_clicked
       - def itch_wizard_clicked
       - def docs_clicked
       - def scroll_end_clicked
       - def custom_buttons
       - def rect_for_layout row, col
       - def button args
       - def serialize

#### ./dragon/nil_class_false_class.rb

- module NilClassFalseClass
   - def feels_like_an_array? name
   - def `__check_thrash__!` m
   - def frame_index *args
   - def > other
   - def >= other
   - def < other
   - def <= other
   - def + other
   - def unassign_method_missing
   - def unassign_method_missing_and_raise error
   - def assign_method_missing hash, name, thrash_counter
   - def serialize
   - def to_hash
   - def merge *args
   - def inside_rect? *opts
   - def intersect_rect? *opts
   - def point_inside_circle? *opts
- class NilClass
- class FalseClass
- class TrueClass

#### ./dragon/kernel_docs.rb

- module KernelDocs
   - def docs_method_sort_order
   - def docs_class
   - def docs_tick_count
   - def docs_global_tick_count
   - def docs_export_docs!
   - def export_docs!
- module Kernel

#### ./dragon/entity.rb

- module GTK
   - class Entity
     - def self.id!
     - def `self.__reset_id__!`
     - def self.strict_entities
     - def self.parse_serialization_data data
     - def self.parse_serialization_data value
     - def self.new_entity entity_type, init_hash = nil, block = nil
     - def self.new_entity_strict entity_type, init_hash = nil, block = nil

#### ./dragon/args.rb

- module GTK
   - class Args
     - def initialize runtime, recording
     - def tick_count
     - def tick_count= value
     - def serialize
     - def destructure
     - def clear_pixel_arrays
     - def pixel_arrays_clear
     - def pixel_arrays
     - def pixel_array name
     - def clear_render_targets
     - def render_targets_clear
     - def render_targets
     - def render_target name
     - def solids
     - def static_solids
     - def sprites
     - def static_sprites
     - def labels
     - def static_labels
     - def lines
     - def static_lines
     - def borders
     - def static_borders
     - def primitives
     - def static_primitives
     - def keyboard
     - def click
     - def click_at
     - def mouse
     - def controller_one
     - def controller_two

#### ./dragon/runtime/c_bridge.rb

- module GTK
   - class Runtime
     - module CBridge
       - def c_bridge_init __sender
       - def mark_ruby_file_for_reload path
       - def get_ruby_reload_list
       - def reload_complete
       - def current_fps simulation_fps, rendering_fps
       - def print_help_when_mouse_clicked
       - def untransform_mouse_x mousex
       - def untransform_mouse_y mousey
       - def finger_down touchid, touchx, touchy, sender = false
       - def finger_move touchid, touchx, touchy, sender = false
       - def finger_up touchid, sender = false
       - def mouse_move mousex, mousey, sender = false
       - def update_mouse_buttons newbuttons
       - def mouse_button_pressed button, sender = false
       - def mouse_pressed mousex, mousey, sender = false
       - def mouse_button_up button, sender = false
       - def mouse_up mousex, mousey, sender = false
       - def mouse_wheel x, y, sender = false
       - def textinput str
       - def key_down_in_game raw_key, modifier
       - def key_up_in_game raw_key, modifier, sender = false
       - def key_down_raw raw_key, modifier, sender = false
       - def key_up_raw raw_key, modifier, sender = false
       - def controller_key_event player_num, raw_key, event, sender = false
       - def key_down_player_one raw_key, sender = false
       - def key_down_player_two raw_key, sender = false
       - def key_held_player_one raw_key, sender = false
       - def key_held_player_two raw_key, sender = false
       - def key_up_player_one raw_key, sender = false
       - def key_up_player_two raw_key, sender = false
       - def controller_key_down player_num, raw_key, sender = false
       - def controller_key_held player_num, raw_key, sender = false
       - def controller_key_up player_num, raw_key, sender = false
       - def window_keyboard_focus_changed gained
       - def window_mouse_focus_changed gained
       - def analog_to_perc value
       - def left_analog_x_player_1 value, sender = false
       - def left_analog_y_player_1 value, sender = false
       - def right_analog_x_player_1 value, sender = false
       - def right_analog_y_player_1 value, sender = false
       - def left_analog_x_player_2 value, sender = false
       - def left_analog_y_player_2 value, sender = false
       - def right_analog_x_player_2 value, sender = false
       - def right_analog_y_player_2 value, sender = false
       - def background_color
       - def rawjoystick_connected jid, joystickname, guid
       - def rawjoystick_disconnected jid
       - def rawjoystick_axis jid, axis, value
       - def rawjoystick_hat jid, hat, value
       - def rawjoystick_button jid, button, pressed

#### ./dragon/runtime/draw.rb

- module GTK
   - class Runtime
     - module Draw
       - def primitives pass
       - def draw_solid s
       - def draw_sprite s
       - def draw_screenshot s
       - def draw_label l
       - def draw_line l
       - def draw_border s
       - def draw_screenshots
       - def pixel_arrays

#### ./dragon/runtime/hotload.rb

- module GTK
   - class Runtime
     - module Hotload
       - def hotload_init
       - def hotload_on_write_file file_name
       - def files_to_reload
       - def core_files_to_reload
       - def init_mtimes file
       - def reload_ruby_file file
       - def hotload_source_files
       - def check_mailbox
       - def hotload_if_needed
       - def on_load_succeeded file
       - def reload_if_needed file, force = false

#### ./dragon/runtime/framerate.rb

- module GTK
   - class Runtime
     - module Framerate
       - def framerate_init
       - def delta_framerate
       - def reset_framerate_calculation
       - def check_framerate
       - def framerate_diagnostics
       - def framerate_below_threshold?
       - def current_framerate

#### ./dragon/runtime/framerate_diagnostics.rb

- module GTK
   - class Runtime
     - module FramerateDiagnostics
       - def framerate_get_diagnostics
   - def tick args
       - def framerate_warning_message
       - def current_framerate_primitives
       - def framerate_diagnostics_primitives

#### ./dragon/runtime_deprecated.rb

- module GTK
   - class Runtime
     - module Deprecated
       - def current_framerate_raw
       - def suppress_print_help_when_mouse_clicked
       - def suppress_framerate_warning
       - def suppress_print_help_when_mouse_clicked= value
       - def suppress_framerate_warning= value
       - def on_ticks
       - def on_tick *args
       - def take_screenshot= value

#### ./dragon/runtime/version.rb


#### ./dragon/runtime/backup.rb

- module GTK
   - module Backup
     - def backup_directory
     - def backup_load_changes
     - def backup_file file
     - def backup_write_changes changes
     - def backup_create file
     - def backup_create_index
     - def backup_css
     - def backup_html

#### ./dragon/hash.rb

- class Hash
   - def serialize
   - def primitive_marker
   - def include? *args
   - def label
   - def solid
   - def border
   - def line
   - def sprite
   - def x
   - def x1
   - def dx
   - def y
   - def y1
   - def dy
   - def x2
   - def y2
   - def w
   - def h
   - def text
   - def size_enum
   - def alignment_enum
   - def __get_color_from_array_or_primitive v, rgba_symbol
   - def r
   - def g
   - def b
   - def a
   - def font
   - def tile_x
   - def tile_y
   - def tile_w
   - def tile_h
   - def source_x
   - def source_y
   - def source_w
   - def source_h
   - def flip_horizontally
   - def flip_vertically
   - def angle_anchor_x
   - def angle_anchor_y
   - def angle
   - def at
   - def x= value
   - def x1= value
   - def dx= value
   - def y= value
   - def y1= value
   - def dy= value
   - def x2= value
   - def y2= value
   - def w= value
   - def h= value
   - def text= value
   - def size_enum= value
   - def alignment_enum= value
   - def r= value
   - def g= value
   - def b= value
   - def a= value
   - def font= value
   - def tile_x= value
   - def tile_y= value
   - def tile_w= value
   - def tile_h= value
   - def source_x= value
   - def source_y= value
   - def source_w= value
   - def source_h= value
   - def flip_horizontally= value
   - def flip_vertically= value
   - def angle_anchor_x= value
   - def angle_anchor_y= value
   - def angle= value
   - def at= value
   - def path
   - def path= value
   - def rect
   - def new_entity_strict entity_type, &block
   - def new_entity entity_type, &block
   - def pretty_format char = " "
   - def self.pretty_format hash, char = " "
   - def left
   - def right
   - def bottom
   - def top
   - def s
   - def id
   - def to_hash
   - def shift_rect dx, dy
   - def associate hash = nil
   - def anchor_rect x_perc, y_perc

#### ./dragon/hotload_client.rb

- module GTK
   - class HotloadClient
     - def initialize local_ip_address
     - def tick
     - def should_tick?
     - def local_state
     - def get_server_ip_address
     - def server_available?
     - def server_needed?
     - def tick_changes
     - def tick_http_boot
     - def tick_http_changes
     - def tick_process_queue
     - def tick_process_file_retrieval

#### ./dragon/inputs.rb

- module GTK
   - class KeyboardKeys
     - def self.sdl_to_key raw_key, modifier
     - def self.utf_8_char raw_key
     - def self.char_with_shift raw_key, modifier
     - def self.char_to_method_hash
     - def self.char_to_method char, int = nil
     - def clear
     - def left_right
     - def up_down
     - def truthy_keys
     - def all? keys
     - def any? keys
     - def clear_key key
     - def all
     - def get collection
     - def set collection, value = true
     - def method_missing m, *args
     - def serialize
- module GTK
   - class Keyboard
     - def initialize
     - def p
     - def left
     - def right
     - def up
     - def down
     - def clear
     - def serialize
     - def to_s
     - def key
- module GTK
   - class MousePoint
     - def initialize x, y
     - def w; 0; end
     - def h; 0; end
     - def left; x; end
     - def right; x; end
     - def top; y; end
     - def bottom; y; end
     - def created_at_elapsed
     - def to_hash
     - def serialize
     - def inspect
     - def to_s
   - class Mouse
     - def initialize
     - def point
     - def inside_rect? rect
     - def inside_circle? center, radius
     - def clear
     - def up
     - def down
     - def serialize
     - def to_s
   - class FingerTouch
     - def initialize
     - def point
     - def inside_rect? rect
     - def inside_circle? center, radius
     - def serialize
     - def to_s
- module GTK
   - class Inputs
     - def initialize
     - def up
     - def down
     - def left
     - def right
     - def directional_vector
     - def left_right
     - def up_down
     - def click
     - def controller_one
     - def controller_two
     - def clear
     - def serialize

#### ./dragon/primitive.rb

- module GTK
   - module Primitive
     - module Common
         - def primitive_marker
         - def merge *args
     - module Point
         - def x
         - def x= value
         - def x1
         - def x1= value
         - def y
         - def y= value
         - def y1
         - def y1= value
         - def w
         - def h
         - def right
         - def left
         - def top
         - def bottom
         - def point
         - def left
         - def bottom
         - def to_hash
         - def associate hash = nil
     - module Rect
         - def w
         - def w= value
         - def h
         - def h= value
         - def rect
         - def right
         - def x2
         - def top
         - def y2
         - def center_inside_rect *other_rect
         - def shift_rect *args
         - def rect_shift *args
         - def rect_shift_right v
         - def rect_shift_left v
         - def rect_shift_up v
         - def rect_shift_down v
         - def to_hash
     - module Determined
     - module Color
         - def looks_like_a_sprite?
         - def r
         - def r= value
         - def g
         - def g= value
         - def b
         - def b= value
         - def a
         - def a= value
     - module Solid
         - def to_hash
         - def primitive_marker
     - module Border
         - def primitive_marker
         - def to_hash
     - module Label
         - def primitive_marker
         - def text
         - def text= value
         - def defines_enums?
         - def size_enum
         - def size_enum= value
         - def alignment_enum
         - def alignment_enum= value
         - def r
         - def r= value
         - def g
         - def g= value
         - def b
         - def b= value
         - def a
         - def a= value
         - def font
         - def font= value
         - def to_hash
         - def w
         - def h
     - module Line
         - def primitive_marker
         - def x
         - def x= value
         - def y
         - def y= value
         - def x2
         - def x2= value
         - def y2
         - def y2= value
         - def w
         - def h
         - def to_hash
     - module Sprite
         - def primitive_marker
         - def path
         - def path= value
         - def angle
         - def angle= value
         - def a
         - def a= value
         - def r
         - def r= value
         - def g
         - def g= value
         - def b
         - def b= value
         - def tile_x
         - def tile_x= value
         - def tile_y
         - def tile_y= value
         - def tile_w
         - def tile_w= value
         - def tile_h
         - def tile_h= value
         - def flip_horizontally
         - def flip_horizontally= value
         - def flip_vertically
         - def flip_vertically= value
         - def angle_anchor_x
         - def angle_anchor_x= value
         - def angle_anchor_y
         - def angle_anchor_y= value
         - def source_x
         - def source_x= value
         - def source_y
         - def source_y= value
         - def source_w
         - def source_w= value
         - def source_h
         - def source_h= value
         - def to_hash
     - module ConversionCapabilities
         - def raise_ambigous! m
         - def mark_assert!
         - def mark_as_point!
         - def mark_as_rect!
         - def mark_as_solid!
         - def mark_as_border!
         - def mark_as_line!
         - def mark_as_label!
         - def mark_as_primitive! type
         - def mark_as_sprite!
         - def mark_as_common!
         - def path
         - def path= value
         - def inside_rect? outer_rect
         - def intersects_rect? other, tolerance = 0.1
         - def intersect_rect? other, tolerance = 0.1
         - def rect
         - def point
         - def scale_rect percentage, *anchors
         - def scale_rect_extended *args
         - def center_inside_rect *other_rect
         - def text
         - def text= value
         - def left
         - def right
         - def top
         - def bottom
         - def w_half
         - def width_half
         - def h_half
         - def height_half
         - def x
         - def x1
         - def shift_rect *args
         - def rect_shift *args
         - def rect_shift_right v
         - def rect_shift_left v
         - def rect_shift_up v
         - def rect_shift_down v
         - def x= value
         - def x1= value
         - def x2
         - def y2
         - def y= value
         - def y
         - def y1= value
         - def y1
         - def w
         - def w= value
         - def width
         - def h
         - def h= value
         - def height
         - def angle
         - def angle= value
         - def angle_given_point other_point
         - def angle_to other_point
         - def angle_from other_point
         - def a
         - def a= value
         - def point
         - def solid
         - def sprite
         - def label
         - def line
         - def border
         - def to_hash
         - def associate hash = nil
         - def anchor_rect anchor_x, anchor_y
         - def sprites
         - def solids
         - def labels
         - def borders
         - def lines
         - def outputs_add_dwim os, mark_method, primitive_name
         - def outputs_mark! o, mark_method, primitive_name
         - def outputs_resolved? o
         - def outputs_resolve_collection target

#### ./dragon/array_deprecated.rb

- module ArrayDeprecated
   - def any_intersects_rect? *args

#### ./dragon/ios_wizard.rb

- class WizardException < Exception
   - def initialize *console_primitives
- class IOSWizard
   - def initialize
   - def relative_path
   - def steps
   - def get_reserved_sprite png
   - def start
   - def always_fail
   - def check_for_xcode
   - def check_for_brew
   - def init_wizard_status
   - def restart
   - def check_for_dev_profile
   - def determine_app_name
   - def dev_profile_xml
   - def determine_app_id
   - def set_app_name name
   - def set_dev_profile path
   - def blow_away_temp
   - def stage_app
   - def set_app_id id
   - def check_for_device
   - def check_for_certs
   - def idevice_id_cli_app
   - def security_cli_app
   - def xcodebuild_cli_app
   - def valid_certs
   - def connected_devices
   - def cli_app_exist? app
   - def write_entitlements_plist
   - def code_sign
   - def write_info_plist
   - def device_orientation_xml
   - def tmp_directory
   - def app_path
   - def root_folder
   - def write_ip_address
   - def create_ipa
   - def do_zip
   - def sh cmd
   - def deploy

#### ./dragon/controller/keys.rb

- module GTK
   - class Controller
     - class Keys
       - def activate key
       - def deactivate key
       - def clear
       - def truthy_keys

#### ./dragon/controller/config.rb

- module GTK
   - class Controller
      - class Config
         - def initialize runtime
         - def rawjoystick_connected jid, joystickname, guid
         - def rawjoystick_disconnected jid
         - def build_binding_string
         - def move_to_different_part part
         - def previous_part
         - def next_part
         - def set_binding bindstr
         - def rawjoystick_axis jid, axis, value
         - def rawjoystick_hat jid, hat, value
         - def rawjoystick_button jid, button, pressed
         - def calc_fading
         - def render_basics args, msg, fade=255
         - def render_part_highlight args, part, alpha=255
         - def choose_target
         - def render_part_highlight_from_bindstr args, bindstr, alpha=255
         - def play_around args
         - def should_tick?
         - def tick args

#### ./dragon/symbol.rb

- class Symbol
   - def include? v
   - def end_with_bang?
   - def without_ending_bang
   - def start_with? value
   - def gsub *args

#### ./dragon/docs.rb

- module DocsOrganizer
   - def self.sort_docs_classes!
   - def self.reserved_methods
   - def self.class_sort_order
   - def self.check_class_sort_order
- module in it's correct topilogical order.
   - def self.sort_method_delegate l, r, method_sort_order
   - def self.find_methods_with_docs klass
- module Docs
   - def self.extended klass
   - def docs_method_sort_order
   - def docs_classes
   - def docs_all
   - def docs
   - def `self.__docs_search__` words = nil, &block
   - def `__docs_search_help_text__`
   - def `__docs_search_results__` words = nil, &block
   - def docs_search words = nil, &block
   - def `__export_docs__!` opts = {}
   - def export_docs! opts = {}
   - def `__docs_append_true_line__` true_lines, true_line, parse_log
   - def `__docs_to_html__` string
   - def `__docs_line_to_html__` line, parse_log

#### ./dragon/runtime.rb

- module FFI
   - class Draw
     - def serialize
     - def inspect
     - def to_s
- module GTK
   - class Runtime
     - def initialize platform, production, logical_width, logical_height, argv, binary_path
     - def schedule_callback tick_count, &callback
     - def cli_arguments
     - def reset_touch_count
     - def increase_touch_count
     - def process_argsv
     - def quit!
     - def request_quit
     - def quit_requested?
     - def require file
     - def log obj, sender = nil
     - def disable_console
     - def enable_console
     - def show_console reason = nil
     - def start_replay file_name = nil
     - def stop_replay
     - def start_recording seed_value
     - def game_directory file_name
     - def set_rng value
     - def stop_recording file_name = nil
     - def record_input_history name, value_1, value_2, value_count, clear_cache = false
     - def load_image file_name
     - def write_file file_name, text
     - def write_file_root file_name, text
     - def append_file file_name, text
     - def append_file_root file_name, text
     - def read_file file_name
     - def parse_xml xmlstr, stripcontent=true
     - def parse_xml_file fname, stripcontent=true
     - def parse_json jsonstr
     - def parse_json_file fname
     - def set_window_title newtitle
     - class HTTPCallbacks
         - def initialize protect_from_gc
         - def ready newstate
         - def http_response_header
         - def http_response_data
         - def http_done
     - def http_get url, extra_headers=nil
     - def http_head url, extra_headers=nil
     - def http_post url, form_fields=nil, extra_headers=nil
     - def http_put url, fname, extra_headers=nil
     - def `__exception_seems_vague__?` message
     - def export! with_comments = nil, file_name_override = nil
     - def passes
     - def toast id, message
     - def target pass
     - def render_width pass
     - def render_height pass
     - def render_transient pass
     - def raise_conversion_for_rendering_failed p, e, name = nil
     - def draw_primitive p
     - def reset_state
     - def reset rng_override = nil, seed: seed
     - def `__reset__` rng_override = nil, seed: seed
     - def paused?
     - def pause!
     - def unpause!
     - def queue_key_up key
     - def pin_root_values
     - def audio
     - def queue_sound path
     - def queue_music path, repeat
     - def stop_music
     - def dequeue_sounds pass
     - def migrate_legacy_sounds
     - def stage_replay_values
     - def clear_draw_primitives pass
     - def next_keyboard_inputs_before_tick
     - def next_keyboard_inputs_after_tick
     - def clear_draw_passes
     - def clear_inputs
     - def tick_console
     - def quit_after_startup_eval?
     - def print_console_activation_help
     - def tick_runtime
     - def tick_notification
     - def console_button_primitive
     - def tick_gtk_engine_before
     - def tick_gtk_engine_after
     - def tick_usr_engine
     - def is_reloading_files?
     - def skip_tick_usr_engine?
     - def calc_wrapper tick_override_lambda = nil
     - def render_replay_mouse
     - def eval_or_create_main_rb
     - def tick sdl_tick
     - def pretty_print_exception_and_export! e
     - def tick_core
     - def text_font
     - def calcstringbox str, size_enum = 0, font = "font.ttf"
     - def autocomplete_methods
     - def ignore_search_term? word
     - def grep_did_you_mean_recommendations instance, method
     - def grep_did_you_mean instance, method
     - def grep_source_file file, *strings_with_recommendations
     - def grep_source *strings_with_recommendations
     - def tests
     - def log_level
     - def log_levels
     - def log_level= value
     - def seed
     - def slowmo! factor
     - def notify_subdued!
     - def notify! message, duration = 300
     - def system cmd
     - def exec cmd
     - def serialize_state *opts
     - def deserialize_state *args
     - def self.argv_window_width argv
     - def self.argv_window_height argv
     - def self.argv_window_scale argv
     - def self.argv_window_position_x argv
     - def self.argv_window_position_y argv
     - def self.parse_cli_argument_i argv, name, default = 0
     - def self.parse_cli_argument argv, name, default = nil
     - def reset_sprite path
     - def show_cursor
     - def hide_cursor
     - def cursor_shown?
     - def set_window_fullscreen enable=true
     - def openurl url
     - def take_screenshot
     - def serialize
     - def get_base_dir
     - def get_game_dir
     - def save_state
     - def load_state
     - def disable_nil_coersion!
     - def version

#### ./dragon/assert.rb

- module GTK
  - def test_this_works args, assert
- class Assert
   - def custom_assertion actual, expected, message = nil
   - class Assert
     - def ok!
- def test_does_this_work args, assert
- def true! value, message = nil
- def test_does_this_work args, assert
- def false! value, message = nil
- def test_does_this_work args, assert
- def equal! actual, expected, message = nil
- def test_does_this_work args, assert
- def nil! value, message = nil

#### ./dragon/layout.rb

- module GTK
   - class Margin
     - def initialize
     - def serialize
     - def inspect
     - def to_s
   - class SafeArea
     - def initialize
     - def serialize
     - def inspect
     - def to_s
   - class GridArea
     - def initialize
     - def serialize
     - def inspect
     - def to_s
   - class ControlArea
     - def initialize
     - def serialize
     - def inspect
     - def to_s
   - class Device
     - def initialize
     - def assert! result, message
     - def check_math!
     - def serialize
     - def inspect
     - def to_s
   - class AspectRatio
     - def initialize
     - def serialize
     - def inspect
     - def to_s
   - class Layout
     - def initialize w, h
     - def u_for_16x9 w, h
     - def font_relative_size_enum size_enum
     - def font_px_to_pt px
     - def font_pt_to_px pt
     - def font_size_cell
     - def font_size_xl
     - def font_size_lg
     - def font_size_med
     - def font_size_sm
     - def font_size_xs
     - def font_size
     - def logical_rect
     - def safe_rect
     - def control_rect
     - def row_count
     - def col_count
     - def gutter_height
     - def gutter_width
     - def outer_gutter
     - def cell_height
     - def cell_width
     - def rect_defaults
     - def rect opts
     - def rect_center reference, target
     - def rect_row index, h
     - def rect_col index, w
     - def device
     - def init_device w, h
     - def serialize
     - def inspect
     - def to_s

#### ./dragon/attr_gtk.rb

- module AttrGTK
   - def keyboard
   - def grid
   - def state
   - def inputs
   - def outputs
   - def gtk
   - def passes
   - def pixel_arrays
   - def geometry

#### ./dragon/console_prompt.rb

- module GTK
   - class Console
     - class Prompt
         - def initialize(font_style:, text_color:, console_text_width:)
         - def update_cursor_position_px
         - def current_input_str=(str)
         - def <<(str)
         - def backspace
         - def move_cursor_left
         - def move_cursor_right
         - def clear
         - def autocomplete
         - def pretty_print_strings_as_table items
         - def pretty_print_row cells, string_width, cell_width, column_width, columns
         - def pretty_print_row_seperator string_width, cell_width, column_width, columns
         - def render(args, x:, y:)
         - def tick
         - def last_period_index
         - def calc_autocomplete_prefix
         - def current_object
         - def method_candidates(prefix)
         - def display_autocomplete_candidate(candidate)
         - def reset_autocomplete

#### ./dragon/outputs_docs.rb

- module OutputsDocs
   - def docs_method_sort_order
   - def docs_class
   - def docs_borders
   - def docs_solids
   - class Solid
     - def primitive_marker
   - class Square < Solid
     - def initialize x, y, size
   - def docs_screenshots
- class GTK::Outputs

#### ./dragon/itch_wizard.rb

- class ItchWizard
   - def steps
   - def metadata_file_path
   - def get_metadata
   - def write_blank_metadata
   - def check_metadata
   - def set_dev_id value
   - def set_dev_title value
   - def set_game_id value
   - def set_game_title value
   - def set_version value
   - def set_icon value
   - def write_metadata
   - def relative_path
   - def package_command
   - def deploy
   - def start
   - def reset
   - def restart
   - def initialize
   - def init_wizard_status

#### ./dragon/easing.rb

- module GTK
   - module Easing
     - def self.ease_extended start_tick, current_tick, end_tick, default_before, default_after, *definitions
     - def self.ease_spline_extended start_tick, current_tick, end_tick, spline
     - def self.initial_value *definitions
     - def self.final_value *definitions
     - def self.exec_definition definition, start_tick, duration, x
     - def self.identity x
     - def self.flip x
     - def self.quad x
     - def self.cube x
     - def self.quart x
     - def self.quint x

#### ./dragon/readme_docs.rb

- module GTK
   - module ReadMeDocs
     - def docs_method_sort_order
     - def docs_usage
     - def docs_hello_world
     - def docs_deployment
     - def docs_deployment_mobile
     - def docs_dragonruby_philosophy
     - def docs_ticks_and_frames
     - def docs_sprites
   - class Sprite
     - def primitive_marker
   - class BlueSquare < Sprite
     - def initialize opts
     - def docs_labels
     - def docs_sounds
     - def docs_game_state
     - def animate_a_sprite
     - def docs_troubleshooting_performance
     - def docs_faq
   - class ReadMe

#### ./dragon/kernel.rb

- module Kernel
   - def self.tick_count
   - def self.tick_count= value
   - def puts *args
   - def self.global_tick_count
   - def self.global_tick_count= value

#### ./dragon/primitive_deprecated.rb

- module GTK
   - module Primitive
     - module RectDeprecated
       - def w_half
       - def width_half
       - def h_half
       - def height_half

#### ./dragon/mouse_docs.rb

- module MouseDocs
   - def docs_class
- class GTK::Mouse

#### ./dragon/numeric_docs.rb

- module NumericDocs
   - def docs_method_sort_order
   - def docs_frame_index
   - def docs_new?
   - def docs_elapsed?
   - def docs_elapsed_time
- class Numeric

#### ./dragon/controller.rb

- module GTK
   - class Controller
     - def initialize
     - def serialize
     - def clear
     - def up
     - def down
     - def left
     - def right
     - def activate_down(key)
     - def activate_held(key)
     - def activate_up(key)

#### ./dragon/object.rb

- class BareDefinitionsContainer
   - def initialize
   - def args
- class NIL
- class Class
   - def serialize
   - def defaults_alias_method_once
   - def alias_method_once opts = {}
- class ObjectMetadata
   - def self.with_meta o, meta_value
   - def self.meta o
   - def self.meta! o
   - def `self.__meta__`
- module ValueType
- class Object
   - def self.attr *vars
   - def self.attr_accessor *vars
   - def self.attributes
   - def self.new *args
   - def self.gtk_args
   - def self.attr_sprite
   - def attr_sprite
   - def self.attr_rect
   - def attr_rect
   - def self.attr_gtk
   - def attr_gtk
   - def purge_class symbol
   - def raise_immediately e, m, *args
   - def raise_with_caller e, inner_exception
   - def or other
   - def and other
   - def `__supports_ivars__?`
   - def fast_rand
   - def `__gtk_ruby_source_files__`
   - def `__pretty_print_exception__` e, inner_exception = nil
   - def `__gtk_ruby_string_contains_source_file_path__?` s
   - def `__caller_without_noise__`
   - def raise_error_with_kind_of_okay_message e, name, *args
   - def better_instance_information
   - def better_class_hierarchy_information
   - def raise_method_missing_better_error name, *args, &block
   - def `__looks_like_docs__?` name, *args, &block
   - def `__normalized_docs_method__` name, *args, &block
   - def `__try_invoke_docs_method__` name, *args, &block
   - def method_missing_core name, *args, &block
   - def method_missing name, *args, &block
   - def numeric_or_default default = 0
   - def f_or_default default = 0
   - def s_or_default default = ''
   - def i_or_default default = 0
   - def require file
   - def `__custom_object_methods__`
   - def autocomplete_methods
   - def `__object_methods__`
   - def help
   - def to_s
   - def primitive_marker
   - def metadata_object_id
   - def trace! instance = nil
   - def repl &block
   - def xrepl
   - def comment
   - def serialize
   - def inspect
   - def id
   - def associate hash = nil
   - def let
   - def greeting
   - def greeting
   - def ivar m
   - def __help_contract_implementation contract_methods
   - def docs
   - module PersonDocs
     - def docs_class
     - def docs_say_hello
   - class Person
     - def say_hello

#### ./dragon/directional_input_helper_methods.rb

- module GTK
   - module DirectionalInputHelperMethods
     - def self.included klass
     - def left_right
     - def up_down
     - def directional_vector
     - def method_missing m, *args

#### ./dragon/log.rb

- module GTK
   - class Log
     - def self.write_to_log_and_puts *args
     - def self.write_to_log_and_print *args
     - def self.puts_important *args
     - def self.puts *args
     - def self.multiline? *args
     - def self.join_lines args
     - def self.headline name
     - def self.dynamic_block
     - def self.puts_error *args
     - def self.puts_info *args
     - def self.puts_once *ids, message
     - def self.puts_once_info *ids, message
     - def self.print *args
- class Object
   - def log_print *args
   - def log_important *args
   - def log *args
   - def log_with_color xterm_escape_code, *args
   - def log_reset_color
   - def log_black *args
   - def log_red *args
   - def log_green *args
   - def log_yellow *args
   - def log_blue *args
   - def log_magenta *args
   - def log_cyan *args
   - def log_white *args
   - def log_bright_black *args
   - def log_bright_red *args
   - def log_bright_green *args
   - def log_bright_yellow *args
   - def log_bright_blue *args
   - def log_bright_magenta *args
   - def log_bright_cyan *args
   - def log_bright_white *args
   - def log_error *args
   - def log_info *args
   - def log_once *ids, message
   - def log_once_info *ids, message

#### ./dragon/recording.rb

- module GTK
   - class Replay
     - def self.start file_name = nil
     - def self.stop
   - class Recording
     - def initialize runtime
     - def tick
     - def start_recording seed_number = nil
     - def start seed_number = nil
     - def is_replaying?
     - def is_recording?
     - def stop file_name = nil
     - def cancel
     - def stop_recording file_name = nil
     - def stop_recording_core
     - def start_replay file_name = nil
     - def stop_replay notification_message =  "Replay has been stopped."
     - def record_input_history name, value_1, value_2, value_count, clear_cache = false
     - def stage_replay_values

#### ./dragon/open_entity.rb

- module GTK
   - class OpenEntity
     - def self.parse_serialization_data data
     - def initialize name = nil
     - def hash
     - def as_hash
     - def == other
     - def entity_id
     - def attributes
     - def update_entity_keys_by_ref
     - def to_s
     - def with_meta o, meta
     - def meta o
     - def meta! o
     - def `__meta__`
     - def `__reserved_keys__`
     - def load_entity_data! serialization_data
     - def new_entity_strict entity_type, init_hash = nil, &block
     - def new_entity entity_type, init_hash = nil, &block
     - def old?
     - def new? tick_count_override = nil
     - def created_at_elapsed
     - def global_created_at_elapsed
     - def `__set_hash_property__` name, args
     - def `__get_hash_property__` name
     - def method_missing name, *args, &block
     - def inspect
     - def set! key, value
     - def clear!

#### ./dragon/top_level.rb


#### ./dragon/strict_entity.rb

- module GTK
   - class StrictEntity
     - def self.parse_serialization_data data
     - def initialize name, init_hash = nil, block = nil
     - def update_entity_keys_by_ref
     - def load_entity_data! serialization_data
     - def to_s
     - def inspect
     - def is_a? klass
     - def method_missing m, *args
     - def created_at_elapsed
     - def global_created_at_elapsed
     - def hash
     - def as_hash
     - def to_hash
     - def set! key, value
     - def clear!
     - def []= key, value
     - def [] key

#### ./dragon/serialize.rb

- module GTK
   - module Serialize
     - def serialize
     - def inspect

#### ./dragon/console_font_style.rb

- module GTK
   - class Console
     - class FontStyle
         - def initialize(font:, size_enum:, line_height:)
         - def letter_size
         - def line_height_px
         - def label(x:, y:, text:, color:, alignment_enum: 0)

#### ./dragon/wizards.rb

- module GTK
   - class Wizards
     - def initialize

#### ./dragon/console.rb

- module GTK
   - class Console
     - def initialize
     - def console_text_width
     - def save_history
     - def load_history
     - def disable
     - def enable
     - def add_sprite obj
     - def add_primitive obj
     - def add_text obj
     - def ready?
     - def hidden?
     - def visible?
     - def show reason = nil
     - def hide
     - def close
     - def clear_toast
     - def toggle
     - def currently_toasting?
     - def toast_extended id = nil, duration = nil, *messages
     - def toast id, *messages
     - def perma_toast id = nil, messages
     - def toast id = nil, *messages
     - def console_toggle_keys
     - def console_toggle_key_down? args
     - def try_search_docs exception
     - def eval_the_set_command
     - def inputs_scroll_up_full? args
     - def scroll_to_bottom
     - def scroll_up_full
     - def inputs_scroll_up_half? args
     - def scroll_up_half
     - def inputs_scroll_down_full? args
     - def scroll_down_full
     - def inputs_scroll_down_half? args
     - def inputs_clear_command? args
     - def scroll_down_half
     - def mouse_wheel_scroll args
     - def process_inputs args
     - def write_primitive_and_return_offset(args, left, y, str, archived: false)
     - def write_line(args, left, y, str, archived: false)
     - def should_tick?
     - def render args
     - def render_log_offset args
     - def include_error_marker? text
     - def error_markers
     - def include_subdued_markers? text
     - def include_any_words? text, words
     - def subdued_markers
     - def calc args
     - def tick args
     - def set_command_with_history_silent command, histories, show_reason = nil
     - def defaults_set_command_extended
     - def set_command_extended opts
     - def set_command_with_history command, histories, show_reason = nil
     - def set_command command, show_reason = nil
     - def set_command_silent command, show_reason = nil
     - def set_system_command command, show_reason = nil
     - def system_command
     - def w
     - def h
     - def line_height_px
     - def lines_on_one_page
     - def line(y:, color:)
     - def include_row_marker? log_entry
     - def include_header_marker? log_entry
     - def color_for_log_entry(log_entry)
     - def prompt
     - def current_input_str
     - def current_input_str=(str)
     - def clear
     - def slide_progress

#### ./dragon/trace.rb

- module GTK
   - module Trace
     - def self.traced_classes
     - def self.mark_class_as_traced! klass
     - def self.untrace_classes!
     - def self.trace_method_name_for m
     - def self.original_method_name_for m
     - def self.filter_methods_to_trace methods
     - def self.trace_times_string
     - def self.flush_trace pad_with_newline = false
     - def self.trace! instance = nil

#### ./dragon/grid.rb

- module GTK
   - class Grid
     - def initialize runtime
     - def transform_x x
     - def untransform_x x
     - def transform_y y
     - def untransform_y y
     - def ffi_draw
     - def ffi_draw= value
     - def origin_bottom_left!
     - def origin_center!
     - def w
     - def w_half
     - def h
     - def h_half
     - def center
     - def bottom_right
