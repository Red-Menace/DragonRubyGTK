
### DragonRuby GTK ctags (emacs) extraction 2020-07-26 12:00

#### Select sources are also available on [GitHub](https://github.com/DragonRuby/dragonruby-game-toolkit-contrib/tree/master/dragon)  

----


#### ./dragon/numeric\_deprecated.rb

- module NumericDeprecated
   - def perc\_to\_zero start, duration
   - def perc\_to\_one start, duration
   - def pos?
   - def neg?

#### ./dragon/outputs\_deprecated.rb

- module GTK
   - module FlatArrayDeprecated
     - def + other
- module GTK
   - module OutputsDeprecated
     - def \_\_raise\_deprecated\_primitive\_assignment\_\_ prop
     - def \_\_raise\_property\_renamed\_\_ old\_name, new\_name
     - def solids= value
     - def sprites= value
     - def lines= value
     - def labels= value
     - def borders= value
     - def primitives= value
     - def reserved= value
     - def static\_solids= value
     - def static\_sprites= value
     - def static\_lines= value
     - def static\_labels= value
     - def static\_borders= value
     - def static\_primitives= value
     - def static\_reserved= value
     - def static\_background\_color= value
     - def static\_background\_color

#### ./dragon/runtime\_docs.rb

- module RuntimeDocs
   - def docs\_class
   - def docs\_reset
   - def docs\_calcstringbox
   - def tick args
- class GTK::Runtime

#### ./dragon/outputs.rb

- module GTK
   - class Sound
     - def self.parse v
     - def initialize opts = {}
- module GTK
   - class FlatArray < Array
     - def [] *args
     - def initialize reference\_name, mark\_method, outputs\_with\_ids
     - def resolve\_collection target
     - def mark\_and\_id! o
     - def resolved? o
     - def add\_dwim os
     - def << other
- module GTK
   - class Outputs   # Each Outputs is a single render pass to a render target (or the window framebuffer).
     - def initialize opts = {}
     - def \_\_initialize\_primitives
     - def default\_background\_color
     - def background\_color
     - def tick
     - def can\_screenshot?
     - def clear\_non\_static
     - def clear\_non\_static\_reserved
     - def clear
     - def inspect
     - def serialize

#### ./dragon/openentity\_docs.rb

- module OpenEntityDocs
   - def docs\_class
   - def tick args
   - def tick args
   - def docs\_as\_hash
   - def tick args
- class GTK::OpenEntity

#### ./dragon/string.rb

- class String
   - def wrapped\_lines\_recur word, rest, length, aggregate
   - def end\_with\_bang?
   - def without\_ending\_bang
   - def wrapped\_lines length
   - def wrap length
   - def multiline?
   - def indent\_lines amount, char = " "
   - def quote
   - def trim
   - def trim!
   - def ltrim
   - def ltrim!
   - def rtrim
   - def rtrim!

#### ./dragon/args\_deprecated.rb

- module GTK
   - module ArgsDeprecated
     - def dragon
     - def game

#### ./dragon/help.rb

- module GTK
   - class Help
     - def self.primitive\_contract primitive\_name
     - def self.label\_contract
     - def self.solid\_border\_contract
     - def self.label\_contract
     - def self.sprite\_contract
     - def self.code\_for\_class\_attributes\_as\_hash klass
     - def self.serialization\_implementation\_help klass
     - def serialize
     - def inspect
     - def to\_s
     - def self.serialization\_too\_large

#### ./dragon/console\_color.rb

- module GTK
   - class Console
     - class Color
       - def initialize(color)
       - def mult\_alpha(alpha\_modifier)
       - def to\_a
       - def to\_h

#### ./dragon/array\_docs.rb

- module ArrayDocs
   - def docs\_method\_sort\_order
   - def docs\_include\_any?
   - def docs\_class
   - def docs\_reject\_nil
   - def docs\_reject\_false
   - def docs\_product
   - def docs\_map\_2d
   - def docs\_any\_intersect\_rect?
   - class Player
       - def initialize x, y, w, h
       - def serialize
       - def inspect
       - def to\_s
   - def docs\_map
   - def tick args
   - def docs\_each
   - def tick args
   - class Array

#### ./dragon/array.rb

- class Array
   - def reject\_nil
   - def reject\_false
   - def product other\_array = nil
   - def serialize
   - def to\_a\_pairs
   - def pairs\_to\_hash
   - def map\_2d
   - def any\_intersect\_rect? other, tolerance = 0.1
   - def sample
   - def rest
   - def << other
   - def + other
   - def include\_any? *items

#### ./dragon/attr\_sprite.rb

- module AttrRect
   - def left
   - def right
   - def bottom
   - def top
- module AttrSprite
   - def primitive\_marker
   - def sprite
   - def x1
   - def x1= value
   - def y1
   - def y1= value

#### ./dragon/tests.rb

- module GTK
   - class Tests
     - def initialize
     - def run\_test m
     - def test\_methods\_focused
     - def test\_methods
     - def start
     - def mark\_test\_failed m, e
     - def running?
     - def log\_inconclusive m
     - def log\_passed m
     - def log\_no\_tests\_found
     - def test\_game\_over args, assert
     - def log\_test\_running m
     - def test\_signature\_invalid\_exception? e, m
     - def log\_test\_signature\_incorrect m
     - def print\_summary

