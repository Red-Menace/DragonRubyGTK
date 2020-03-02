
#
#  Circular Gray color index definitions (RGB 0 - 255).
#


module CircularGrayColors

   # Gray colors circulate from black > gray > white > gray > black - colors are indexes.
   CIRCULAR_GRAYS = { palette_name: 'Circular Grays', palette_count: 128,
      'CG-1' =>   [0, 0, 0],        #000000  black
      'CG-2' =>   [4, 4, 4],        #040404
      'CG-3' =>   [8, 8, 8],        #080808
      'CG-4' =>   [12, 12, 12],     #0C0C0C
      'CG-5' =>   [16, 16, 16],     #101010
      'CG-6' =>   [20, 20, 20],     #141414
      'CG-7' =>   [24, 24, 24],     #181818
      'CG-8' =>   [28, 28, 28],     #1C1C1C
      'CG-9' =>   [32, 32, 32],     #202020
      'CG-10' =>  [36, 36, 36],     #242424
      'CG-11' =>  [40, 40, 40],     #282828
      'CG-12' =>  [44, 44, 44],     #2C2C2C
      'CG-13' =>  [48, 48, 48],     #303030
      'CG-14' =>  [52, 52, 52],     #343434
      'CG-15' =>  [56, 56, 56],     #383838
      'CG-16' =>  [60, 60, 60],     #3C3C3C
      'CG-17' =>  [64, 64, 64],     #404040  dark gray
      'CG-18' =>  [68, 68, 68],     #444444
      'CG-19' =>  [72, 72, 72],     #484848
      'CG-20' =>  [76, 76, 76],     #4C4C4C
      'CG-21' =>  [80, 80, 80],     #505050
      'CG-22' =>  [84, 84, 84],     #545454
      'CG-23' =>  [88, 88, 88],     #585858
      'CG-24' =>  [92, 92, 92],     #5C5C5C
      'CG-25' =>  [96, 96, 96],     #606060
      'CG-26' =>  [100, 100, 100],  #646464
      'CG-27' =>  [104, 104, 104],  #686868
      'CG-28' =>  [108, 108, 108],  #6C6C6C
      'CG-29' =>  [112, 112, 112],  #707070
      'CG-30' =>  [116, 116, 116],  #747474
      'CG-31' =>  [120, 120, 120],  #787878
      'CG-32' =>  [124, 124, 124],  #7C7C7C
      
      'CG-33' =>  [128, 128, 128],  #808080  gray
      'CG-34' =>  [132, 132, 132],  #848484
      'CG-35' =>  [136, 136, 136],  #888888
      'CG-36' =>  [140, 140, 140],  #8C8C8C
      'CG-37' =>  [144, 144, 144],  #909090
      'CG-38' =>  [148, 148, 148],  #949494
      'CG-39' =>  [152, 152, 152],  #989898
      'CG-40' =>  [156, 156, 156],  #9C9C9C
      'CG-41' =>  [160, 160, 160],  #A0A0A0
      'CG-42' =>  [164, 164, 164],  #A4A4A4
      'CG-43' =>  [168, 168, 168],  #A8A8A8
      'CG-44' =>  [172, 172, 172],  #ACACAC
      'CG-45' =>  [176, 176, 176],  #B0B0B0
      'CG-46' =>  [180, 180, 180],  #B4B4B4
      'CG-47' =>  [184, 184, 184],  #B8B8B8
      'CG-48' =>  [188, 188, 188],  #BCBCBC
      'CG-49' =>  [192, 192, 192],  #C0C0C0  silver
      'CG-50' =>  [196, 196, 196],  #C4C4C4
      'CG-51' =>  [200, 200, 200],  #C8C8C8
      'CG-52' =>  [204, 204, 204],  #CCCCCC
      'CG-53' =>  [208, 208, 208],  #D0D0D0
      'CG-54' =>  [212, 212, 212],  #D4D4D4
      'CG-55' =>  [216, 216, 216],  #D8D8D8
      'CG-56' =>  [220, 220, 220],  #DCDCDC
      'CG-57' =>  [224, 224, 224],  #E0E0E0
      'CG-58' =>  [228, 228, 228],  #E4E4E4
      'CG-59' =>  [232, 232, 232],  #E8E8E8
      'CG-60' =>  [236, 236, 236],  #ECECEC
      'CG-61' =>  [240, 240, 240],  #F0F0F0
      'CG-62' =>  [244, 244, 244],  #F4F4F4
      'CG-63' =>  [248, 248, 248],  #F8F8F8
      'CG-64' =>  [252, 252, 252],  #FCFCFC
      
      'CG-65' =>  [255, 255, 255],  #FFFFFF  white
      'CG-66' =>  [252, 252, 252],  #FCFCFC
      'CG-67' =>  [248, 248, 248],  #F8F8F8
      'CG-68' =>  [244, 244, 244],  #F4F4F4
      'CG-69' =>  [240, 240, 240],  #F0F0F0
      'CG-70' =>  [236, 236, 236],  #ECECEC
      'CG-71' =>  [232, 232, 232],  #E8E8E8
      'CG-72' =>  [228, 228, 228],  #E4E4E4
      'CG-73' =>  [224, 224, 224],  #E0E0E0
      'CG-74' =>  [220, 220, 220],  #DCDCDC
      'CG-75' =>  [216, 216, 216],  #D8D8D8
      'CG-76' =>  [212, 212, 212],  #D4D4D4
      'CG-77' =>  [208, 208, 208],  #D0D0D0
      'CG-78' =>  [204, 204, 204],  #CCCCCC
      'CG-79' =>  [200, 200, 200],  #C8C8C8
      'CG-80' =>  [196, 196, 196],  #C4C4C4
      'CG-81' =>  [192, 192, 192],  #C0C0C0  silver
      'CG-82' =>  [188, 188, 188],  #BCBCBC
      'CG-83' =>  [184, 184, 184],  #B8B8B8
      'CG-84' =>  [180, 180, 180],  #B4B4B4
      'CG-85' =>  [176, 176, 176],  #B0B0B0
      'CG-86' =>  [172, 172, 172],  #ACACAC
      'CG-87' =>  [168, 168, 168],  #A8A8A8
      'CG-88' =>  [164, 164, 164],  #A4A4A4
      'CG-89' =>  [160, 160, 160],  #A0A0A0
      'CG-90' =>  [156, 156, 156],  #9C9C9C
      'CG-91' =>  [152, 152, 152],  #989898
      'CG-92' =>  [148, 148, 148],  #949494
      'CG-93' =>  [144, 144, 144],  #909090
      'CG-94' =>  [140, 140, 140],  #8C8C8C
      'CG-95' =>  [136, 136, 136],  #888888
      'CG-96' =>  [132, 132, 132],  #848484
      
      'CG-97' =>  [128, 128, 128],  #808080  gray
      'CG-98' =>  [124, 124, 124],  #7C7C7C
      'CG-99' =>  [120, 120, 120],  #787878
      'CG-100' => [116, 116, 116],  #747474
      'CG-101' => [112, 112, 112],  #707070
      'CG-102' => [108, 108, 108],  #6C6C6C
      'CG-103' => [104, 104, 104],  #686868
      'CG-104' => [100, 100, 100],  #646464
      'CG-105' => [96, 96, 96],     #606060
      'CG-106' => [92, 92, 92],     #5C5C5C
      'CG-107' => [88, 88, 88],     #585858
      'CG-108' => [84, 84, 84],     #545454
      'CG-109' => [80, 80, 80],     #505050
      'CG-110' => [76, 76, 76],     #4C4C4C
      'CG-111' => [72, 72, 72],     #484848
      'CG-112' => [68, 68, 68],     #444444
      'CG-113' => [64, 64, 64],     #404040  dark gray
      'CG-114' => [60, 60, 60],     #3C3C3C
      'CG-115' => [56, 56, 56],     #383838
      'CG-116' => [52, 52, 52],     #343434
      'CG-117' => [48, 48, 48],     #303030
      'CG-118' => [44, 44, 44],     #2C2C2C
      'CG-119' => [40, 40, 40],     #282828
      'CG-120' => [36, 36, 36],     #242424
      'CG-121' => [32, 32, 32],     #202020
      'CG-122' => [28, 28, 28],     #1C1C1C
      'CG-123' => [24, 24, 24],     #181818
      'CG-124' => [20, 20, 20],     #141414
      'CG-125' => [16, 16, 16],     #101010
      'CG-126' => [12, 12, 12],     #0C0C0C
      'CG-127' => [8, 8, 8],        #080808
      'CG-128' => [4, 4, 4] }       #040404
   
end