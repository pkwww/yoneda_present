#import "import.typ":*

#show: ilm.with(
  title: [Yoneda Lemma],
  author: "pkw",
  date: datetime.today(),
  // abstract: [#lorem(30)],
  // table-of-contents: none,
  // bibliography: bibliography("refs.bib"),
  chapter-pagebreak: false,
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#show raw: set text(font: ("Libertinus Serif", "Noto Serif TC"), size: 9pt)
#show math.equation: set text(font: "New Computer Modern Math")
#show math.equation.where(block: false): box
#show: show-theorion

#set text(lang: "en")
#set enum(indent: 1em)
#set list(indent: 1em)

#counter(page).update(1)

= Basic Notions in Category Theory
// #include "1-1-category.typ"
// #include "1-2-functor.typ"
#include "1-3-nat-trans.typ"
// = Yoneda Lemma, Representation, Universality