#### ./dragon/geometry.rb

- module GTK
   - module Geometry
     - def self.cubic\_bezier t, a, b, c, d
     - def inside\_rect? outer
     - def intersect\_rect? other, tolerance = 0.1
     - def intersects\_rect? *args
     - def scale\_rect\_extended percentage\_x: percentage\_x,
     - def scale\_rect percentage, *anchors
     - def angle\_to other\_point
     - def angle\_from other\_point
     - def point\_inside\_circle? circle\_center\_point, radius
     - def anchor\_rect anchor\_x, anchor\_y
     - def angle\_given\_point other\_point
     - def self.shift\_line line, x, y
     - def self.intersects\_rect? *args
     - def self.line\_y\_intercept line
     - def self.angle\_between\_lines line\_one, line\_two, replace\_infinity: nil
     - def self.line\_slope line, replace\_infinity: nil
     - def self.ray\_test point, line
     - def self.line\_rect line
     - def self.line\_intersect line\_one, line\_two
     - def self.contract\_intersect\_rect?
     - def self.intersect\_rect? rect\_one, rect\_two, tolerance = 0.1
     - def self.to\_square size, x, y, anchor\_x = 0.5, anchor\_y = nil
     - def self.distance point\_one, point\_two
     - def self.angle\_from start\_point, end\_point
     - def self.angle\_to start\_point, end\_point
     - def self.point\_inside\_circle? point, circle\_center\_point, radius
     - def self.inside\_rect? inner\_rect, outer\_rect
     - def self.scale\_rect\_extended rect,
     - def self.scale\_rect rect, percentage, *anchors

#### ./dragon/class.rb

- class Class
   - def to\_s

#### ./dragon/numeric.rb

- class Numeric
   - def seconds
   - def half
   - def to\_byte
   - def elapsed\_time tick\_count\_override = nil
   - def elapsed\_time\_percent duration
   - def new?
   - def elapsed? offset, tick\_count\_override = nil
   - def frame\_index *opts
   - def zero
   - def one
   - def two
   - def five
   - def ten
   - def shift\_right i
   - def shift\_left i
   - def shift\_up i
   - def shift\_down i
   - def randomize *definitions
   - def rand\_sign
   - def rand\_ratio
   - def remainder\_of\_divide n
   - def ease\_extended tick\_count\_override, duration, default\_before, default\_after, *definitions
   - def global\_ease duration, *definitions
   - def ease duration, *definitions
   - def ease\_spline\_extended tick\_count\_override, duration, spline
   - def global\_ease\_spline duration, spline
   - def ease\_spline duration, spline
   - def to\_radians
   - def to\_degrees
   - def to\_square x, y, anchor\_x = 0.5, anchor\_y = nil
   - def vector max\_value = 1
   - def vector\_y max\_value = 1
   - def vector\_x max\_value = 1
   - def x\_vector max\_value = 1
   - def y\_vector max\_value = 1
   - def mod n
   - def mod\_zero? *ns
   - def mult n
   - def fdiv n
   - def idiv n
   - def towards target, magnitude
   - def map\_with\_ys ys, &block
   - def combinations other\_int
   - def percentage\_of n
   - def cap i
   - def cap\_min\_max min, max
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
   - def map\_with\_index
   - def check\_numeric! sender, other
   - def - other
   - def + other
   - def * other
   - def / other
   - def serialize
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
- class Float
   - def - other
   - def + other
   - def * other
   - def / other
   - def serialize
   - def sign
   - def replace\_infinity scalar
- class Integer
   - def round *args

#### ./dragon/nil\_class_false\_class.rb

- module NilClassFalseClass
   - def feels\_like\_an\_array? name
   - def \_\_check\_thrash\_\_! m
   - def frame\_index *args
   - def > other
   - def >= other
   - def < other
   - def <= other
   - def + other
   - def unassign\_method\_missing
   - def unassign\_method\_missing\_and\_raise error
   - def assign\_method\_missing hash, name, thrash\_counter
   - def serialize
   - def to\_hash
   - def merge *args
- class NilClass
- class FalseClass
- class TrueClass

#### ./dragon/kernel\_docs.rb

- module KernelDocs
   - def docs\_method\_sort\_order
   - def docs\_class
   - def docs\_tick\_count
   - def docs\_global\_tick\_count
   - def docs\_export\_docs!
   - def export\_docs!
- module Kernel

#### ./dragon/entity.rb

- module GTK
   - class Entity
     - def self.id!
     - def self.\_\_reset\_id\_\_!
     - def self.strict\_entities
     - def self.parse\_from\_hash data
     - def self.load\_hash\_value value
     - def self.new\_entity entity\_type, init\_hash = nil, block = nil
     - def self.new\_entity\_strict entity\_type, init\_hash = nil, block = nil

#### ./dragon/args.rb

