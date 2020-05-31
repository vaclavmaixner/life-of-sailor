(define (domain life-of-a-sailor)
   (:requirements :strips :typing :negative-preconditions)
   (:types
      forest river port pub town academy sea lighthouse island - location
      wood flower alcohol bearskin gold npc - item
      dinghy frigate caravel - item
      sober tipsy drunk alcoholic - status
      speck coin brick - gold
      bear - npc
   )

   (:predicates
         (path ?l1 - location ?l2 - location)
         (sea-route ?l1 - location ?l2 - location)
         (at ?l - location)
         (own ?i - item) 

         (yields ?i - item ?l - location)

         (has_ship)
         
         
         (is_sober)
         (is_tipsy)
         (is_drunk)
         (is_alcoholic)

         (has_fought_bear)
    )
   ; Actions
    (:action move
        :parameters (?l1 - location ?l2 - location)
        :precondition (and 
        (at ?l1)
        (path ?l1 ?l2)

        )
        
        :effect (and 
        (at ?l2)
        (not (at ?l1))
        )
    )

   (:action sail
   :parameters (?l1 - location ?l2 - location ?dinghy - dinghy)
   :precondition (and 
      (at ?l1)
      (sea-route ?l1 ?l2)
      (has_ship)
   )
   :effect (and 
      (at ?l2)
      (not (at ?l1))
      )
   )

   ; Collect items
   (:action collect-wood
    :parameters (?l - location ?w - wood)
    :precondition (and 
         (at ?l)
         (yields ?w ?l)
        
    )
    :effect (and 
    (own ?w)
    )
   )

   (:action collect-flower
    :parameters (?l - location ?f - flower)
    :precondition (and 
         (at ?l)
         (yields ?f ?l)
        
    )
    :effect (and 
    (own ?f)
    )
   )

   (:action pan-for-gold
       :parameters (?l - location ?speck - speck)
       :precondition (and 
         (at ?l)
         (yields ?speck ?l)
       )
       :effect (and
         (own ?speck)
       )
   )

   ; Interact with NPCs
   (:action fight-bear
       :parameters (?l - location ?bear - bear ?bearskin - bearskin)
       :precondition (and 
         (at ?l)
         (yields ?bear ?l)
       )
       :effect (and
         (own ?bearskin)
         (not (yields ?bear ?l))
         (has_fought_bear)
       )
   )
   
   

   ; Build ships
   (:action craft-boat
    :parameters (?w - wood ?d - dinghy)
    :precondition (and 
        (own ?w)
    )
    :effect (and 
        (not (own ?w))
        (own ?d)
        (has_ship)
    )
   )

    (:action craft-frigate
    :parameters (?w - wood ?s - speck ?d - dinghy ?f - frigate)
    :precondition (and 
        (own ?d)
        (own ?w)
        (own ?s)
    )
    :effect (and 
        (not (own ?d))
        (not (own ?w))
        (not (own ?s))
        (own ?f)
        (has_ship)
    )
   )

   ;Happy hour
   (:action get-tipsy
    :parameters (?alcohol - item)
    :precondition (and 
        (is_sober)
        (own ?alcohol)
    )
    :effect (and 
        (not (own ?alcohol))
        (not (is_sober))
        (is_tipsy)
        )
   )
   (:action get-drunk
    :parameters (?alcohol - item)
    :precondition (and 
        (is_tipsy)
        (own ?alcohol)
    )
    :effect (and 
        (not (own ?alcohol))
        (not (is_tipsy))
        (is_drunk)
        )
   )
   (:action get-alcoholic
    :parameters (?alcohol - item)
    :precondition (and 
        (is_drunk)
        (own ?alcohol)
    )
    :effect (and 
        (not (own ?alcohol))
        (not (is_drunk))
        (is_alcoholic)
        )
   )
    
)