Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

rgb>cmyk: function [
  r [integer!] "0 - 255"
  g [integer!] "0 - 255"
  b [integer!] "0 - 255"
  /precise
][
  r': r / 255.0
  g': g / 255.0
  b': b / 255.0

  k: 1 - max (max r' g') b'
  k: to-percent k

  c: (1 - r' - k) / (1 - k)
  c: to-percent c

  m: (1 - g' - k) / (1 - k)
  m: to-percent m

  y: (1 - b' - k) / (1 - k)
  y: to-percent y

  either precise [
    return reduce [c m y k]
  ][
    c: round c
    m: round m
    y: round y
    k: round k
    return reduce [c m y k]
  ]

]
;
; r: 105
; g: 12
; b: 33
; ; c: 0
; ; m: 89
; ; y: 69
; ; k: 59
; rgb>cmyk r g b
