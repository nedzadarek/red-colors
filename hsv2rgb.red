Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

; https://www.rapidtables.com/convert/color/hsv-to-rgb.html
hsv>rgb: function [
  h [integer!] "0 - 360"
  s [percent! float!] "0.0 - 1.0 or percent!"
  v [percent! float!] "0.0 - 1.0 or percent!"
  /precise
][
  s': to-float s
  v': to-float v

  c: v' * s'
  x: c * (1 - absolute(mod (h / 60.0) 2 - 1))
  m: v' - c

  r': g': b': 0
  set [r' g' b'] case [
    (h >= 0) and (h < 60) [reduce [c x 0]]
    h < 120 [reduce [x c 0]]
    h < 180 [reduce [0 c x]]
    h < 240 [reduce [0 x c]]
    h < 300 [reduce [x 0 c]]
    h <= 360 [reduce [c 0 x]]
  ]

  r: g: b: 0
  set [r g b] reduce [
    (r' + m) * 255
    (g' + m) * 255
    (b' + m) * 255
  ]

  either precise [
    reduce [r g b]
  ][
    to-tuple reduce [r g b]
  ]
]

; hue: 340 saturation: 0.65 value: 0.48
; ; Red: 122 Green: 43 Blue: 69
; hsv>rgb hue saturation value
