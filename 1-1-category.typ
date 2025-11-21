#import "import.typ":*

== Category
#fancy.definition(title: "Category")[
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
#fancy.definition(title: "Hom")[
  The collection of morphisms between $X$ and $Y$ is denoted as $cal(C)(X, Y)$ or $"Hom"_cal(C)(X, Y)$ (or simply $"Hom"(X, Y)$ if the category is clear from context).
]
#definition(title: "(Locally) Small Category")[
  A category is small if the collection of all morphisms is a set. (thus the collection of objects also a set)\
  A category is locally small if for any objects $X$ and $Y$, the morphisms between them, $cal(C)(X, Y)$, is a set.
]
#note-box[
  Most of the categories we will discuss are at most locally small. We will not worry about size issues.
]
#example[
  The category $sans("Set")$:
  + Objects: the proper class of all sets
  + Morphisms: a morphism from $X -> Y$ is a set theorectic function from $X -> Y$
  + Identity, composition, associativity, identity laws are those of ordinary functions.
]
#example(title: "Example (Set-like category)")[
  The category $sans("Monoid")$ ($sans("Grp")$, $sans("Vect")_k$, $sans("Top")$):
  + Objects: all monoids (groups, vector spaces over a field $k$, topological spaces)
  + Morphisms: a morphism from $M -> N$ is a monoid homomorphism (group homomorphism, linear map, continuous map) from $M -> N$
  + Identity, composition, associativity, identity laws are those of ordinary functions.
]
#example[
  A monoid $M$ can be viewd as a category (sometimes denoted as $sans(bold(B)M)$):
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
  A morphism $f: X -> Y$ is called an isomorphism if there exists a morphism $g: Y -> X$ such that $g compose f = id_X$ and $f compose g = id_Y$. Denote $g$ as $f^(-1)$ and we say that $X$ and $Y$ are isomorphic, denoted as $X tilde.equiv Y$.
]
#simple.definition(title: "Groupoid")[
  A category $cal(G)$ is called a groupoid if all morphisms in $cal(G)$ are isomorphisms.
]
#example[
  A group $G$ can be viewed as a category ($sans(bold(B)G)$) similar to monoid, with a single object {$star$} and morphisms are elements of $G$. Since all elements in a group are invertible, all morphisms in $sans(bold(B)G)$ are isomorphisms. Thus, $sans(bold(B)G)$ is a groupoid with a single object.
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
#definition(title: "Subcategory")[
  A subcategory of a category $cal(C)$ consists of some objects and some morphisms between these chosen objects, s.t. $id_X$ exists and morphism composition is closed. \
  (Think of submonoid)
]
#example[
  (A taste of non-trivial category) Given a category $cal(C)$ and a fix object $c in cal(C)$, the _over category_ $frac(cal(C), c, style: "horizontal")$ is defined as:
  + objects: $cal(C)$-morphisms $f: X -> c$
  + morphisms: given two objects $f: X -> c$ and $g: Y -> c$, a morphism from $f$ to $g$ is a $cal(C)$-morphism $h: X -> Y$ such that the following diagram commutes:
  #align(center)[#commutative-diagram(
    node-padding: (35pt, 35pt),
    node((0, 0), $X$),
    node((0, 2), $Y$),
    arr($X$, $Y$, $h$),
    node((1, 1), $c$),
    arr($X$, $c$, $f$, label-pos: right),
    arr($Y$, $c$, $g$)
  )]
  (i.e. $g compose h = f$ or $h >> g = f$)\
  Excersice: Check that this is indeed a category.
]
#fancy.definition[
  Let $cal(C)$ be a category. The _opposite category_ $cal(C)^"op"$ consists of:
  + objects: same as those of $cal(C)$
  + morphisms: for each morphism $f: X -> Y$ in $cal(C)$, there is a morphism $f^"op": Y -> X$ in $cal(C)^"op"$
  such that:
  + $id_(X)^"op"$ is the identity morphism of $X in cal(C)^"op"$
  + for morphisms $f: X -> Y$ and $g: Y -> Z$ in $cal(C)$, we have $(g compose f)^"op" = f^"op" compose_"op" g^"op"$ in $cal(C)^"op"$
]
#note-box[
  We will not dive too much into opposite category. In particular, we will not give concrete examples of opposite category since they are quite non-trivial (e.g. $sans("Set")^"op"$ is the category of complete atomic boolean algebra, wtf). Fortunately, in our case, $cal(C)^"op"$ usually only appear in domain or codomain of functors.
]
#proposition[
  The following are equivalent:
  + $f: X -> Y$ is an isomorphism
  + for any $c in cal(C)$, the map $f compose - : "Hom"(c, X) -> "Hom"(c, Y)$ is a bijection. ($f compose -$ is also written as $f_*$)
  + for any $c in cal(C)$, the map $- compose f: "Hom"(Y, c) -> "Hom"(X, c)$ is a bijection. ($- compose f$ is also written as $f^*$)
]<prop:iso-repr>
#proof()[
  We first prove $(1) <=> (2)$, then use dual argument to get $(1) <=> (3)$.\
  $(1) => (2)$: Suppose $f: X -> Y$ is an isomorphism, with inverse $f^(-1): Y -> X$. \
  For any $c in cal(C)$, we want to find the inverse $g_*$ of the map $ f_* eq.def f compose - : "Hom"(c, X) -> "Hom"(c, Y) $
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
  The above result applied also to $cal(C)^"op"$. We then have\
  $f: X -> Y$ is iso $<=>$ $f^"op": Y -> X$ is iso $"iff"$ $[cal(C)^("op")(c, Y) <-> cal(C)^("op")(c, X)] <=> [cal(C)(X, c) <-> cal(C)(Y, c)]$.
]