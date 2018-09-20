Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

do %cmyk2rgb.red
do %hsl2rgb.red
do %hsv2rgb.red
do %rgb2cmyk.red
do %rgb2hsl.red
do %rgb2hsv.red
do %hsl2cmyk.red
do %hsl2hsv.red
do %hsv2cmyk.red
do %hsv2hsl.red
do %cmyk2hsv.red
do %cmyk2hsl.red

to-range: function [n a b] [
  if n < a [
    return a
  ]
  if n > b [
    return b
  ]
  return n
]

l: layout [
  style color-panel: panel silver
  style field-color-values: text 40 ""
  do [
    rea: make deep-reactor! [
      color-model-changed: 'fuu
    ]

    temp: none
  ]
  color-preview: base 100x100 0.0.0.0 react [
    face/color: to-tuple reduce [
      to-integer round (255 * rgb-red/data )
      to-integer round (255 * rgb-green/data)
      to-integer round (255 * rgb-blue/data)
    ]
  ]



  rgb: color-panel [
    do [
      rgb-changed: [
        rea/color-model-changed: 'rgb
      ]
    ]

    across
    text "RGB: " return

    rgb-red:   slider rgb-changed
    rgb-red-field: field-color-values

    ; range check:
    ; on-change [
    ;   ; ___rgb-red-field-temp:
    ;   if 255 < to-integer rgb-red-field/text [
    ;     print ">255"
    ;     probe rgb-red-field/text: "255"
    ;   ]
    ;   if 0 > to-integer rgb-red-field/text [
    ;     print "<0"
    ;     rgb-red-field/text: "0"
    ;   ]
    ; ]
    ; react later [
    ;   rgb-red/data: divide to-integer rgb-red-field/text 255.0
    ; ]


    react [
      rgb-red-field/data: to-integer (255 * rgb-red/data)
    ]
    return

    rgb-green: slider rgb-changed
    rgb-green-field: field-color-values
    react [
      rgb-green-field/data: to-integer (255 * rgb-green/data)
    ]
    return


    rgb-blue:  slider rgb-changed
    rgb-blue-field: field-color-values
    react [
      rgb-blue-field/data: to-integer (255 * rgb-blue/data)
    ]
    return
  ]

  react [
    if rea/color-model-changed = 'rgb [
      temp: rgb>hsv
        to-integer round (255 * rgb-red/data)
        to-integer round (255 * rgb-green/data)
        to-integer round (255 * rgb-blue/data)
      hsv-hue/data: temp/1 / 360.0
      hsv-saturation/data: temp/2
      hsv-value/data: temp/3

      temp: rgb>hsl
        to-integer round (255 * rgb-red/data)
        to-integer round (255 * rgb-green/data)
        to-integer round (255 * rgb-blue/data)
      hsl-hue/data: temp/1 / 360.0
      hsl-saturation/data: temp/2
      hsl-lightness/data: temp/3

      temp: rgb>cmyk
        to-integer round (255 * rgb-red/data)
        to-integer round (255 * rgb-green/data)
        to-integer round (255 * rgb-blue/data)
      cmyk-cyan/data: temp/1
      cmyk-magenta/data: temp/2
      cmyk-yellow/data: temp/3
      cmyk-black/data: temp/4
    ]
  ]




  hsv: color-panel [
    do [
      hsv-changed: [
        rea/color-model-changed: 'hsv
      ]
    ]

    across
    text "HSV:" return

    hsv-hue: slider hsv-changed
    hsv-hue-field: field-color-values
    react [
      hsv-hue-field/data: to-integer 360 * hsv-hue/data
    ]
    return

    hsv-saturation: slider hsv-changed
    hsv-saturation-field: field-color-values
    react [
      hsv-saturation-field/data: round to-percent hsv-saturation/data
    ]
    return

    hsv-value: slider hsv-changed
    hsv-value-field: field-color-values
    react [
      hsv-value-field/data: round to-percent hsv-value/data
    ]
    return
  ]

  react [
    if rea/color-model-changed = 'hsv [
      temp: hsv>rgb
        to-integer round (360 * hsv-hue/data)
        hsv-saturation/data
        hsv-value/data
      rgb-red/data: temp/1 / 255.0
      rgb-green/data: temp/2 / 255.0
      rgb-blue/data: temp/3 / 255.0

      temp: hsv>hsl
        to-integer round (360 * hsv-hue/data)
        hsv-saturation/data
        hsv-value/data
      hsl-hue/data: temp/1 / 360.0
      hsl-saturation/data: temp/2
      hsl-lightness/data: temp/3

      temp: hsv>cmyk
        to-integer round (360 * hsv-hue/data)
        hsv-saturation/data
        hsv-value/data
      cmyk-cyan/data: temp/1
      cmyk-magenta/data: temp/2
      cmyk-yellow/data: temp/3
      cmyk-black/data: temp/4
    ]
  ]



  hsl: color-panel [
    do [
      hsl-changed: [
        rea/color-model-changed: 'hsl
      ]
    ]

    across
    text "HSL:" return

    hsl-hue: slider hsl-changed
    hsl-hue-field: field-color-values
    react [
      hsl-hue-field/data: to-integer 360 * hsl-hue/data
    ]
    return

    hsl-saturation: slider hsl-changed
    hsl-saturation-field: field-color-values
    react [
      hsl-saturation-field/data: round to-percent hsl-saturation/data
    ]
    return

    hsl-lightness: slider hsl-changed
    hsl-lightness-field: field-color-values
    react [
      hsl-lightness-field/data: round to-percent hsl-lightness/data
    ]
    return
  ]
  react [
    if rea/color-model-changed = 'hsl [
      temp: hsl>rgb
        to-integer round (360 * hsl-hue/data)
        hsl-saturation/data
        hsl-lightness/data
      rgb-red/data: temp/1 / 255.0
      rgb-green/data: temp/2 / 255.0
      rgb-blue/data: temp/3 / 255.0

      temp: hsl>hsv
        to-integer round (360 * hsl-hue/data)
        hsl-saturation/data
        hsl-lightness/data
      hsv-hue/data: temp/1 / 360.0
      hsv-saturation/data: temp/2
      hsv-value/data: temp/3

      temp: hsl>cmyk
        to-integer round (360 * hsl-hue/data)
        hsl-saturation/data
        hsl-lightness/data
      cmyk-cyan/data: temp/1
      cmyk-magenta/data: temp/2
      cmyk-yellow/data: temp/3
      cmyk-black/data: temp/4

    ]
  ]

  cmyk: color-panel [
    do [
      cmyk-changed: [
        rea/color-model-changed: 'cmyk
      ]
    ]

    across
    text "CMYK:" return

    cmyk-cyan: slider cmyk-changed
    cmyk-cyan-field: field-color-values
    react [
      cmyk-cyan-field/data: round cmyk-cyan/data
    ]
    return

    cmyk-magenta: slider cmyk-changed
    cmyk-magenta-field: field-color-values
    react [
      cmyk-magenta-field/data: round cmyk-magenta/data
    ]
    return

    cmyk-yellow: slider cmyk-changed
    cmyk-yellow-field: field-color-values
    react [
      cmyk-yellow-field/data: round cmyk-yellow/data
    ]
    return

    cmyk-black: slider cmyk-changed
    cmyk-black-field: field-color-values
    react [
      cmyk-black-field/data: round cmyk-black/data
    ]
    return
  ]


  react [
    if rea/color-model-changed = 'cmyk [
      temp: cmyk>rgb
        cmyk-cyan/data
        cmyk-magenta/data
        cmyk-yellow/data
        cmyk-black/data
      rgb-red/data: temp/1 / 255.0
      rgb-green/data: temp/2 / 255.0
      rgb-blue/data: temp/3 / 255.0

      temp: cmyk>hsv
        cmyk-cyan/data
        cmyk-magenta/data
        cmyk-yellow/data
        cmyk-black/data
      hsv-hue/data: temp/1 / 360.0
      hsv-hue/data: temp/2
      hsv-value/data: temp/3

      temp: cmyk>hsl
        cmyk-cyan/data
        cmyk-magenta/data
        cmyk-yellow/data
        cmyk-black/data
      hsl-hue/data: temp/1 / 360.0
      hsl-hue/data: temp/2
      hsl-lightness/data: temp/3
    ]
  ]

  color-changed-debug: text react [
    color-changed-debug/text: uppercase to-string rea/color-model-changed
  ]

]
view l
