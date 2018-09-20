Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

hsl>cmyk: function [
  h [integer!] "0 - 360"
  s [percent! float!] "0.0 - 1.0 or percent!"
  l [percent! float!] "0.0 - 1.0 or percent!"
  /precise
][
  if precise [make error! "To be implemented"]

  temp: hsl>rgb h s l
  do reduce [rgb>cmyk temp/1 temp/2 temp/3]
]

; hsl>cmyk 100 0.5 0.5
