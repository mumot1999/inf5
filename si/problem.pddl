(define (problem grzadka) (:domain ogrod)
(:objects 
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 - grzadka
    sadzonki - sadzonki
    konewka - konewka
)

(:init
    (wolna l1)
    (wolna l3)
    (wolna l4)
    (wolna l6)
    (wolna l8)
    (wolna l12)
    (ogrodnik l1)
    (znajduje_sie sadzonki l3)
    (znajduje_sie chwast l2)
    (znajduje_sie chwast l7)
    (znajduje_sie chwast l9)
    (znajduje_sie chwast l10)
    (znajduje_sie konewka l3)
    (znajduje_sie warzywo l5)
    (znajduje_sie warzywo l11)
)

(:goal (forall (?x - grzadka) (and
    (znajduje_sie warzywo ?x)
    (podlane ?x)
)))
)

