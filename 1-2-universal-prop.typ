#import "import.typ":*

== Universal Construction 
#quote(block: true)[ $dots.h$ but not that universal, for now]
#fancy.definition(title: "Initial, terminal object")[
  An *initial object* $bot$ in $calc$ is an object such that for every object $X$ in $calc$, there #underline[exists a unique] morphism $bot -> X$. Dually, a *terminal object* $top$ in $calc$ is an object such that for every object $X$ in $calc$, there #underline[exists a unique] morphism $X -> top$.
  An object that is both initial and terminal is called a *zero object*, denote as $0$.
]
#note-box[
  Not all categories have initial/terminal objects. For example, in the category of fields, there is no initial or terminal object.
]
#clouds.property[
  The initial (terminal) object is unique up to isomorphism.
]
#proof[
  Notice that the only unique morphism $bot -> bot$ must be $id_bot$. Then given two $bot_1, bot_2$, we have $bot_1 arrows.lr bot_2$, composing the morphism must $id$. Hence isomophic.
]
#property[
  Initial and terminal object are dual to each other. That is, a initial object in $calc$ is a terminal object in $calc^op$.
]

#v(1em)
#example[
  Bottom and top element is the initial and terminal object (resp.) in a poset (viewed as category). Hence the notation $bot, top$.
]

#example[
  Empty set and singleton set are the initial and terminal object (resp.) in $Set$.
]

#example[
  The trivial group is the zero object in $grp$.
]

#example[
  $ZZ$ is the initial object in $sans("Ring")$, while the trivial ring is the terminal object.
]

#example[
  $k$ is the initial object in $vectk$, while the trivial vector space is the terminal object.
]

#example[
  Though $sans("Field")$ does not have initial or terminal objects, the $sans("Field"_p)$, the fields with prime characteristic $p$, has $ZZ / p ZZ$ as its initial object.
]

#fancy.definition(title: "product")[
  Give two objects $X, Y$ in $calc$, their *product* $X times Y$ is an object together with two projection morphisms $pi_1: X times Y -> X$ and $pi_2: X times Y -> Y$, such that for any object $Z$ with morphisms $f_1: Z -> X$ and $f_2: Z -> Y$, there #underline[exists a unique] morphism $accent(f, tilde): Z -> X times Y$ making the following diagram commute:
  #align(center)[
    #commutative-diagram(
      node-padding: (35pt, 35pt),
      node((-1, 0), $Z$),
      node((0, 0), $X times Y$),
      node((1, -1), $X$),
      node((1, 1), $Y$),
      arr($Z$, $X times Y$, $exists! accent(f, tilde)$, "dashed"),
      arr($X times Y$, $X$, $pi_1$),
      arr($X times Y$, $Y$, $pi_2$, label-pos: right),
      arr($Z$, $X$, $f_1$, label-pos: right, curve: -30deg),
      arr($Z$, $Y$, $f_2$, curve: 30deg),
    )
  ]
  i.e. $f_1 = pi_1 compose accent(f, tilde)$ and $f_2 = pi_2 compose accent(f, tilde)$.
]
Dually,
#fancy.definition(title: "coproduct")[
  Given two objects $A, B$ in $calc$, their *coproduct* $A coprod B$ is an object together with two injection morphisms $i_1: A -> A coprod B$ and $i_2: B -> A coprod B$, such that for any object $Z$ with morphisms $f_1: A -> Z$ and $f_2: B -> Z$, there #underline[exists a unique] morphism $accent(f, tilde): A coprod B -> Z$ making the following diagram commute:
  #align(center)[
    #commutative-diagram(
      node-padding: (35pt, 35pt),
      node((-1, 0), $Z$),
      node((0, 0), $A coprod B$),
      node((1, -1), $A$),
      node((1, 1), $B$),
      arr($A coprod B$, $Z$, $exists! accent(f, tilde)$, label-pos:right, "dashed"),
      arr($A$, $A coprod B$, $i_1$, label-pos: right),
      arr($B$, $A coprod B$, $i_2$),
      arr($A$, $Z$, $f_1$, curve: 30deg),
      arr($B$, $Z$, $f_2$, label-pos: right, curve: -30deg),
    )
  ]
  i.e. $f_1 = accent(f, tilde) compose i_1$ and $f_2 = accent(f, tilde) compose i_2$.
]
#clouds.property[
  The product (coproduct) is unique up to isomorphism.
]
#property[
  Product and coproduct are dual to each other. That is, the product of $X, Y$ in $calc$ is the coproduct of $X, Y$ in $calc^op$.
]

#example[
  In a poset (viewed as category), the coproduct is the least upper bound (join), and the product is the greatest lower bound (meet).
]

#example[
  In set-like categories (e.g., $Set$, $grp$, $sans("Ring")$, $vectk$), the product is the Cartesian product.
]

#example[
  In $Set$, the coproduct is the disjoint union. In $grp$, the coproduct is the free product. In $vectk$, the coproduct is the direct sum.
]

// TODO: pushout, pullback