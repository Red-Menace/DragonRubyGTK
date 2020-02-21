
#
#  Crayon color name definitions (RGB 0 - 255).
#  http://www.jennyscrayoncollection.com/2017/10/complete-list-of-current-crayola-crayon.html
#


module CrayonColors

   # Crayon colors by name - color names are lower_snake_case, with a few apostrophes.
   # Based on items in the 120 count box.
   CRAYONS = { palette_name: 'Crayons', palette_count: 120,
      'almond' =>                      [239, 219, 197],     #EFDBC5
      'antique_brass' =>               [205, 149, 117],     #CD9575
      'apricot' =>                     [253, 217, 181],     #FDD9B5
      'aquamarine' =>                  [120, 219, 226],     #78DBE2
      'asparagus' =>                   [135, 169, 107],     #87A96B
      'atomic_tangerine' =>            [255, 164, 116],     #FFA474
      'banana_mania' =>                [250, 231, 181],     #FAE7B5
      'beaver' =>                      [159, 129, 112],     #9F8170
      'bittersweet' =>                 [253, 124, 110],     #FD7C6E
      'black' =>                       [35, 35, 35],        #232323
      'blue' =>                        [31, 117, 254],      #1F75FE
      'blue_bell' =>                   [173, 173, 214],     #ADADD6
      'blue_green' =>                  [25, 158, 189],      #199EBD
      'blue_violet' =>                 [115, 102, 189],     #7366BD
      'bluetiful' =>                   [46, 80, 144],       #7366BD
      'blush' =>                       [222, 93, 131],      #DE5D83
      'brick_red' =>                   [203, 65, 84],       #CB4154      
      'brown' =>                       [180, 103, 77],      #B4674D
      'burnt_orange' =>                [255, 127, 73],      #FF7F49
      'burnt_sienna' =>                [234, 126, 93],      #EA7E5D
      'cadet_blue' =>                  [176, 183, 198],     #B0B7C6
      'canary' =>                      [255, 255, 159],     #FFFF99
      'caribbean_green' =>             [28, 211, 162],      #1CD3A2
      'carnation_pink' =>              [255, 170, 204],     #FFAACC
      'cerise' =>                      [221, 68, 146],      #DD4492
      'cerulean' =>                    [29, 172, 214],      #1DACD6
      'chestnut' =>                    [188, 93, 88],       #BC5D58
      'copper' =>                      [221, 148, 117],     #DD9475
      'cornflower' =>                  [154, 206, 235],     #9ACEEB
      'cotton_candy' =>                [255, 188, 217],     #FFBCD9
      'denim' =>                       [43, 108, 196],      #2B6CC4
      'desert_sand' =>                 [239, 205, 184],     #EFCDB8
      'eggplant' =>                    [110, 81, 96],       #6E5160
      'electric_lime' =>               [29, 249, 20],       #1DF914
      'fern' =>                        [113, 188, 120],     #71BC78
      'forest_green' =>                [109, 174, 129],     #6DAE81
      'fuchsia' =>                     [195, 100, 197],     #C364C5
      'fuzzy_wuzzy_brown' =>           [204, 102, 102],     #CC6666
      'gold' =>                        [231, 198, 151],     #E7C697
      'goldenrod' =>                   [252, 217, 117],     #FCD975
      'granny_smith_apple' =>          [168, 228, 160],     #A8E4A0
      'gray' =>                        [149, 145, 140],     #95918C
      'green' =>                       [28, 172, 120],      #1CAC78
      'green_yellow' =>                [240, 232, 145],     #F0E891
      'hot_magenta' =>                 [255, 29, 206],      #FF1DCE
      'inchworm' =>                    [178, 236, 93],      #B2EC5D
      'indigo' =>                      [93, 118, 203],      #5D76CB
      'jazzberry_jam' =>               [202, 55, 103],      #CA3767
      'jungle_green' =>                [59, 176, 143],      #3BB08F
      'laser_lemon' =>                 [253, 252, 116],     #FDFC74
      'lavender' =>                    [252, 180, 213],     #FCB4D5
      'macaroni_and_cheese' =>         [255, 189, 136],     #FFBD88
      'magenta' =>                     [246, 100, 175],     #F664AF
      'mahogany' =>                    [205, 74, 74],       #CD4A4A
      'manatee' =>                     [151, 154, 170],     #979AAA
      'mango_tango' =>                 [255, 130, 67],      #FF8243
      'maroon' =>                      [200, 56, 90],       #C8385A
      'mauvelous' =>                   [239, 152, 170],     #EF98AA
      'melon' =>                       [253, 188, 180],     #FDBCB4
      'midnight_blue' =>               [26, 72, 118],       #1A4876
      'mountain_meadow' =>             [48, 186, 143],      #30BA8F
      'navy_blue' =>                   [25, 116, 210],      #1974D2
      'neon_carrot' =>                 [255, 163, 67],      #FFA343
      'olive_green' =>                 [186, 184, 108],     #BAB86C
      'orange' =>                      [255, 117, 56],      #FF7538
      'orchid' =>                      [230, 168, 215],     #E6A8D7
      'outer_space' =>                 [65, 74, 76],        #414A4C
      'outrageous_orange' =>           [255, 110, 74],      #FF6E4A
      'pacific_blue' =>                [28, 169, 201],      #1CA9C9
      'peach' =>                       [255, 207, 171],     #FFCFAB
      'periwinkle' =>                  [197, 208, 230],     #C5D0E6
      'piggy_pink' =>                  [253, 215, 228],     #FDD7E4
      'pine_green' =>                  [21, 128, 120],      #158078
      'pink_flamingo' =>               [252, 116, 253],     #FC74FD
      'pink_sherbert' =>               [247, 128, 161],     #F780A1
      'plum' =>                        [142, 69, 133],      #8E4585
      'purple_heart' =>                [116, 66, 200],      #7442C8
      "purple_mountains'_majesty" =>   [157, 129, 186],     #9D81BA
      'purple_pizzazz' =>              [255, 29, 206],      #FF1DCE
      'radical_red' =>                 [255, 73, 108],      #FF496C
      'raw_sienna' =>                  [214, 138, 89],      #D68A59
      'razzle_dazzle_rose' =>          [255, 72, 208],      #FF48D0
      'razzmatazz' =>                  [227, 37, 107],      #E3256B
      'red' =>                         [238, 32, 77],       #EE204D
      'red_orange' =>                  [255, 83, 73],       #FF5349
      'red_violet' =>                  [192, 68, 143],      #C0448F
      'robin_egg_blue' =>              [31, 206, 203],      #1FCECB
      'royal_purple' =>                [120, 81, 169],      #7851A9
      'salmon' =>                      [255, 155, 170],     #FF9BAA
      'scarlet' =>                     [252, 40, 71],       #FC2847
      "screamin_green" =>              [118, 255, 122],     #76FF7A
      'sea_green' =>                   [159, 226, 191],     #9FE2BF
      'sepia' =>                       [165, 105, 79],      #A5694F
      'shadow' =>                      [138, 121, 93],      #8A795D
      'shamrock' =>                    [69, 206, 162],      #45CEA2
      'shocking_pink' =>               [251, 126, 253],     #FB7EFD
      'silver' =>                      [205, 197, 194],     #CDC5C2
      'sky_blue' =>                    [128, 218, 235],     #80DAEB
      'spring_green' =>                [236, 234, 190],     #ECEABE
      'sunglow' =>                     [255, 207, 72],      #FFCF48
      'sunset_orange' =>               [253, 94, 83],       #FD5E53
      'tan' =>                         [250, 167, 108],     #FAA76C
      'tickle_me_pink' =>              [252, 137, 172],     #FC89AC
      'timberwolf' =>                  [219, 215, 210],     #DBD7D2
      'tropical_rain_forest' =>        [23, 128, 109],      #17806D
      'tumbleweed' =>                  [222, 170, 136],     #DEAA88
      'turquoise_blue' =>              [119, 221, 231],     #77DDE7
      'unmellow_yellow' =>             [253, 252, 116],     #FFFF66
      'violet' =>                      [146, 110, 174],     #926EAE
      'violet_red' =>                  [247, 83, 148],      #F75394
      'vivid_tangerine' =>             [255, 160, 137],     #FFA089
      'vivid_violet' =>                [143, 80, 157],      #8F509D
      'white' =>                       [237, 237, 237],     #EDEDED
      'wild_blue_yonder' =>            [162, 173, 208],     #A2ADD0
      'wild_strawberry' =>             [255, 67, 164],      #FF43A4
      'wild_watermelon' =>             [252, 108, 133],     #FC6C85
      'wisteria' =>                    [205, 164, 222],     #CDA4DE
      'yellow' =>                      [252, 232, 131],     #FCE883
      'yellow_green' =>                [197, 227, 132],     #C5E384
      'yellow_orange' =>               [255, 182, 83] }     #FFAE42

end