- module GTK
   - class Args
     - def initialize runtime, recording
     - def tick\_count
     - def tick\_count= value
     - def serialize
     - def destructure
     - def clear\_render\_targets
     - def render\_target name
     - def solids
     - def static\_solids
     - def sprites
     - def static\_sprites
     - def labels
     - def static\_labels
     - def lines
     - def static\_lines
     - def borders
     - def static\_borders
     - def primitives
     - def static\_primitives
     - def keyboard
     - def click
     - def click\_at
     - def mouse
     - def controller\_one
     - def controller\_two

#### ./dragon/runtime/c\_bridge.rb

- module GTK
   - class Runtime
     - module CBridge
       - def c\_bridge\_init \_\_sender
       - def mark\_ruby\_file\_for\_reload path
       - def reload\_history\_for path
       - def get\_ruby\_reload\_list
       - def reload\_complete
       - def print\_help\_when\_mouse\_clicked
       - def mouse\_move mousex, mousey, sender = false
       - def update\_mouse\_buttons newbuttons
       - def mouse\_button\_pressed button, sender = false
       - def mouse\_pressed mousex, mousey, sender = false
       - def mouse\_button\_up button, sender = false
       - def mouse\_up mousex, mousey, sender = false
       - def mouse\_wheel x, y, sender = false
       - def textinput str
       - def key\_down\_in\_game raw\_key, modifier
       - def key\_up\_in\_game raw\_key, modifier, sender = false
       - def key\_down\_raw raw\_key, modifier, sender = false
       - def key\_up\_raw raw\_key, modifier, sender = false
       - def controller\_key\_event player\_num, raw\_key, event, sender = false
       - def key\_down\_player\_one raw\_key, sender = false
       - def key\_down\_player\_two raw\_key, sender = false
       - def key\_held\_player\_one raw\_key, sender = false
       - def key\_held\_player\_two raw\_key, sender = false
       - def key\_up\_player\_one raw\_key, sender = false
       - def key\_up\_player\_two raw\_key, sender = false
       - def controller\_key\_down player\_num, raw\_key, sender = false
       - def controller\_key\_held player\_num, raw\_key, sender = false
       - def controller\_key\_up player\_num, raw\_key, sender = false
       - def window\_keyboard\_focus\_changed gained
       - def window\_mouse\_focus\_changed gained
       - def analog\_to\_perc value
       - def left\_analog\_x\_player\_1 value, sender = false
       - def left\_analog\_y\_player\_1 value, sender = false
       - def right\_analog\_x\_player\_1 value, sender = false
       - def right\_analog\_y\_player\_1 value, sender = false
       - def left\_analog\_x\_player\_2 value, sender = false
       - def left\_analog\_y\_player\_2 value, sender = false
       - def right\_analog\_x\_player\_2 value, sender = false
       - def right\_analog\_y\_player\_2 value, sender = false
       - def background\_color
       - def rawjoystick\_connected jid, joystickname, guid
       - def rawjoystick\_disconnected jid
       - def rawjoystick\_axis jid, axis, value
       - def rawjoystick\_hat jid, hat, value
       - def rawjoystick\_button jid, button, pressed

#### ./dragon/runtime/draw.rb

- module GTK
   - class Runtime
     - module Draw
       - def draw\_solid s
       - def draw\_sprite s
       - def draw\_screenshot s
       - def draw\_label l
       - def draw\_line l
       - def draw\_border s
       - def draw\_screenshots
       - def draw\_clear r, g, b, a
       - def primitives pass

#### ./dragon/runtime/hotload.rb

- module GTK
   - class Runtime
     - module Hotload
       - def hotload\_init
       - def hotload\_on\_write\_file file\_name
       - def files\_to\_reload
       - def core\_files\_to\_reload
       - def init\_mtimes file
       - def reload\_ruby\_file file
       - def hotload\_source\_files
       - def check\_mailbox
       - def hotload\_if\_needed
       - def on\_load\_succeeded file
       - def reload\_if\_needed file, force = false

#### ./dragon/runtime/framerate.rb

- module GTK
   - class Runtime
     - module Framerate
       - def framerate\_init
       - def delta\_framerate
       - def reset\_framerate\_calculation
       - def check\_framerate
       - def framerate\_warning\_message
       - def framerate\_below\_threshold?

#### ./dragon/runtime/deprecated.rb

- module GTK
   - class Runtime
     - module Deprecated
       - def current\_framerate\_raw
       - def suppress\_print\_help\_when\_mouse\_clicked
       - def suppress\_framerate\_warning
       - def suppress\_print\_help\_when\_mouse\_clicked= value
       - def suppress\_framerate\_warning= value
       - def on\_ticks
       - def on\_tick *args
       - def take\_screenshot= value
       - def save\_state file\_name
       - def load\_state file\_name
       - def take\_screenshot

#### ./dragon/hash.rb

