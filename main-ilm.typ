#import "@preview/ilm:1.4.1": *
#import "@preview/theorion:0.4.0": *
#import cosmos.rainbow: *

#set text(lang: "en")

#show: ilm.with(
  title: [Yoneda Lemma],
  author: "pkw",
  date: datetime.today(),
  // abstract: [#lorem(30)],
  // bibliography: bibliography("refs.bib"),
  chapter-pagebreak: false,
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#show raw: set text(font: ("Libertinus Serif", "Noto Serif TC"), size: 9pt)
#show math.equation: set text(font: "New Computer Modern Math")
#show: show-theorion

= Category
#definition[
  A category $cal(C)$ consists of the following data:
  + collection of objects (not necessaily a set): $X, Y, Z, ...$
  + collection of morphisms (arrows) (not necessaily a set): $f, g, h, ...$
  so that,
  + each morphisms has domain and codomain of objects, denoted as $f: X -> Y$
  + each object has a (the) identity morphism $id_X: X -> X$
  + morphism composition "$compose$" : if $f: X -> Y$ and $g: Y -> Z$, then there exists a morphism $g compose f: X -> Z$ (or sometimes $f >> g$)
  satisfying:
  + associativity: if $f: X -> Y$, $g: Y -> Z$, $h: Z -> W$, then $(h compose g) compose f = h compose (g compose f)$
  + identity: for any morphism $f: X -> Y$, we have $id_X compose f = f = f compose id_Y$
]<def:category>
#example[
  A monoid $M$ can be viewd as a category (sometimes denoted as $bold(B)M$):
  + Object: a single dummy object $*$
  + Morphism: elements of $M$, i.e., for each $m in M$, there is a morphism $f_m: * -> *$
  + Identity morphism: the identity element $e$ of $M$ corresponds to the identity morphism $id_*: * -> *$
  + Composition is the monoid multiplication
  + associativity and identity laws follow from those of monoids.
]
#example[
  The category $sans("Set")$:
  + Objects: the proper class of all sets
  + Morphisms: a morphism from $X -> Y$ is a set theorectic function from $X -> Y$
]