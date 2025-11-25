#import "import.typ":*

// override ilm defaults
#set text(
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"), 
    "Noto Serif HK",
  ), 
)

#show: ilm.with(
  title: [Yoneda Lemma],
  author: "pkw 榮 よ",
  date: datetime.today(),
  // abstract: [#lorem(30)],
  table-of-contents: none,
  // bibliography: bibliography("refs.bib"),
  chapter-pagebreak: false,
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#show math.equation: set text(
  font: (
    (name: "New Computer Modern Math"),
    (name: "Noto Sans JP")
  ),
  weight: "regular"
)
#show math.equation.where(block: false): box
#set math.equation(numbering: none)
#set math.frac(style: "horizontal")
#show: show-theorion
#set-theorion-numbering("1.1.1.a")

// override ilm defaults again since previous is re-override in ilm
#set text(
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Serif JP"
  ),
  size: 12pt,
  lang: "en"
)
#set enum(indent: 1em)
#set list(indent: 1em)
#set underline(stroke: 1pt + black)

#counter(page).update(1)

= Basic Notions in Category Theory
#include "1-1-category.typ"
#include "1-2-universal-prop.typ"
#include "1-3-functor.typ"
#include "1-4-nat-trans.typ"
= Yoneda Lemma, Representation, Universality
#include "2-1-yoneda.typ"
#include "2-2-representation.typ"