Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

hsl>rgb: function [
  h [integer!] "0 - 360"
  s [percent! float!] "0.0 - 1.0 or percent!"
  l [percent! float!] "0.0 - 1.0 or percent!"
  /precise
][
  s': to-float s
  l': to-float l


  c: (1 - absolute(2 * l' - 1)) * s'
  x: c * (1 - absolute(mod (h / 60.0) 2 - 1))
  m: l' - (c / 2)

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
;
; h: 97
; s: 73%
; l: 52%
; hsl>rgb h s l
; ; r: 112 g: 222 b: 43