- class Hash
   - def serialize
   - def primitive\_marker
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
   - def size\_enum
   - def alignment\_enum
   - def \_\_get\_color\_from\_array\_or\_primitive v, rgba\_symbol
   - def r
   - def g
   - def b
   - def a
   - def font
   - def tile\_x
   - def tile\_y
   - def tile\_w
   - def tile\_h
   - def source\_x
   - def source\_y
   - def source\_w
   - def source\_h
   - def flip\_horizontally
   - def flip\_vertically
   - def angle\_anchor\_x
   - def angle\_anchor\_y
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
   - def size\_enum= value
   - def alignment\_enum= value
   - def r= value
   - def g= value
   - def b= value
   - def a= value
   - def font= value
   - def tile\_x= value
   - def tile\_y= value
   - def tile\_w= value
   - def tile\_h= value
   - def source\_x= value
   - def source\_y= value
   - def source\_w= value
   - def source\_h= value
   - def flip\_horizontally= value
   - def flip\_vertically= value
   - def angle\_anchor\_x= value
   - def angle\_anchor\_y= value
   - def angle= value
   - def at= value
   - def path
   - def path= value
   - def rect
   - def new\_entity\_strict entity\_type, &block
   - def new\_entity entity\_type, &block
   - def pretty\_format char = " "
   - def self.pretty\_format hash, char = " "
   - def left
   - def right
   - def bottom
   - def top
   - def s
   - def id
   - def to\_hash
   - def shift\_rect dx, dy
   - def associate hash = nil

#### ./dragon/inputs.rb

- module GTK
   - class KeyboardKeys
     - def self.sdl\_to\_key raw\_key, modifier
     - def self.utf\_8\_char raw\_key
     - def self.char\_with\_shift raw\_key, modifier
     - def self.char\_to\_method\_hash
     - def self.char\_to\_method char, int = nil
     - def clear
     - def left\_right
     - def up\_down
     - def truthy\_keys
     - def all? keys
     - def any? keys
     - def clear\_key key
     - def all
     - def get collection
     - def set collection, value = true
     - def method\_missing m, *args
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
     - def to\_s
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
     - def created\_at\_elapsed
     - def to\_hash
     - def serialize
     - def inspect
     - def to\_s
   - class Mouse
     - def initialize
     - def point
     - def clear
     - def up
     - def down
     - def serialize
     - def to\_s
- module GTK
   - class Inputs
     - def initialize
     - def up
     - def down
     - def left
     - def right
     - def directional\_vector
     - def left\_right
     - def up\_down
     - def click
     - def controller\_one
     - def controller\_two
     - def clear
     - def serialize

#### ./dragon/primitive.rb

- module GTK
   - module Primitive
     - module Common
       - def primitive\_marker
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
       - def to\_hash
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
       - def center\_inside\_rect *other\_rect
       - def shift\_rect *args
       - def rect\_shift *args
       - def rect\_shift\_right v
       - def rect\_shift\_left v
       - def rect\_shift\_up v
       - def rect\_shift\_down v
       - def to\_hash
     - module Determined
     - module Color
       - def looks\_like\_a\_sprite?
       - def r
       - def r= value
       - def g
       - def g= value
       - def b
       - def b= value
       - def a
       - def a= value
     - module Solid
       - def to\_hash
       - def primitive\_marker
     - module Border
       - def primitive\_marker
       - def to\_hash
     - module Label
       - def primitive\_marker
       - def text
       - def text= value
       - def defines\_enums?
       - def size\_enum
       - def size\_enum= value
       - def alignment\_enum
       - def alignment\_enum= value
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
       - def to\_hash
       - def w
       - def h
     - module Line
       - def primitive\_marker
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
       - def to\_hash
     - module Sprite
       - def primitive\_marker
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
       - def tile\_x
       - def tile\_x= value
       - def tile\_y
       - def tile\_y= value
       - def tile\_w
       - def tile\_w= value
       - def tile\_h
       - def tile\_h= value
       - def flip\_horizontally
       - def flip\_horizontally= value
       - def flip\_vertically
       - def flip\_vertically= value
       - def angle\_anchor\_x
       - def angle\_anchor\_x= value
       - def angle\_anchor\_y
       - def angle\_anchor\_y= value
       - def source\_x
       - def source\_x= value
       - def source\_y
       - def source\_y= value
       - def source\_w
       - def source\_w= value
       - def source\_h
       - def source\_h= value
       - def to\_hash
     - module ConversionCapabilities
       - def raise\_ambigous! m
       - def mark\_assert!
       - def mark\_as\_point!
       - def mark\_as\_rect!
       - def mark\_as\_solid!
       - def mark\_as\_border!
       - def mark\_as\_line!
       - def mark\_as\_label!
       - def mark\_as\_primitive! type
       - def mark\_as\_sprite!
       - def mark\_as\_common!
       - def path
       - def path= value
       - def inside\_rect? outer\_rect
       - def intersects\_rect? other, tolerance = 0.1
       - def intersect\_rect? other, tolerance = 0.1
       - def rect
       - def point
       - def scale\_rect percentage, *anchors
       - def scale\_rect\_extended *args
       - def center\_inside\_rect *other\_rect
       - def text
       - def text= value
       - def left
       - def right
       - def top
       - def bottom
       - def w\_half
       - def width\_half
       - def h\_half
       - def height\_half
       - def x
       - def x1
       - def shift\_rect *args
       - def rect\_shift *args
       - def rect\_shift\_right v
       - def rect\_shift\_left v
       - def rect\_shift\_up v
       - def rect\_shift\_down v
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
       - def angle\_given\_point other\_point
       - def angle\_to other\_point
       - def angle\_from other\_point
       - def a
       - def a= value
       - def point
       - def solid
       - def sprite
       - def label
       - def line
       - def border
       - def to\_hash
       - def associate hash = nil
       - def anchor\_rect anchor\_x, anchor\_y
       - def sprites
       - def solids
       - def labels
       - def borders
       - def lines
       - def outputs\_add\_dwim os, mark\_method, primitive\_name
       - def outputs\_mark! o, mark\_method, primitive\_name
       - def outputs\_resolved? o
       - def outputs\_resolve\_collection target

