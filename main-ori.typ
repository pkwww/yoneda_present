// #import "@preview/ori:0.2.3": *
#import "custom-ori.typ":*

#let font = (
  main: "Libertinus Serif",
  mono: "DejaVu Sans Mono",
  // cjk: "Noto Serif TC",
  // emph-cjk: "KaiTi",
  math: "New Computer Modern Math",
  // math-cjk: "Noto Serif TC",
)

#show: ori.with(
  title: "Yoneda Lemma",
  author: "pkw",
  date: datetime.today(),
  maketitle: true,
  makeoutline: true,
  lang: "en",
  region: "hk",
  font: font,
  // theme: "dark",
  // media: "screen",
)

#set heading(numbering: "1." )

= Category
== DejaVu
=== DejaVu Sans