#import "import.typ":*

== Category
#quote(block: true)[ $dots.h$ or, monoidoid]
#fancy.definition(title: "Category")[
  A category $calc$ consists of the following data:
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
#fancy.definition(title: "Hom")[
  The collection of morphisms between $X$ and $Y$ is denoted as $calc(X, Y)$ or $"Hom"_(calc)(X, Y)$ (or simply $"Hom"(X, Y)$ if the category is clear from context).
]
#definition(title: "(Locally) Small Category")[
  A category is small if the collection of all morphisms is a set. (thus the collection of objects also a set)\
  A category is locally small if for any objects $X$ and $Y$, the morphisms between them, $calc(X, Y)$, is a set.
]
#note-box[
  Most of the categories we will discuss are at most locally small. We will not worry about size issues.
]
#example[
  The category $Set$:
  + Objects: the proper class of all sets
  + Morphisms: a morphism from $X -> Y$ is a set theorectic function from $X -> Y$
  + Identity, composition, associativity, identity laws are those of ordinary functions.
]
#example(title: "Example (Set-like category)")[
  The category $sans("Monoid")$ ($grp$, $vectk$, $sans("Top")$):
  + Objects: all monoids (groups, vector spaces over a field $k$, topological spaces)
  + Morphisms: a morphism from $M -> N$ is a monoid homomorphism (group homomorphism, linear map, continuous map) from $M -> N$
  + Identity, composition, associativity, identity laws are those of ordinary functions.
]
#example[
  A monoid $M$ can be viewd as a category (sometimes denoted as $unlp(M)$):
  + Object: a single dummy object $star$
  + Morphism: elements of $M$, i.e., for each $m in M$, there is a morphism $f_m: star -> star$
  + Identity morphism: the identity element $e$ of $M$ corresponds to the identity morphism $id_star: star -> star$
  + Composition is the monoid multiplication
  + associativity and identity laws follow from those of monoids.
]
#example[
  A poset (partially ordered set) $(P, <=)$ can be viewed as a category:
  + Objects: elements of $P$
  + Morphisms: for $x, y in P$, there is a single morphism $f: x -> y$ if $x <= y$; otherwise, there is no morphism from $x$ to $y$.
  + Identity morphism: for each $x in P$, the identity morphism $id_x: x -> x$ corresponds to the reflexivity
  + Composition: if there is a morphism $f: x -> y$ and a morphism $g: y -> z$, then there is a morphism $g compose f: x -> z$ corresponding to transitivity.
  + Associativity and identity laws doesn't mean anything here.
]
#idea-box(title: "Idea")[
  The real important things in a category are the morphisms (arrows) between objects, rather than the objects themselves.
]
#simple.definition(title: "Endomorphism")[
  A morphism $f: X -> X$ is called an endomorphism of $X$.
]
#simple.definition(title: "Isomorphism")[
  A morphism $f: X -> Y$ is called an isomorphism if there exists a morphism $g: Y -> X$ such that $g compose f = id_X$ and $f compose g = id_Y$. Denote $g$ as $f^(-1)$ and we say that $X$ and $Y$ are isomorphic, denoted as $X iso Y$.
]
#simple.definition(title: "Groupoid")[
  A category $cal(G)$ is called a groupoid if all morphisms in $cal(G)$ are isomorphisms.
]
#example[
  A group $G$ can be viewed as a category ($unlp(G)$) similar to monoid, with a single object {$star$} and morphisms are elements of $G$. Since all elements in a group are invertible, all morphisms in $unlp(G)$ are isomorphisms. Thus, $unlp(G)$ is a groupoid with a single object.
]

#example[
  Given a topological space $X$, the fundamental groupoid $Pi_1(X)$ is defined as:
  + objects: points in $X$
  + morphisms: given two points $x, y in X$, the equivalent classes of continuous paths from $x$ to $y$, where two paths are equivalent if they are homotopic (continuous deformation).
  + identity morphism: the constant path at each point
  + composition: concatenation of paths
  + invertibility is just reversing the path

  Fix a point $p$ in $X$, consider all the paths (up to homotopy) from $p$ to itself is called the fundamental group $pi_1(X, p)$.
]