#### ./dragon/array\_deprecated.rb

- module ArrayDeprecated
   - def any\_intersects\_rect? *args

#### ./dragon/controller/keys.rb

- module GTK
   - class Controller
     - class Keys
       - def activate key
       - def deactivate key
       - def clear
       - def truthy\_keys

#### ./dragon/controller/config.rb

- module GTK
   - class Controller
     - class Config
       - def initialize runtime
       - def rawjoystick\_connected jid, joystickname, guid
       - def rawjoystick\_disconnected jid
       - def build\_binding\_string
       - def move\_to\_different\_part part
       - def previous\_part
       - def next\_part
       - def set\_binding bindstr
       - def rawjoystick\_axis jid, axis, value
       - def rawjoystick\_hat jid, hat, value
       - def rawjoystick\_button jid, button, pressed
       - def calc\_fading
       - def render\_basics args, msg, fade=255
       - def render\_part\_highlight args, part, alpha=255
       - def choose\_target
       - def render\_part\_highlight\_from\_bindstr args, bindstr, alpha=255
       - def play\_around args
       - def should\_tick?
       - def tick args

#### ./dragon/symbol.rb

- class Symbol
   - def include? v
   - def end\_with\_bang?
   - def without\_ending\_bang
   - def start\_with? value
   - def gsub *args

#### ./dragon/docs.rb

- module DocsOrganizer
   - def self.sort\_docs\_classes!
   - def self.reserved\_methods
   - def self.class\_sort\_order
   - def self.check\_class\_sort\_order
- module in its correct topological order.
   - def self.sort\_method\_delegate l, r, method\_sort\_order
   - def self.find\_methods\_with\_docs klass
- module Docs
   - def self.extended klass
   - def docs\_method\_sort\_order
   - def docs\_classes
   - def docs\_all
   - def docs
   - def self.\_\_docs\_search\_\_ words = nil, &block
   - def docs\_search words = nil, &block
   - def \_\_export\_docs\_\_! opts = {}
   - def export\_docs! opts = {}
   - def \_\_docs\_append\_true\_line\_\_ true\_lines, true\_line, parse\_log
   - def \_\_docs\_to\_html\_\_ string
   - def \_\_docs\_line\_to\_html\_\_ line, parse\_log

#### ./dragon/runtime.rb

- module FFI
   - class Draw
     - def serialize
     - def inspect
     - def to\_s
