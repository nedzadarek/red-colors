Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

rgb>hsl: function [
  r [integer!] "0 - 255"
  g [integer!] "0 - 255"
  b [integer!] "0 - 255"
  /precise
][

  r': r / 255.0
  g': g / 255.0
  b': b / 255.0

  c-max: max (max r' g') b'
  c-min: min (min r' g') b'
  delta: c-max - c-min

  h: case [
    delta = 0  [0]
    c-max = r' [60 * (mod ((g' - b') / delta) 6)]
    c-max = g' [60 * (((b' - r') / delta) + 2)]
    c-max = b' [60 * (((r' - g') / delta) + 4)]
  ]

  l: (c-max + c-min) / 2

  s: case [
    delta = 0 [0]
    true      [delta / (1 - absolute(2 * l - 1 ))]
  ]

  h: to-integer h
  s: to-percent s
  l: to-percent l

  either precise [
    reduce [h s l]
  ][
    reduce [h (round s) (round l)]
  ]
]
; r: 111 g: 222 b: 42
; ; h: 97 s: 73.2 l: 51.8
; rgb>hsl r g b
; rgb>hsl/precise r g b
