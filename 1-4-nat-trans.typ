#import "import.typ":*

== Natural Transformation
=== Motivation
Let $V$ be a finite dimensional vector space with field $k$. The dual space $V^* = hom(V, k)$ is the set of linear functionals from $V -> k$.

Given a basis ${e_i}$ in V, we can construct a dual basis ${e^*_i}$ in $V^*$ defined by 
$e^*_i(e_j) = cases(
  1 "if" i = j,
  0 "if" i != j,
)$ \
Also, given a linear map $f: V -> W$, define the dual map $f^*: W^* -> V^*$ by $f^*(phi) = phi compose f$. Thus we defined a contravariant functor $(-)^*: vectk^op -> vectk$. Note that $V iso V^*$.\
Furthermore, we can construct $V^(**)$ so that $V iso V^* iso V^(**)$.

However, there is a more direct way to construct a map from $V$ to $V^(**)$ without choosing a basis. For each $v in V$, define 
$ (-)^(**): V &-> (V -> k) -> k \
v &mapsto "eval"_v $
where $"eval"_(v)(phi) = phi(v)$. This $(-)^(**)$ directly defines an isomorphism between $V$ and $V^(**)$ and it does not depend on the choice of basis.

To formalise this, consider the following diagram:
#align(center)[
  #grid-diagram(
    columns: 2,
    align: top,
    nat-trans(
      ($V$, $W$, $V^(**)$, $W^(**)$),
      ($f$, $(-)^(**)$, $(-)^(**)$, $f^(**)$),
    ),
    nat-trans-el(
      ($v$, $f v$, $"eval"_v$, $"eval"_(f v) \ "eval"_v compose f^*$),
    )
  )
]
For the bottom right, \
$("eval"_v compose f^*)(phi) = "eval"_(v)(f^*(phi)) = "eval"_(v)(phi compose f) = (phi compose f)(v) = phi(f(v)) = "eval"_(f v)(phi)$. This shows that the diagram commutes.
#fancy.definition(title: "Natural transformation")[
  Let $F, G: calc -> cal(D)$ be two functors. A natural transformation $eta: F => G$ consists of, for every object $c in calc$, a morphism $eta_c: F(c) -> G(c)$ in $cal(D)$, such that the following diagram commutes with any $f: X -> Y$:
  #align(center)[
    #nat-trans(
      ($F(X)$, $F(Y)$, $G(X)$, $G(Y)$),
      ($F(f)$, $eta_X$, $eta_Y$, $G(f)$),
    )
  ]
  i.e. $G(f) compose eta_X = eta_Y compose F(f)$

  If all $eta_c$ are isomorphisms, then $eta$ is called a natural isomorphism.
]
A natural transformation $eta$ is a collection of morphisms ${eta_c}_(c in calc)$ in $cal(D)$ indexed by objects in $calc$.
#note-box()[
  Terminology: Sometimes we say "the morphisms are natural", leaving implicit for the source and target functors and categories.
]

#example(title: "Question")[
  What are the functors in the above vector space example?
]

#example[
  Let $G, H$ be group and $unlp(G), unlp(H)$ be the corresponding one-object categories. Recall that a functor $F: unlp(G) -> unlp(H)$ is just a homomorphism. What are the natural transformations between two such functors $F, E$? \
  Since there is only one object $star$ in $unlp(G)$, a natural transformation $eta: F => E$ consists of a single morphism $eta_star: F(star) -> E(star)$ in $unlp(H)$, denote as $h$. Consider the following naturality square:
  #align(center)[
    #nat-trans(
      ($star$, $star$, $star$, $star$),
      ($F g$, $h$, $h$, $E g$),
    )
  ]
  i.e. $h compose F g = E g compose h <=> h compose F g compose h^(-1) = E g$. This means that $h$ conjugates the image of $F$ to the image of $E$.
]

#example[
  The open set functor $O(-)$ and the close set functor $C(-)$ are naturally isomorphic.
  #align(center)[
    #grid-diagram(
      columns: 2,
      align: top,
      nat-trans(
        ($O Y$, $O X$, $C X$, $C Y$),
        ($O f$, $(-)^c$, $(-)^c$, $C f$),
      ),
      nat-trans-el(
        ($U$, $f^(-1) U$, $U^c$, $(f^(-1)U)^c \ f^(-1)(U^c)$),
      )
    )
  ]
  The bottom right equality holds by simple set theoretic arguments. Thus commute the square. \
  Thus, the complement operation $(-)^c$ defines a natural isomorphism.
]

#example[
  Let $"GL"_n: sans("CRing") -> grp$ sending a commutative ring $R$ to its group of invertible $n times n$ matrices over $R$. Let $(-)^times$ sending $R$ to its multiplicative group of units (i.e. multiplicative invertible elements). Taking determinant of a matrix is a natural transformation $det: "GL"_n => (-)^times$. \
  Exercise: verify the naturality condition.
]

#example[
  (Hom functors). Given $f: A -> B, h: X -> Y$, consider the following square:
  #align(center)[
    #nat-trans(
      ($hom(B, X)$, $hom(B, Y)$, $hom(A, X)$, $hom(A, Y)$),
      ($hom(B, h) = h compose -$, $hom(f, X) = - compose f$, $- compose f = hom(f, Y)$, $hom(A, h) = h compose -$),
      node-padding: (140pt, 80pt),
    )
  ]
  if $g: B -> X$, we have $(h compose g) compose f = h compose (g compose f)$ by associativity. Hence the square commutes. Thus,
  + $- compose f$ is a natural transformation $hom(B, -) => hom(A, -)$
  + $h compose -$ is a natural transformation $hom(-, X) => hom(-, Y)$
  Recall #restate-prefix(<thm:iso-repr>). This result can be strengthened from "$hom(c, X) -> hom(c, Y)$ is a bijection" to "$hom(-, X) iso hom(-, Y)$ a *natural isomorphism*".
]
#theorem(title: "Isomorphism is representable, naturally")[
  The following are equivalent:
  + $f: X -> Y$ is an isomorphism
  + $hom(-, X) natiso hom(-, Y)$
  + $hom(Y, -) natiso hom(X, -)$
]<thm:iso-repr-nat>

#fancy.definition(title: "Functor category")[
  Given two categories $calc$ and $cal(D)$, the functor category $[calc, cal(D)]$ consists of
  + objects: functors $F: calc -> cal(D)$
  + morphisms: natural transformations between functors
  + identity morphism: $id_F = {id_(F X)}_(X in calc)$
  + composition is given by component-wise composition of natural transformations. To show that this acctually yields a natural transformation, we need to check if the outer rectangle of the following diagram commutes (exercise):
  #align(center)[
    #commutative-diagram(
      node-padding: (50pt, 50pt),
      node((0, 0), $F(X)$),
      node((0, 1), $F(Y)$),
      node((1, 0), $G(X)$),
      node((1, 1), $G(Y)$),
      node((2, 0), $H(X)$),
      node((2, 1), $H(Y)$),
      arr((0, 0), (0, 1), $F(f)$),
      arr((0, 0), (1, 0), $alpha_X$, label-pos: right),
      arr((0, 1), (1, 1), $alpha_Y$),
      arr((1, 0), (1, 1), $G(f)$, label-pos: right),
      arr((1, 0), (2, 0), $beta_X$, label-pos: right),
      arr((1, 1), (2, 1), $beta_Y$),
      arr((2, 0), (2, 1), $H(f)$, label-pos: right),
    )
  ]
  Identity and associativity follows from the component-wise definition. 
]