- module GTK
   - class Runtime
     - def initialize platform, production, logical\_width, logical\_height, argv
     - def schedule\_callback tick\_count, &callback
     - def cli\_arguments
     - def process\_argsv
     - def quit!
     - def request\_quit
     - def quit\_requested?
     - def require file
     - def log obj, sender = nil
     - def disable\_console
     - def enable\_console
     - def show\_console reason = nil
     - def start\_replay file\_name = nil
     - def stop\_replay
     - def start\_recording seed\_value
     - def set\_rng value
     - def stop\_recording file\_name = nil
     - def record\_input\_history name, value\_1, value\_2, value\_count, clear\_cache = false
     - def write\_file file\_name, text
     - def append\_file file\_name, text
     - def read\_file file\_name
     - def parse\_xml xmlstr, stripcontent=true
     - def parse\_xml\_file fname, stripcontent=true
     - def parse\_json jsonstr
     - def parse\_json\_file fname
     - def set\_window\_title newtitle
     - class HTTPCallbacks
         - def initialize protect\_from\_gc
         - def ready newstate
         - def http\_response\_header
         - def http\_response\_data
         - def http\_done
     - def http\_get url, extra\_headers=nil
     - def http\_head url, extra\_headers=nil
     - def http\_post url, form\_fields=nil, extra\_headers=nil
     - def http\_put url, fname, extra\_headers=nil
     - def export! with\_comments = nil, file\_name\_override = nil
     - def passes
     - def toast id, message
     - def target pass
     - def render\_width pass
     - def render\_height pass
     - def raise\_conversion\_for\_rendering\_failed p, e, name = nil
     - def draw\_primitive p
     - def reset\_state
     - def reset rng\_override = nil, seed: seed
     - def \_\_reset\_\_ rng\_override = nil, seed: seed
     - def paused?
     - def pause!
     - def unpause!
     - def queue\_key\_up key
     - def queue\_sound path
     - def queue\_music path, repeat
     - def stop\_music
     - def sounds
     - def pin\_root\_values
     - def dequeue\_sounds pass
     - def stage\_replay\_values
     - def clear\_draw\_primitives pass
     - def next\_keyboard\_inputs\_before\_tick
     - def next\_keyboard\_inputs\_after\_tick
     - def clear\_draw\_passes
     - def clear\_inputs
     - def tick\_console
     - def delta\_tick
     - def quit\_after\_startup\_eval?
     - def print\_console\_activation\_help
     - def tick\_runtime
     - def tick\_notification
     - def tick\_gtk\_engine\_before
     - def tick\_gtk\_engine\_after
     - def tick\_usr\_engine
     - def skip\_tick\_usr\_engine?
     - def calc\_wrapper tick\_override\_lambda = nil
     - def render\_replay\_mouse
     - def eval\_or\_create\_main\_rb
     - def tick
     - def pretty\_print\_exception\_and\_export! e
     - def tick\_core
     - def text\_font
     - def calcstringbox str, size\_enum = 0, font = "text.ttf"
     - def autocomplete\_methods
     - def ignore\_search\_term? word
     - def grep\_did\_you\_mean\_recommendations instance, method
     - def grep\_did\_you\_mean instance, method
     - def grep\_source\_file file, *strings\_with\_recommendations
     - def grep\_source *strings\_with\_recommendations
     - def tests
     - def log\_level
     - def log\_levels
     - def log\_level= value
     - def seed
     - def delta\_time\_enabled?
     - def set\_delta\_time accumulator
     - def delta\_time= value
     - def delta\_time
     - def slowmo! factor
     - def notify\_subdued!
     - def notify! message, duration = 300
     - def system cmd
     - def serialize\_state *opts
     - def deserialize\_state *args
     - def self.argv\_window\_width argv
     - def self.argv\_window\_height argv
     - def self.argv\_window\_scale argv
     - def self.argv\_window\_position\_x argv
     - def self.argv\_window\_position\_y argv
     - def self.parse\_cli\_argument\_i argv, name, default = 0
     - def self.parse\_cli\_argument argv, name, default = nil
     - def backup\_directory
     - def create\_backup file
     - def reset\_sprite path
     - def show\_cursor
     - def hide\_cursor
     - def cursor\_shown?
     - def current\_framerate

#### ./dragon/assert.rb

- module GTK
- def test\_this\_works args, assert
- class Assert
   - def custom\_assertion actual, expected, message = nil
   - class Assert
     - def ok!
- def test\_does\_this\_work args, assert
     - def true! value, message = nil
- def test\_does\_this\_work args, assert
     - def false! value, message = nil
- def test\_does\_this\_work args, assert
     - def equal! actual, expected, message = nil
- def test\_does\_this\_work args, assert
     - def nil! value, message = nil

#### ./dragon/attr\_gtk.rb

- module AttrGTK
   - def keyboard
   - def grid
   - def state
   - def inputs
   - def outputs
   - def gtk
   - def passes
   - def geometry

#### ./dragon/console\_prompt.rb

- module GTK
   - class Console
     - class Prompt
       - def initialize(font\_style:, text\_color:, console\_text\_width:)
       - def <<(str)
       - def backspace
       - def clear
       - def autocomplete
       - def pretty\_print\_strings\_as\_table items
       - def pretty\_print\_row cells, string\_width, cell\_width, column\_width, columns
       - def pretty\_print\_row\_seperator string\_width, cell\_width, column\_width, columns
       - def render(args, x:, y:)
       - def last\_period\_index
       - def calc\_autocomplete\_prefix
       - def current\_object
       - def method\_candidates(prefix)
       - def display\_autocomplete\_candidate(candidate)
       - def reset\_autocomplete

#### ./dragon/outputs\_docs.rb

- module OutputsDocs
   - def docs\_class
   - def tick args
   - def docs\_borders
   - def tick args
   - def tick args
   - def docs\_solids
   - def tick args
   - def tick args
   - def tick args
   - class Solid
     - def primitive\_marker
   - class Square < Solid
     - def initialize x, y, size
   - def tick args
- class GTK::Outputs

#### ./dragon/easing.rb

- module GTK
   - module Easing
     - def self.ease\_extended start\_tick, current\_tick, end\_tick, default\_before, default\_after, *definitions
     - def self.ease\_spline\_extended start\_tick, current\_tick, end\_tick, spline
     - def self.initial\_value *definitions
     - def self.final\_value *definitions
     - def self.exec\_definition definition, start\_tick, duration, x
     - def self.identity x
     - def self.flip x
     - def self.quad x
     - def self.cube x
     - def self.quart x
     - def self.quint x

#### ./dragon/readme\_docs.rb

- module GTK
   - module ReadMeDocs
     - def docs\_method\_sort\_order
     - def docs\_usage
     - def docs\_hello\_world
   - def tick args
   - def tick args
   - def tick args
   - def tick args
   - def tick args
     - def docs\_deployment
     - def docs\_dragonruby\_philosophy
     - def docs\_ticks\_and\_frames
   - def tick args
   - def tick args
     - def docs\_sprites
   - def tick args
   - def tick args
   - def tick args
   - class Sprite
     - def primitive\_marker
   - class BlueSquare < Sprite
     - def initialize opts
   - def tick args
     - def docs\_labels
   - def tick args
   - def tick args
   - def tick args
   - def tick args
   - def tick args
     - def docs\_sounds
   - def tick args
   - def tick args
   - def tick args
     - def docs\_game\_state
   - def tick args
     - def animate\_a\_sprite
   - def tick args
     - def docs\_faq
   - class ReadMe

