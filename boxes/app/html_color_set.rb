
#
#  Created by Red_Menace on 05-11-19, last updated/reviewed on 02-19-20
#  Copyright (c) 2019-2020 Menace Enterprises, red_menace|at|menace-enterprises|dot|com
#
#  HTML color name definitions by group (RGB 0 - 255).
#  https://www.w3schools.com/colors/colors_groups.asp
#  https://www.rapidtables.com/web/color/html-color-codes.html
#
#  Most modern browsers and applications support pretty much any color,
#  but these are the earlier web-safe colors that were given names.
#


module HTMLColors

   # HTML colors by group - color names are lower case.
   # Based on items from the above links.
   REDS = { palette_name: 'Reds', palette_count: 9,
      'lightsalmon' =>           [255, 160, 122],     #FFA07A
      'darksalmon' =>            [233, 150, 122],     #E9967A
      'salmon' =>                [250, 128, 114],     #FA8072
      'lightcoral' =>            [240, 128, 128],     #F08080
      'indianred' =>             [205, 92, 92],       #CD5C5C
      'crimson' =>               [220, 20, 60],       #DC143C
      'red' =>                   [255, 0, 0],         #FF0000
      'firebrick' =>             [178, 34, 34],       #B22222
      'darkred' =>               [139, 0, 0] }        #8B0000


   PINKS = { palette_name: 'Pinks', palette_count: 6,
      'pink' =>                  [255, 192, 203],     #FFC0CB
      'lightpink' =>             [255, 182, 193],     #FFB6C0
      'hotpink' =>               [255, 105, 180],     #FF69B4
      'deeppink' =>              [255, 20, 147],      #FF1493
      'palevioletred' =>         [219, 112, 147],     #DB7093
      'mediumvioletred' =>       [199, 21, 133] }     #C71585


   ORANGES = { palette_name: 'Oranges', palette_count: 5,
      'orange' =>                [255, 165, 0],       #FFA500
      'darkorange' =>            [255, 140, 0],       #FF8C00
      'coral' =>                 [255, 127, 80],      #FF7F50
      'tomato' =>                [255, 99, 71],       #FF6347
      'orangered' =>             [255, 69, 0] }       #FF4500
   

   YELLOWS = { palette_name: 'Yellows', palette_count: 11,
      'lightyellow' =>           [255, 255, 224],     #FFFFE0
      'lemonchiffon' =>          [255, 250, 205],     #FFFACD
      'lightgoldenrodyellow' =>  [250, 250, 210],     #FAFAD2
      'papayawhip' =>            [255, 239, 213],     #FFEFD5
      'moccasin' =>              [255, 228, 181],     #FFE4B5
      'peachpuff' =>             [255, 218, 185],     #FFDAB9
      'palegoldenrod' =>         [238, 232, 170],     #EEE8AA
      'khaki' =>                 [240, 230, 140],     #F0E68C
      'yellow' =>                [255, 255, 0],       #FFFF00
      'gold' =>                  [255, 215, 0],       #FFD700
      'darkkhaki' =>             [189, 183, 107] }    #BDB76B


   GREENS = { palette_name: 'Greens', palette_count: 19,
      'palegreen' =>             [152, 251, 152],     #98FB98
      'greenyellow' =>           [173, 255, 47],      #ADFF2F
      'chartreuse' =>            [127, 255, 0],       #7FFF00
      'lawngreen' =>             [124, 252, 0],       #7CFC00
      'lime' =>                  [0, 255, 0],         #00FF00
      'mediumspringgreen' =>     [0, 250, 154],       #00FA9A
      'springgreen' =>           [0, 255, 127],       #00FF7F
      'lightgreen' =>            [144, 238, 144],     #90EE90
      'yellowgreen' =>           [154, 205, 50],      #9ACD32
      'limegreen' =>             [50, 205, 50],       #32CD32
      'mediumseagreen' =>        [60, 179, 113],      #3CB371
      'seagreen' =>              [46, 139, 87],       #2E8B57
      'forestgreen' =>           [34, 139, 34],       #228B22
      'green' =>                 [0, 128, 0],         #008000
      'darkgreen' =>             [0, 100, 0],         #006400
      'olive' =>                 [128, 128, 0],       #808000
      'olivedrab' =>             [107, 142, 35],      #6B8E23
      'darkolivegreen' =>        [85, 107, 47],       #556B2F
      'darkseagreen' =>          [143, 188, 143] }    #8FBC8F
   

   CYANS = { palette_name: 'Cyans', palette_count: 13,
      'lightcyan' =>             [224, 255, 255],     #E0FFFF
      'aqua' =>                  [0, 255, 255],       #00FFFF
      'cyan' =>                  [0, 255, 255],       #00FFFF
      'paleturquoise' =>         [175, 238, 238],     #AFEEEE
      'aquamarine' =>            [127, 255, 212],     #7FFFD4
      'turquoise' =>             [64, 224, 208],      #40E0D0
      'darkturquoise' =>         [0, 206, 209],       #40E0D0
      'mediumturquoise' =>       [72, 209, 204],      #40E0D0
      'mediumaquamarine' =>      [102, 205, 170],     #66CDAA
      'lightseagreen' =>         [32, 178, 170],      #20B2AA
      'cadetblue' =>             [95, 158, 160],      #5F9EA0
      'darkcyan' =>              [0, 139, 139],       #008B8B
      'teal' =>                  [0, 128, 128] }      #008080


   BLUES = { palette_name: 'Blues', palette_count: 18,
      'lightsteelblue' =>        [176, 196, 222],     #B0C4DE
      'lightblue' =>             [173, 216, 230],     #ADD8E6
      'powderblue' =>            [176, 224, 230],     #B0E0E6
      'lightskyblue' =>          [135, 206, 250],     #87CEFA
      'skyblue' =>               [135, 206, 235],     #87CEEB
      'deepskyblue' =>           [0, 191, 255],       #00BFFF
      'cornflowerblue' =>        [100, 149, 237],     #6495ED
      'steelblue' =>             [70, 130, 180],      #4682B4
      'dodgerblue' =>            [30, 144, 255],      #1E90FF
      'royalblue' =>             [65, 105, 225],      #4169FF
      'mediumslateblue' =>       [123, 104, 238],     #7B68EE
      'slateblue' =>             [106, 90, 205],      #6A5ACD
      'blue' =>                  [0, 0, 255],         #0000FF
      'mediumblue' =>            [0, 0, 205],         #0000CD
      'darkblue' =>              [0, 0, 139],         #00008B
      'navy' =>                  [0, 0, 128],         #000080
      'midnightblue' =>          [25, 25, 112],       #191970
      'darkslateblue' =>         [72, 61, 139] }      #483D8B


   PURPLES = { palette_name: 'Purples', palette_count: 15,
      'lavender' =>              [230, 230, 250],     #E6E6FA
      'thistle' =>               [216, 191, 216],     #D8BFD8
      'plum' =>                  [221, 160, 221],     #DDA0DD
      'violet' =>                [238, 130, 238],     #EE82EE
      'orchid' =>                [218, 112, 214],     #DA70D6
      'fuchsia' =>               [255, 0, 255],       #FF00FF
      'magenta' =>               [255, 0, 255],       #FF00FF
      'mediumorchid' =>          [186, 85, 211],      #BA55D3
      'meduimpurple' =>          [147, 112, 219],     #9370DB
      'blueviolet' =>            [138, 43, 226],      #8A2BE1
      'darkviolet' =>            [148, 0, 211],       #9400D3
      'darkorchid' =>            [153, 50, 204],      #9932CC
      'darkmagenta' =>           [139, 0, 139],       #8B008B
      'purple' =>                [128, 0, 128],       #800080
      'indigo' =>                [75, 0, 130] }       #4B0082


   BROWNS = { palette_name: 'Browns', palette_count: 17,
      'cornsilk' =>              [255, 248, 220],     #
      'blanchedalmond' =>        [255, 235, 205],     #
      'bisque' =>                [255, 228, 196],     #
      'navajowhite' =>           [255, 222, 173],     #
      'wheat' =>                 [245, 222, 179],     #
      'burlywood' =>             [222, 184, 135],     #
      'tan' =>                   [210, 180, 140],     #
      'rosybrown' =>             [188, 143, 143],     #
      'sandybrown' =>            [244, 164, 96],      #
      'goldenrod' =>             [218, 165, 32],      #
      'darkgoldenrod' =>         [184, 134, 11],      #
      'peru' =>                  [205, 133, 63],      #
      'chocolate' =>             [210, 105, 30],      #
      'saddlebrown' =>           [139, 69, 19],       #
      'sienna' =>                [160, 82, 45],       #
      'brown' =>                 [165, 42, 42],       #
      'maroon' =>                [128, 0, 0] }        #800000


   WHITES = { palette_name: 'Whites', palette_count: 17,
      'white' =>                 [255, 255, 255],     #FFFFFF
      'snow' =>                  [255, 250, 250],     #FFFAFA
      'honeydew' =>              [240, 255, 240],     #F0FFF0
      'mintcream' =>             [245, 255, 250],     #F5FFFA
      'azure' =>                 [240, 255, 255],     #F0FFFF
      'aliceblue' =>             [240, 248, 255],     #F0F8FF
      'ghostwhite' =>            [248, 248, 255],     #F8F8FF
      'whitesmoke' =>            [245, 245, 245],     #F5F5F5
      'seashell' =>              [255, 245, 238],     #
      'beige' =>                 [245, 245, 220],     #
      'oldlace' =>               [253, 245, 230],     #
      'floralwhite' =>           [255, 250, 240],     #
      'ivory' =>                 [255, 255, 240],     #
      'antiquewhite' =>          [250, 235, 215],     #
      'linen' =>                 [250, 240, 230],     #
      'lavenderblush' =>         [255, 240, 245],     #
      'mistyrose' =>             [255, 228, 225] }    #


   GRAYS = { palette_name: 'Grays', palette_count: 10,
      'gainsboro' =>             [220, 220, 220],     #DCDCDC
      'lightgray' =>             [211, 211, 211],     #D3D3D3
      'silver' =>                [192, 192, 192],     #C0C0C0
      'darkgray' =>              [169, 169, 169],     #A9A9A9
      'gray' =>                  [128, 128, 128],     #808080
      'dimgray' =>               [105, 105, 105],     #696969
      'lightslategray' =>        [119, 136, 153],     #778899
      'slategray' =>             [112, 128, 144],     #708090
      'darkslategray' =>         [47, 79, 79],        #2F4F4F
      'black' =>                 [0, 0, 0] }          #000000


   # full HTML set (140)
   set = [REDS, PINKS, ORANGES, YELLOWS, GREENS, CYANS, BLUES, PURPLES, BROWNS,
          WHITES, GRAYS].reduce(&:merge).reject { |key, _| key.to_s.include?('palette_') }
   HTML = { palette_name: 'HTML', palette_count: set.length }.merge(set)

end

