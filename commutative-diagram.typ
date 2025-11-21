#import "@preview/commute:0.3.0": node, arr, commutative-diagram
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

#let nat-trans(
  nodes,
  arrows,
  use-def: false,
  node-padding: (70pt, 70pt)
) = {
  let arrow-specs = if use-def {
    (
      arr((0, 0), (0, 1), none, "def"),
      arr((0, 0), (1, 0), none, "def"),
      arr((0, 1), (1, 1), none, "def"),
      arr((1, 0), (1, 1), none, "def"),
    )
  } else {
    (
      arr((0, 0), (0, 1), arrows.at(0)),
      arr((0, 0), (1, 0), arrows.at(1), label-pos: right),
      arr((0, 1), (1, 1), arrows.at(2)),
      arr((1, 0), (1, 1), arrows.at(3), label-pos: right),
    )
  }
  
  commutative-diagram(
    node-padding: node-padding,
    node((0, 0), nodes.at(0)),
    node((0, 1), nodes.at(1)),
    node((1, 0), nodes.at(2)),
    node((1, 1), nodes.at(3)),
    ..arrow-specs,
  )
}

#let nat-trans-el(
  nodes,
  node-padding: (70pt, 70pt)
) = nat-trans(nodes, none, use-def: true, node-padding: node-padding)