#### ./dragon/kernel.rb

- module Kernel
   - def self.tick\_count
   - def self.tick\_count= value
   - def puts *args
   - def self.global\_tick\_count
   - def self.global\_tick\_count= value

#### ./dragon/primitive\_deprecated.rb

- module GTK
   - module Primitive
     - module RectDeprecated
       - def w\_half
       - def width\_half
       - def h\_half
       - def height\_half

#### ./dragon/numeric\_docs.rb

- module NumericDocs
   - def docs\_frame\_index
   - def tick args
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
     - def activate\_down(key)
     - def activate\_held(key)
     - def activate\_up(key)

#### ./dragon/object.rb

- class BareDefinitionsContainer
- class NIL
- class Class
   - def serialize
- class ObjectMetadata
   - def self.with\_meta o, meta\_value
   - def self.meta o
   - def self.meta! o
   - def self.\_\_meta\_\_
- module ValueType
- class Object
   - def self.attr\_accessor *vars
   - def self.attributes
   - def self.new *args
   - def self.gtk\_args
   - def self.attr\_sprite
   - def self.attr\_rect
   - def self.attr\_gtk
   - def purge\_class symbol
   - def raise\_immediately e, m, *args
   - def raise\_with\_caller e, inner\_exception
   - def or other
   - def and other
   - def \_\_supports\_ivars\_\_?
   - def fast\_rand
   - def \_\_gtk\_ruby\_source\_files\_\_
   - def \_\_pretty\_print\_exception\_\_ e, inner\_exception = nil
   - def \_\_gtk\_ruby\_string\_contains\_source\_file\_path\_\_? s
   - def \_\_caller\_without\_noise\_\_
   - def raise\_error\_with\_kind\_of\_okay\_message e, name, *args
   - def better\_instance\_information
   - def better\_class\_hierarchy\_information
   - def raise\_method\_missing\_better\_error name, *args, &block
   - def method\_missing name, *args, &block
   - def numeric\_or\_default default = 0
   - def f\_or\_default default = 0
   - def s\_or\_default default = ''
   - def i\_or\_default default = 0
   - def require file
   - def \_\_custom\_object\_methods\_\_
   - def autocomplete\_methods
   - def \_\_object\_methods\_\_
   - def help
   - def to\_s
   - def primitive\_marker
   - def metadata\_object\_id
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
   - def \_\_help\_contract\_implementation contract\_methods
   - def docs
   - module PersonDocs
     - def docs\_class
     - def docs\_say\_hello
   - class Person
     - def say\_hello

#### ./dragon/directional\_input\_helper\_methods.rb

- module GTK
   - module DirectionalInputHelperMethods
     - def self.included klass
     - def left\_right
     - def up\_down
     - def directional\_vector
     - def method\_missing m, *args

#### ./dragon/log.rb

- module GTK
   - class Log
     - def self.write\_to\_log\_and\_puts *args
     - def self.write\_to\_log\_and\_print *args
     - def self.puts\_important *args
     - def self.puts *args
     - def self.multiline? *args
     - def self.join\_lines args
     - def self.headline name
     - def self.dynamic\_block
     - def self.puts\_error *args
     - def self.puts\_info *args
     - def self.puts\_once *ids, message
     - def self.puts\_once\_info *ids, message
     - def self.print *args
- class Object
   - def log\_print *args
   - def log\_important *args
   - def log *args
   - def log\_with\_color xterm\_escape\_code, *args
   - def log\_reset\_color
   - def log\_black *args
   - def log\_red *args
   - def log\_green *args
   - def log\_yellow *args
   - def log\_blue *args
   - def log\_magenta *args
   - def log\_cyan *args
   - def log\_white *args
   - def log\_bright\_black *args
   - def log\_bright\_red *args
   - def log\_bright\_green *args
   - def log\_bright\_yellow *args
   - def log\_bright\_blue *args
   - def log\_bright\_magenta *args
   - def log\_bright\_cyan *args
   - def log\_bright\_white *args
   - def log\_error *args
   - def log\_info *args
   - def log\_once *ids, message
   - def log\_once\_info *ids, message

#### ./dragon/recording.rb

- module GTK
   - class Replay
     - def self.start file\_name = nil
     - def self.stop
   - class Recording
     - def initialize runtime
     - def tick
     - def start\_recording seed\_number = nil
     - def start seed\_number = nil
     - def is\_replaying?
     - def is\_recording?
     - def stop file\_name = nil
     - def cancel
     - def stop\_recording file\_name = nil
     - def stop\_recording\_core
     - def start\_replay file\_name = nil
     - def stop\_replay notification\_message =  "Replay has been stopped."
     - def record\_input\_history name, value\_1, value\_2, value\_count, clear\_cache = false
     - def stage\_replay\_values

