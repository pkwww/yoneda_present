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
We prove the covariant version here. The contravariant version can be proved similarly. The naturality in $A$ (or $X$) and $F$ will not be proved here.

#proof[
  We will construct from both direction and show that they are inverse.

  $(=>)$: From a natural transformation $alpha: hom(A, -) => F$, we want an element in $F A$. Consider the component $alphaa: hom(A, A) -> F A$. Then $ u = alphaa(id_A) $ will serve the purpose.

  $(arrow.double.l)$: From an element $u in F A$, we want a natural transformation $alpha: hom(A, -) => F$. More precisely, ${alpha_X: hom(A,X) -> F X}_(X in calc)$.\ One way to do this is to stare at the type. With $u: F A$ (given), $f: A -> X$ in $alphax (f): F X$, (aka have $F A$, $A -> X$, we want $F X$), can see that this is just `fmap`. i.e. $alphax(f) = F f(u)$.\ The other way is:
  Because we want an inverse construction and naturality of $alpha$ should hold, these hint us to consider the following square for some generic $X, f: A -> X$
  #grid-diagram(
    columns: 2,
    align: top,
    nat-trans(
      node-padding: (110pt , 70pt),
      ($hom(A, A)$, $hom(A, X)$, $F A$, $F X$),
      ($hom(A, f) = f compose -$, $alphaa$, $alphax$, $F f$)
    ),
    nat-trans-el(
      ($id_A$, $f$, $u=alphaa id_A$, $alphax (f) =\ F f(u)$)
    )
  )
  The invertibility force $alphaa id_A = u$. \ The naturality force $ alphax (f) = F f(u) $
  It is simple to check these two conditions are coherent.\ It remains to show that the naturality of $alpha$ holds for generic $X, Y, f: X -> Y$:
  #grid-diagram(
    columns: 2,
    align: top,
    nat-trans(
      node-padding: (110pt , 70pt),
      ($hom(A, X)$, $hom(A, Y)$, $F X$, $F Y$),
      ($hom(A, f) = f compose -$, $alphax$, $alpha_(Y)$, $F f$)
    ),
    nat-trans-el(
      ($g$, $f compose g$, $F g(u)$, $F (f compose g)(u) =\ F f (F g(u))$)
    )
  )
  The bottom right equality holds because of the functoriality of $F$. Hence the naturality of $alpha$ holds.

  Finally, we show that these two constructions are inverse to each other.\ Given an $u in F A$, we have $alphaa id_A$ by previous construction. Conversely, given a natural transformation $alpha: hom(A, -) => F$, we construct $u = alphaa id_A$ first, reverse construction gives $alphax (f) = F f(u) = F f (alphaa id_A)$, by the first commutative diagram, this is true.

]

#idea-box[
  We can see that a natural transformation $alpha: hom(A, -) => F$ is completely determined by $u = alphaa id_A in F A$
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
    (Recall in the Yoneda construction, $alphax(f) = F f(u) =>$\ $alphax(f) = hom"("f: A -> X, Y)(g) = (- compose f)(g) = g compose f$)
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