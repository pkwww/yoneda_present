#import "@preview/ilm:1.4.1": *
#import "@preview/theorion:0.4.0": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: theorem
#import cosmos.simple: definition
#let rainbow = cosmos.rainbow
#let fancy = cosmos.fancy
#let simple = cosmos.simple

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

#include "1-category.typ"