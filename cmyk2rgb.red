Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

cmyk>rgb: function [
  c [percent! float!] "percent or 0.0 to 1.0 values"
  m [percent! float!] "percent or 0.0 to 1.0 values"
  y [percent! float!] "percent or 0.0 to 1.0 values"
  k [percent! float!] "percent or 0.0 to 1.0 values"
  /precise "return block of values"
][
  c': to-float c
  m': to-float m
  y': to-float y
  k': to-float k

  r: 255 * (1 - c') * (1 - k')
  g: 255 * (1 - m') * (1 - k')
  b: 255 * (1 - y') * (1 - k')

  either precise [
    reduce [r g b]
  ][
    return to-tuple reduce [r g b]
  ]
]

; c: 13%
; m: 100%
; y: 14%
; k: 26%
; ; r: 164 g: 0 b: 162
; cmyk>rgb c m y k
; cmyk>rgb/precise c m y k
