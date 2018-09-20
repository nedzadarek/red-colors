Red [
  author: "Nędza Darek"
  license: {See %license.md}
  url: https://github.com/nedzadarek/red-colors
  version: 0.0.1
  subversion: 'alpha
]

; https://www.rapidtables.com/convert/color/rgb-to-hsv.html
rgb>hsv: function [
	r [integer!] "0-255"
	g [integer!] "0-255"
	b [integer!] "0-255"
	/precise
][
	r': r / 255.0
	g': g / 255.0
	b': b / 255.0


	c-max: max (max r' g') b'
	c-min: min (min r' g') b'
	delta: c-max - c-min

	H: case [
		delta = 0  [0]
		c-max = r' [60 * mod ( (g' - b') / delta) 6]
		c-max = g' [60 * ((b' - r') / delta + 2)]
		c-max = b' [60 * ((r' - g') / delta + 4)]
	]

	S: either c-max = 0 [
		0
	][
		delta / c-max
	]

	V: c-max

	h: to-integer h
	s: to-percent s
	v: to-percent v

	either precise [
		reduce [h s v]
	][
		h: round h
		s: round s
		v: round v
		reduce [h s v]
	]
]
;
;
; r: 123 g: 42 b: 69
; ; h: 340 s: 65.9 v: 48.2
; rgb>hsv r g b
