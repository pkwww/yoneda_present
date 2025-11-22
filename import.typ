#import "@preview/ilm:1.4.1": *
#import "@preview/theorion:0.4.0": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.simple: definition
#import cosmos.clouds: theorem, lemma, corollary, proposition
#let rainbow = cosmos.rainbow
#let fancy = cosmos.fancy
#let simple = cosmos.simple
#let clouds = cosmos.clouds
#import "commutative-diagram.typ":*

#let calc = $cal(C)$
#let cald = $cal(D)$
#let hom = "Hom"
#let unlp(var) = $sans(bold(B)var)$ // unloop
#let Set = $sans("Set")$
#let grp = $sans("Grp")$
#let vectk = $sans("Vect"_k)$
#let op = "op"
#let psh = $Set^(calc^op)$

#let idea-box = tip-box.with(title: "Idea")
#let iso = symbol(sym.tilde.equiv)
// #let natiso = $limits(tilde.equiv)^("nat")$
#let natiso = $attach(iso, t: "nat")$
#let coprod = symbol(sym.product.co)
#let yo = symbol("よ")