#### ./dragon/open\_entity.rb

- module GTK
   - class OpenEntity
     - def self.parse\_from\_hash data
     - def initialize name = nil
     - def hash
     - def as\_hash
     - def == other
     - def entity\_id
     - def attributes
     - def to\_s
     - def with\_meta o, meta
     - def meta o
     - def meta! o
     - def \_\_meta\_\_
     - def \_\_reserved\_keys\_\_
     - def new\_entity\_strict entity\_type, init\_hash = nil, &block
     - def new\_entity entity\_type, init\_hash = nil, &block
     - def old?
     - def new? tick\_count\_override = nil
     - def created\_at\_elapsed
     - def global\_created\_at\_elapsed
     - def \_\_set\_hash\_property\_\_ name, args
     - def \_\_get\_hash\_property\_\_ name
     - def method\_missing name, *args, &block
     - def inspect
     - def set! key, value
     - def clear!

#### ./dragon/top\_level.rb 

#### ./dragon/strict\_entity.rb

- module GTK
   - class StrictEntity
     - def self.parse\_from\_hash data
     - def initialize name, init\_hash = nil, block = nil
     - def to\_s
     - def inspect
     - def is\_a? klass
     - def method\_missing m, *args
     - def created\_at\_elapsed
     - def global\_created\_at\_elapsed
     - def hash
     - def as\_hash
     - def to\_hash
     - def set! key, value
     - def clear!
     - def []= key, value
     - def [] key

#### ./dragon/serialize.rb

- module GTK
   - module Serialize
     - def serialize
     - def inspect

#### ./dragon/console\_font\_style.rb

- module GTK
   - class Console
     - class FontStyle
       - def initialize(font:, size\_enum:, line\_height:)
       - def letter\_size
       - def line\_height\_px
       - def label(x:, y:, text:, color:, alignment\_enum: 0)

#### ./dragon/console.rb

- module GTK
   - class Console
     - def initialize
     - def console\_text\_width
     - def save\_history
     - def load\_history
     - def disable
     - def enable
     - def addsprite obj
     - def add\_primitive obj
     - def addtext obj
     - def ready?
     - def hidden?
     - def visible?
     - def show reason = nil
     - def hide
     - def close
     - def clear\_toast
     - def toggle
     - def currently\_toasting?
     - def toast\_extended id = nil, duration = nil, *messages
     - def toast id, *messages
     - def perma\_toast id = nil, messages
     - def toast id = nil, *messages
     - def console\_toggle\_keys
     - def console\_toggle\_key\_down? args
     - def eval\_the\_set\_command
     - def inputs\_scroll\_up\_full? args
     - def scroll\_up\_full
     - def inputs\_scroll\_up\_half? args
     - def scroll\_up\_half
     - def inputs\_scroll\_down\_full? args
     - def scroll\_down\_full
     - def inputs\_scroll\_down\_half? args
     - def inputs\_clear\_command? args
     - def scroll\_down\_half
     - def mouse\_wheel\_scroll args
     - def process\_inputs args
     - def write\_primitive\_and\_return\_offset(args, left, y, str, archived: false)
     - def write\_line(args, left, y, str, archived: false)
     - def render args
     - def render\_help args, top
     - def render\_log\_offset args
     - def include\_error\_marker? text
     - def error\_markers
     - def include\_subdued\_markers? text
     - def include\_any\_words? text, words
     - def subdued\_markers
     - def calc args
     - def tick args
     - def set\_command\_with\_history\_silent command, histories, show\_reason = nil
     - def defaults\_set\_command\_extended
     - def set\_command\_extended opts
     - def set\_command\_with\_history command, histories, show\_reason = nil
     - def set\_command command, show\_reason = nil
     - def set\_command\_silent command, show\_reason = nil
     - def set\_system\_command command, show\_reason = nil
     - def system\_command
     - def w
     - def h
     - def line\_height\_px
     - def lines\_on\_one\_page
     - def line(y:, color:)
     - def include\_row\_marker? log\_entry
     - def include\_header\_marker? log\_entry
     - def color\_for\_log\_entry(log\_entry)
     - def prompt
     - def current\_input\_str
     - def current\_input\_str=(str)
     - def clear

#### ./dragon/trace.rb

- module GTK
   - module Trace
     - def self.traced\_classes
     - def self.mark\_class\_as\_traced! klass
     - def self.untrace\_classes!
     - def self.trace\_method\_name\_for m
     - def self.original\_method\_name\_for m
     - def self.filter\_methods\_to\_trace methods
     - def self.flush\_trace pad\_with\_newline = false
     - def self.trace! instance = nil

#### ./dragon/grid.rb

- module GTK
   - class Grid
     - def initialize ffi\_draw
     - def transform\_x x
     - def untransform\_x x
     - def transform\_y y
     - def untransform\_y y
     - def ffi\_draw
     - def ffi\_draw= value
     - def origin\_bottom\_left!
     - def origin\_center!
     - def w
     - def w\_half
     - def h
     - def h\_half
     - def center
     - def bottom\_right
