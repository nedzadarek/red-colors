Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

cmyk>hsv: function [
  cyan
  magenta
  yellow
  black
  /precise
][
  if precise [do make error! "To be implemented!"]

  temp: cmyk>rgb cyan magenta yellow black
  do reduce [rgb>hsv temp/1 temp/2 temp/3]
]

; cmyk>hsv 1% 1% 1% 1%
