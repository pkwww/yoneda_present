#import "import.typ":*

== Yoneda (米田) Lemma
#theorem(title: "Yoneda Lemma")[
  Let $F$ be a set valued functor $calc -> Set$. Then for any object $A in calc$, there is a bijection of the following sets
  $ "nat"(hom(A, -), F) iso F(A) $
  i.e. the natural transformations $hom(A, -) => F$ is in 1-1 correspondence with the elements in $F(A)$.\
  Moreover, this bijection is natural in both $A$ and $F$.
  
  The contravariant version also holds for $F: calc^op -> Set$:
  $ "nat"(hom(-, X), F) iso F(X) $
  Again, this bijection is natural in both $X$ and $F$.
]<thm:yoneda>
#proof[
  //TODO
  #highlight("TODO")
]

#idea-box[
  We can see that for an natural transformation $alpha: hom(A, -) => F$ is completely determine by $u = alpha_(A)id_A in F A$
]

#corollary(number: none)[
Applying $F$ with another $hom$ functor, we have the following important special cases. Here we intentionally state the contravariant version first.
  $ "nat"(hom(-, X), hom(-, Y)) iso hom(X, Y) $
  More explicitly,
  $ hom_([calc^op -> Set])(h^X, h^Y) iso hom_(calc)(X, Y) $
  The covariant version yields
  $ hom_([calc -> Set])(h_A, h_B) iso hom_(calc)(B, A) $
]
#fancy.definition(title: "Yoneda embedding")[
  The functor $yo: calc -> [calc^op -> Set]$ (or $calc -> psh$) is defined as:
  + $yo(X) = hom_(calc)(-, X)$
  + For any morphism $g: X -> Y$ in $calc$, the natural transformation \ #[
    #set text(size: 9pt)
    (Recall in the Yoneda construction, $alpha_(X)(f) = F f(u) =>$\ $alpha_(X)(f) = hom"("f: A -> X, Y)(g) = (- compose f)(g) = g compose f$)
  ]
  $ yo(g)&: hom_(calc)(-, X) => hom_(calc)(-, Y) \
    yo(g) &= g compose - $
  
  The covariant version $calc^op -> [calc -> Set]$ is defined similarly.
]
#definition[
  Let $F: calc -> cald$. for every $X, Y in calc$, we called F
  + *full*, if $hom(X, Y) -> hom(F X, F Y)$ is surjective
  + *faithful*, if $hom(X, Y) -> hom(F X, F Y)$ is injective
  + *fully faithful*, if it is both full and faithful, i.e. bijective
]
#corollary(number: none)[
  $yo: calc -> psh$ is a fully faithful functor.
]
#note-box[
  A contravariant set valued functor $F: calc^op -> Set$ is often called a *presheaf* on $calc$ and the functor category is called the category of presheaves on $calc$. The Yoneda embedding can be restated as:\
  _Every category $calc$ can be fully faithfully embedded into the category of presheaves on $calc$._\
]
#note-box[
  The theorem and the two corollaries are often collectively referred to as the Yoneda Lemma.
]
#idea-box[
  The yoneda embedding $yo: calc -> psh$ allows us to view any object $X$ as $h^X$ keeping all the morphisms intact. Thus we can study the properties of objects in $calc$ by studying the properties of the corresponding $hom$ functors in the functor category $psh$. This is often very useful since functor categories often have better properties (e.g. completeness, cocompleteness) than the original category.
]
// TODO: the generalized element point of view