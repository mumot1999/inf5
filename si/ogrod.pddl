;Header and description

(define (domain ogrod)

;remove requirements that are not needed
(:requirements :adl)
(:types 
    obszar grzadka - obiekt
    konewka sadzonki - przedmiot
    przedmiot warzywo chwast - obszar
)

(:constants 
    chwast - chwast
    warzywo - warzywo
)

(:predicates
    (ogrodnik ?lokalizacja - grzadka)
    (trzyma ?co - przedmiot)
    (znajduje_sie ?co - obszar ?gdzie - grzadka)
    (wolna ?lokalizacja - grzadka)
    (podlane ?lokalizacja - grzadka)
)

;define actions here
(:action odlozyc
    :parameters (?co - przedmiot ?gdzie - grzadka)
    :precondition (and 
        (trzyma ?co)
        (ogrodnik ?gdzie)
    )
    :effect (and 
        (not (trzyma ?co))
        (znajduje_sie ?co ?gdzie)
    )
)
(:action wziac
    :parameters (?co - przedmiot ?gdzie - grzadka)
    :precondition (and 
        (not (exists (?x - przedmiot) (trzyma ?x)))
        (znajduje_sie ?co ?gdzie)
        (ogrodnik ?gdzie)
    )
    :effect (and 
        (not (znajduje_sie ?co ?gdzie))
        (trzyma ?co)
    )
)
(:action wyrywac
    :parameters (?gdzie - grzadka)
    :precondition (and 
        (not (exists (?x - przedmiot) (trzyma ?x)))
        (znajduje_sie chwast ?gdzie)
        (ogrodnik ?gdzie)
    )
    :effect (and 
        (not (znajduje_sie chwast ?gdzie))
        (wolna ?gdzie)
    )
)
(:action podlac
    :parameters (?gdzie - grzadka)
    :precondition (and 
        (trzyma konewka)
        (znajduje_sie warzywo ?gdzie)
        (not (podlane ?gdzie))
        (ogrodnik ?gdzie)
    )
    :effect (and (podlane ?gdzie))
)
(:action zasadzic
    :parameters (?gdzie - grzadka)
    :precondition (and 
        (wolna ?gdzie)
        (trzyma sadzonki)
        (ogrodnik ?gdzie)
    )
    :effect (and 
        (znajduje_sie warzywo ?gdzie)
        ; (not (wolna ?gdzie))
    )
)
(:action przejsc
    :parameters (?skad ?dokad - grzadka)
    :precondition (and 
        (ogrodnik ?skad)
        (or
            (and (trzyma konewka) (podlane ?skad)) 
            (and (trzyma sadzonki) (znajduje_sie warzywo ?skad))
            (not (exists (?x - przedmiot) (trzyma ?x)))
        )
    )
    :effect (and 
        (not (ogrodnik ?skad))
        (ogrodnik ?dokad)
    )
)
)