#import "@preview/numbly:0.1.0": numbly
// #import "@preview/tablem:0.3.0": tablem, three-line-table
// #import "@preview/mitex:0.2.5": *
// #import "@preview/cmarker:0.1.6": render as cmarker-render
#import "@preview/theorion:0.4.0": *
// #import cosmos.fancy: *
// #let md = cmarker-render.with(math: mitex)

#let default-font = (
  main: "Libertinus Serif",
  mono: "DejaVu Sans Mono",
  // cjk: "Noto Serif TC",
  // emph-cjk: "KaiTi",
  math: "New Computer Modern Math",
  // math-cjk: "Noto Serif TC",
)

// Definitions for math
#let prox = math.op("prox")
#let proj = math.op("proj")
#let argmax = math.op("argmax", limits: true)
#let argmin = math.op("argmin", limits: true)

#let ori(
  media: "print",
  theme: "light",
  size: 11pt,
  screen-size: 11pt,
  title: none,
  author: none,
  subject: none,
  semester: none,
  date: none,
  font: default-font,
  lang: "zh",
  region: "cn",
  first-line-indent: (amount: 0pt, all: false),
  maketitle: false,
  makeoutline: false,
  outline-depth: 2,
  body,
) = {
  assert(media == "screen" or media == "print", message: "media must be 'screen' or 'print'")
  assert(theme == "light" or theme == "dark", message: "theme must be 'light' or 'dark'")
  let page-margin = if media == "screen" { (x: 35pt, y: 35pt) } else { auto }
  let text-size = if media == "screen" { screen-size } else { size }
  let bg-color = if theme == "dark" { rgb("#1f1f1f") } else { rgb("#ffffff") }
  let text-color = if theme == "dark" { rgb("#ffffff") } else { rgb("#000000") }
  let raw-color = if theme == "dark" { rgb("#27292c") } else { rgb("#f0f0f0") }
  let font = default-font + font

  /// 设置字体。
  set text(
    font: font.main,
    size: text-size,
    fill: text-color,
    lang: lang,
    region: region,
  )
  show emph: text.with(font: font.main)
  show raw: set text(font: font.main)
  show math.equation: it => {
    set text(font: font.math)
    // show regex("\p{script=Han}"): set text(font: font.math-cjk)
    it
  }

  /// 设置段落样式。
  set par(
    justify: true,
    first-line-indent: if first-line-indent == auto {
      (amount: 2em, all: true)
    } else {
      first-line-indent
    },
  )

  /// 设置标题样式。
  // show heading: it => {
  //   show h.where(amount: 0.3em): none
  //   it
  // }
  // show heading: set block(spacing: 1.2em)

  /// 设置代码块样式。
  show raw.where(block: false): body => box(
    fill: raw-color,
    inset: (x: 3pt, y: 0pt),
    outset: (x: 0pt, y: 3pt),
    radius: 2pt,
    {
      set par(justify: false)
      body
    },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: raw-color,
    outset: (x: 0pt, y: 4pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    {
      set par(justify: false)
      body
    },
  )

  /// 设置链接样式。
  show link: it => {
    if type(it.dest) == str {
      set text(fill: blue)
      it
    } else {
      it
    }
  }

  /// 设置 figure 样式。
  show figure.where(kind: table): set figure.caption(position: top)

  /// 设置列表样式。
  set list(indent: 6pt)
  set enum(indent: 6pt)
  set enum(numbering: numbly("{1:1}.", "{2:1})", "{3:a}."), full: true)

  /// 设置引用样式。
  set bibliography(style: "ieee")

  /// 基础设置。
  set document(title: title, author: if type(author) == str { author } else { () }, date: date)

  /// 标题页。
  if maketitle {
    // Title page
    align(center + top)[
      #v(20%)
      #text(2em, weight: 500, subject)
      #v(2em, weak: true)
      #text(2em, weight: 500, title)
      #v(2em, weak: true)
      #author
      #v(2em, weak: true)
      #text(date.display("[month repr:long] [day padding:zero], [year repr:full]"))
    ]
    pagebreak(weak: true)
  }

  /// 目录。
  if makeoutline {
    show heading: align.with(center)
    show outline.entry: set block(spacing: 1.2em)

    outline(depth: outline-depth, indent: 2em)
    pagebreak(weak: true)
  }

  /// 重置页面计数器。
  counter(page).update(1)

  /// 设置页面。
  set page(
    paper: "a4",
    header: {
      set text(0.9em)
      stack(
        spacing: 0.2em,
        grid(
          columns: (1fr, auto, 1fr),
          align(left, semester), align(center, subject), align(right, title),
        ),
        v(0.3em),
        line(length: 100%, stroke: 1pt + text-color),
        v(.15em),
        line(length: 100%, stroke: .5pt + text-color),
      )
      // reset footnote counter
      counter(footnote).update(0)
    },
    fill: bg-color,
    numbering: "1",
    margin: page-margin,
  )

  /// 设置定理环境。
  show: show-theorion

  body
}
