Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

hsv>hsl: function [
  h [integer!] "0 - 360"
  s [percent! float!] "0.0 - 1.0 or percent!"
  v [percent! float!] "0.0 - 1.0 or percent!"
  /precise

][
  if precise [make error! "To be implemented!"]
  temp: hsv>rgb h s v
  do reduce [rgb>hsl temp/1 temp/2 temp/3]

]
; hsv>hsl 360 1.0 1.0
