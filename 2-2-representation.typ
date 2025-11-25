#import "import.typ":*

== Representation and Universality
=== Representable functor
#fancy.definition[
  A functor $F: calc -> Set$ is called representable if there exist an object $A in calc$ such that $ hom(A, -) natiso F $ For a contravariant functor $F: calc^op -> Set$, it is $ hom(-, X) natiso F $ We call such an object $A$ (or $X$) a representing object of $F$.
]

#note-box[
  By Yoneda lemma, we know that such natural isomophism $alpha$ is corresponding to an element $u in F(A)$. We usually say $(A, u)$ is a *representation* of $F$.
]

Recall #restate-prefix(<thm:iso-repr-nat>) that $f: X -> Y$ is an isomorphism iff $hom(-, X) natiso hom(-, Y)$. We can now prove this by Yoneda lemma.

#proof[
  $(=>)$: Since $yo$ is a functor and will preserive isomophism (#restate-prefix(<prop:functor-preserves-iso>)).

  $(arrow.double.l)$: Let $alpha, alpha^(-1)$ be the natural isomorphism pair. Because $yo$ is full, they must come from some morphism $f, g$ respectively. Then $yo(id_calc) = id_(psh) = alpha compose alpha^(-1) = yo(f) compose yo(g) = yo(f compose g)$. Since $yo$ is faithful, we have $id_calc = f compose g$, showing the isomorphism in objects.

]

Restate the only if part of the above theorem in terms of representability:
#corollary()[
  If two representable functors are naturally isomorphic, then their representing objects are isomorphic.
  In particular, if $A, B$ represent the same functor, then $A iso B$, i.e. the representing object is unique up to isomorphism.
]

#example[
  Identity functor $Set -> Set$ is represented by the singleton set.
]

#example[
  The forgetful functor $U: grp -> Set$ is represented by ($ZZ, 1$).
  $U: vectk -> Set$ is represented by ($k, 1$).
]

#example[
  The power set functor $P: Set^op -> Set$ is represented by ($Omega = {sans(F), sans(T)}, {sans(T)}$).
]

#example[
  $hom(- times B, C): calc^op -> Set$ is represented by ($C^B, "ev"$), where $"ev": C^B times B -> C$ is the evaluation map.
]

=== Representation is universality
Recall #restate-prefix(<def:product>) the definition of product. Given two objects $X, Y$, an object $(P, (pi_1: P -> X, pi_2: P -> Y))$ is product if for every $(Z, (f_1: Z -> X, f_2: Z -> Y))$ there #underline[exist a unique] $f: Z -> P$ such that $pi(f) eq.def (pi_1 compose f, pi_2 compose f) = (f_1, f_2)$. This gives a bijection between the set ${f: Z -> P}$ and the set ${(f_1: Z -> X, f_2: Z -> Y)}$. i.e.
$ hom(Z, P) iso hom(Z, X) times hom(Z, Y) $
by letting the contravariant functor $F eq.def hom(-, X) times hom(-, Y)$,
$ hom(Z, P) iso F(Z) $
Moreover, this isomophism is natural in $Z$, i.e. given a $g: Q -> Z$ the following square commutes:
#align(center)[
  #nat-trans(
    ($hom(Z, P)$, $hom(Q, P)$, $F(Z)$, $F(Q)$),
    ($- compose g$, $(pi_1 compose -, pi_2 compose -)$, $(pi_1 compose -, pi_2 compose -)$, $(- compose g, - compose g)$)
  )
]
We can certainly check this square commutes. But we can also noticed that $F(g)(u) = (- compose g, - compose g)(pi_1, pi_2) = (pi_1 compose g, pi_2 compose g)$, which shows that our bijection is exactly the same as the yoneda one. Hence by the proof of yoneda lemma, this is a natural transformation.

Hence, the functor $F$ is naturally isomophic to $hom(-, P)$, i.e. $F$ is representable by $(P, (pi_1, pi_2))$.

#tip-box(title: "Observation")[
  + The universality of product is encoded in the representation of $F eq.def hom(-, X) times hom(-, Y)$.
  + The represention, aka the natural isomophism is given by: for every $(Z, (f_1, f_2) in F Z)$ #underline[exists a unique] $f: Z -> P$ such that $(f_1, f_2) = (pi_1 compose f, pi_2 compose f) = F f(u)$, where $u = (pi_1, pi_2) in F P$.
]

#fancy.definition(title: "Universal element")[
  A *universal element* for a functor $F: calc -> Set$ is a pair $(U, u)$ where $U in calc$ and $u in F(U)$ such that for every $(X, x)$ with $X in calc$ and $x in F(X)$, there #underline[exists a unique] morphism $f: U -> X$ such that $F f (u) = x$.

  Dually, for a contravariant functor $F: calc^op -> Set$, a *universal element* is a pair $(U, u)$ for all $(X, x)$, #underline[exist a unique] $f: X -> U$ such that $F f (u) = x$.
]

#theorem(title: "Representation iff Universality")[

  Let $(U, u)$ be a pair with $U in calc$ and $u in F(U)$. Let $alpha$ be the natural transformation induced by $u$ as in Yoneda lemma. Then,
  $ hom(U, -) attach(iso, t: alpha) F <=> (U, u) "is a universal element." $
]
#proof[
  $hom(U, X) attach(iso, t: alphax) F X$ #h(0.5em) _iff_ #h(0.5em) $forall x in F X, exists! f: U -> X$ such that $alphax(f) attach(=, t: yo) F f (u) = x$, which is exactly the definition of universal element.
]

