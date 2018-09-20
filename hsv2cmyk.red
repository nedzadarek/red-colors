Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

hsv>cmyk: function [
  h [integer!] "0 - 360"
  s [percent! float!] "0.0 - 1.0 or percent!"
  v [percent! float!] "0.0 - 1.0 or percent!"
  /precise
][
  if precise [make error! "To be implemented!"]

  temp: hsv>rgb h s v
  do reduce [rgb>cmyk temp/1 temp/2 temp/3]
]