#example[
  (A taste of non-trivial category) Given a category $calc$ and a fix object $c in calc$, the *over category* $calc / c$ is defined as:
  + objects: $calc$-morphisms $f: X -> c$
  + morphisms: given two objects $f: X -> c$ and $g: Y -> c$, a morphism from $f$ to $g$ is a $calc$-morphism $h: X -> Y$ such that the following diagram commutes:
  #align(center)[#commutative-diagram(
    node-padding: (35pt, 35pt),
    node((0, 0), $X$),
    node((0, 2), $Y$),
    arr($X$, $Y$, $h$),
    node((1, 1), $c$),
    arr($X$, $c$, $f$, label-pos: right),
    arr($Y$, $c$, $g$)
  )]
  i.e. $g compose h = f$. Exercise: Check that this is indeed a category.
]
#fancy.definition(title: "Subcategory")[
  A subcategory of a category $calc$ consists of some objects and some morphisms between these chosen objects, s.t. $id_X$ exists and morphism composition is closed. \
  (Think of submonoid)
]
#fancy.definition[
  Let $calc$ be a category. The *opposite category* $calc^op$ consists of:
  + objects: same as those of $calc$
  + morphisms: for each morphism $f: X -> Y$ in $calc$, there is a morphism $f^op: Y -> X$ in $calc^op$
  such that:
  + $id_(X)^op$ is the identity morphism of $X in calc^op$
  + for morphisms $f: X -> Y$ and $g: Y -> Z$ in $calc$, we have $(g compose f)^op = f^op compose_op g^op$ in $calc^op$
]
#note-box[
  We will not dive too much into opposite category. In particular, we will not give concrete examples of opposite category since they are quite non-trivial (e.g. $Set^op$ is the category of complete atomic boolean algebra, wtf). Fortunately, in our case, $calc^op$ usually only appear in domain or codomain of functors.
]

#example[
  Given a category $calc$ and a fix object $c in calc$, the *under category* $c / calc$ is defined as:
  + objects: $calc$-morphisms $f: c -> X$
  + morphisms: given two objects $f: c -> X$ and $g: c -> Y$, a morphism from $f$ to $g$ is a $calc$-morphism $h: X -> Y$ such that the following diagram commutes:
  #align(center)[#commutative-diagram(
    node-padding: (35pt, 35pt),
    node((1, 1), $c$),
    node((0, 0), $X$),
    node((0, 2), $Y$),
    arr($X$, $Y$, $h$),
    arr($c$, $X$, $f$),
    arr($c$, $Y$, $g$, label-pos: right)
  )]
  i.e. $h compose f = g$. This is dual to the over category.
]

#theorem(title: "Isomorphism is representable")[
  The following are equivalent:
  + $f: X -> Y$ is an isomorphism
  + for any $c in calc$, the map $f compose - : "Hom"(c, X) -> "Hom"(c, Y)$ is a bijection. ($f compose -$ is also written as $f_*$)
  + for any $c in calc$, the map $- compose f: "Hom"(Y, c) -> "Hom"(X, c)$ is a bijection. ($- compose f$ is also written as $f^*$)
]<thm:iso-repr>
#proof()[
  We first prove $(1) <=> (2)$, then use dual argument to get $(1) <=> (3)$.\
  $(1) => (2)$: Suppose $f: X -> Y$ is an isomorphism, with inverse $f^(-1): Y -> X$. \
  For any $c in calc$, we want to find the inverse $g_*$ of the map $ f_* eq.def f compose - : "Hom"(c, X) -> "Hom"(c, Y) $
  More precisely, let $X_*: c -> X$ in $"Hom"(c, X)$ and $Y_*: c -> Y$ in $"Hom"(c, Y)$, \
  we want to show that $g_*(f_*(X_*))= X_*$ and $f_*(g_*(Y_*)) = Y_*$. Define
  $ &g_*: "Hom"(c, Y) -> "Hom"(c, X) \
  &g_*(Y_*) eq.def f^(-1) compose Y_* $
  Unpacking the definitions will do the job.\

  $(2) => (1)$: First we want to prove the right inverse, i.e. exist $g: Y -> X$ such that $f compose g = id_Y$. \
  Consider when $c = Y$, then $f_*: "Hom"(Y, X) -> "Hom"(Y, Y)$. Since $f_*$ is surjective, every element in $"Hom"(Y, Y)$ has a preimage. In particular for $id_Y in "Hom"(Y, Y)$, there exists $g in "Hom"(Y, X)$ such that $f_*(g) =  id_Y$, i.e. $f compose g = id_Y$.
  Then we want to prove that this $g$ is also the left inverse, i.e. $g compose f = id_X$. \
  Consider when $c = X$, then $f_*: "Hom"(X, X) -> "Hom"(X, Y)$. Note that $g compose f: X -> X$ is in $"Hom"(X, X)$. Then
  #[
    #show math.eq: set text(fill: blue)
    $ f_*(g compose f) = f compose (g compose f)
                      = (f compose g) compose f
                      = id_Y compose f
                      = f
                      = f compose id_X
                      = f_*(id_X) $
  ]
  Since $f_*$ is injective, we have $g compose f = id_X$.
]

#proof(title: $(1) <=> (3)$)[
  The above result applied also to $calc^op$. We then have\
  $f: X -> Y$ is iso $<=>$ $f^op: Y -> X$ is iso $"iff"$ $[calc^(op)(c, Y) <-> calc^(op)(c, X)] <=> [calc(X, c) <-> calc(Y, c)]$.
]