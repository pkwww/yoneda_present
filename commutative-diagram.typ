#let grid-diagram(
  columns: 1,
  rows: 1,
  column-gutter: 5pt,
  row-gutter: 5pt,
  align: top,
  ..commutative-diagram,
) = {
  grid(
    columns: columns,
    rows: rows,
    column-gutter: column-gutter,
    row-gutter: row-gutter,
    align: align,
    ..commutative-diagram,
  )
}

// #align(center)[
//   #grid(
//     columns: 2,
//     column-gutter: 10pt,
//     align: top,
//     commutative-diagram(
//       node((0, 0), $V$),
//       node((0, 1), $W$),
//       node((1, 0), $V^(**)$),
//       node((1, 1), $W^(**)$),
//       arr((0, 0), (0, 1), $f$),
//       arr((0, 0), (1, 0), $(-)^(**)$, label-pos: right),
//       arr((0, 1), (1, 1), $(-)^(**)$),
//       arr((1, 0), (1, 1), $f^(**)$, label-pos: right),
//     ),
//     commutative-diagram(
//       node((0, 0), $v$),
//       node((0, 1), $f v$),
//       node((1, 0), $"eval"_v$),
//       node((1, 1), $"eval"_(f v) \ "eval"_v compose f^*$),
//       arr((0, 0), (0, 1), none, "def"),
//       arr((0, 0), (1, 0), none, "def"),
//       arr((0, 1), (1, 1), none, "def"),
//       arr((1, 0), (1, 1), none, "def"),
//     )
//   )
// ]