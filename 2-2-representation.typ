#import "import.typ":*

== Representation and Universality
#fancy.definition[
  A functor $F: calc -> Set$ is called representable if there exist an object $A in calc$ such that $ hom(A, -) natiso F $ For a contravariant functor $F: calc^op -> Set$, it is $ hom(-, X) natiso F $ We call such an object $A$ (or $X$) a representing object of $F$.
]
By Yoneda lemma, we know that such natural isomophism $alpha$ is corresponding to an element $u in F(A)$. We usually say $(A, u)$ is a *representation* of $F$.