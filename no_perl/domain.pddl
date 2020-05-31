(define (domain life-of-a-sailor)
   (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
   (:types
      forest river port pub town academy sea lighthouse island - location
      wood flower alcohol map perl cocaine ring - item
      collectibles gold npc boat - item
      dinghy frigate caravel - boat
      speck coin brick - gold
      bear mog - npc
      coconut bearskin - collectibles
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
         (is_hardened)
         (is_captain)

         (is_married)
         (is_admiral)
         (is_escobar)

         (has_fought_bear)
         (has_shady_connections)
         (has_good_connections)
         (has_criminal_record)
         (has_joined_pirates)
         (has_defeated_pirates)
         (has_smuggler_connections)
         (has_impressed_girl)

         (offers_fight ?l - location)
         (offers_sobering_up ?l - location)
         (offers_work ?l - location)
         (offers_trade ?l - location)
         (offers_bank ?l - location)
         (offers_community_service ?l - location)
         (offers_study ?l - location)
         (offers_pirates ?l - location)
         (offers_smugglers ?l - location)
         (offers_girl ?l - location)



    )
   ; Move around
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
   :parameters (?l1 - location ?l2 - location)
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

   (:action collect-perl
    :parameters (?l - location ?perl - perl)
    :precondition (and 
         (at ?l)
         (yields ?perl ?l)
        
    )
    :effect (and 
    (own ?perl)
    )
   )

   (:action collect-coconut
    :parameters (?l - location ?coco - coconut)
    :precondition (and 
         (at ?l)
         (yields ?coco ?l)
        
    )
    :effect (and 
    (own ?coco)
    )
   )

   (:action collect-cocaine
    :parameters (?l - location ?cocaine - cocaine ?map - map)
    :precondition (and 
         (at ?l)
         (yields ?cocaine ?l)
         (own ?map)
        
    )
    :effect (and 
      (own ?cocaine)
    )
   )

   ; Rob and steal
   (:action steal-dinghy
       :parameters (?l - location ?dinghy - dinghy)
       :precondition (and 
         (at ?l)
         (yields ?dinghy ?l)
       )
       :effect (and
         (own ?dinghy)
         (has_criminal_record)
       )
   )

   (:action rob-bank
       :parameters (?l - location ?coin - coin)
       :precondition (and 
         (at ?l)
         (offers_bank ?l)
       )
       :effect (and
         (own ?coin)
         (has_criminal_record)
       )
   )

   ; Earn gold
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

   (:action work
       :parameters (?l - location ?speck - speck)
       :precondition (and 
         (at ?l)
         (offers_work ?l)
       )
       :effect (and
         (own ?speck)
       )
   )

   (:action save-up
       :parameters (?l - location ?speck - speck ?coin - coin)
       :precondition (and 
         (at ?l)
         (offers_bank ?l)
         (own ?speck)
       )
       :effect (and
         (not (own ?speck))
         (own ?coin)
         (has_good_connections)
       )
   )   
   

   (:action invest
       :parameters (?l - location ?coin - coin ?brick - brick)
       :precondition (and 
         (at ?l)
         (offers_bank ?l)
         (own ?coin)
       )
       :effect (and
         (not (own ?coin))
         (own ?brick)
         (has_good_connections)
       )
   )   


   ; Trade
   (:action trade-collectibles-for-gold
       :parameters (?l - location ?col - collectibles ?coin - coin)
       :precondition (and 
         (at ?l)
         (offers_trade ?l)
         (own ?col)
       )
       :effect (and
         (own ?coin)
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
         (is_hardened)
       )
   )

   (:action trade-with-old-geezer
       :parameters (?l - location ?alcohol - alcohol ?map - map ?mog - mog)
       :precondition (and 
         (at ?l)
         (yields ?mog ?l)
         (own ?alcohol)
       )
       :effect (and
         (own ?map)
         (not (own ?alcohol))
         (has_shady_connections)
       )
   )

   (:action fight-in-pub
       :parameters (?l - location)
       :precondition (and 
       (at ?l)
       (offers_fight ?l)
       (is_tipsy)
       )
       :effect (and 
       (is_hardened)
       )
   )
   

   ; Buy things
   (:action buy-alcohol
       :parameters (?l - location ?speck - speck ?alcohol - alcohol)
       :precondition (and 
         (at ?l)
         (yields ?alcohol ?l)
         (own ?speck)
       )
       :effect (and 
         (not (own ?speck))
         (own ?alcohol)
       )
   )

   (:action drinks-on-me
       :parameters (?l - location ?coin - coin ?alcohol - alcohol)
       :precondition (and 
         (at ?l)
         (yields ?alcohol ?l)
         (own ?coin)
       )
       :effect (and 
         (not (own ?coin))
         (has_good_connections)
       )
   )
   
   ; Build ships
   (:action craft-dinghy
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

    (:action craft-caravel
    :parameters (?wood - wood ?coin - coin ?dinghy - dinghy ?caravel - caravel)
    :precondition (and 
        (own ?dinghy)
        (own ?wood)
        (own ?coin)
    )
    :effect (and 
        (not (own ?dinghy))
        (not (own ?wood))
        (not (own ?coin))
        (own ?caravel)
        (has_ship)
    )
   )

   ;Happy hour
   (:action get-tipsy
    :parameters (?alcohol - alcohol)
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
    :parameters (?alcohol - alcohol)
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
    :parameters (?alcohol - alcohol)
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

   (:action do-community-service
    :parameters (?l - location)
    :precondition (and 
        (is_sober)
        (at ?l)
        (offers_community_service ?l)
    )
    :effect (and 
        (is_tipsy)
        (not (has_criminal_record))
        )
   )

   ; Change status
   (:action undo-tipsy
       :parameters (?l - location)
       :precondition (and 
         (at ?l)
         (offers_sobering_up ?l)
         (is_tipsy)
       )
       :effect (and 
         (not (is_tipsy))
         (is_sober)
       )
   )

   (:action undo-drunk
       :parameters (?l - location)
       :precondition (and 
         (at ?l)
         (offers_sobering_up ?l)
         (is_drunk)
       )
       :effect (and 
         (not (is_drunk))
         (is_sober)
       )
   )

   (:action buy-indulgence
       :parameters (?l - location ?speck - speck)
       :precondition (and 
         (at ?l)
         (offers_bank ?l)
         (own ?speck)
         (has_criminal_record)
       )
       :effect (and 
         (not (own ?speck))
         (not (has_criminal_record))
       )
   )

   (:action become-captain
       :parameters (?l - location ?coin - coin)
       :precondition (and 
         (at ?l)
         (offers_study ?l)
         (own ?coin)
         (not (is_captain))
         (not (has_criminal_record))
       )
       :effect (and 
         (not (own ?coin))
         (is_captain)
       )
   )

   (:action get-to-know-smugglers
       :parameters (?l - location ?brick - brick)
       :precondition (and 
         (at ?l)
         (offers_smugglers ?l)
         (own ?brick)
         (has_shady_connections)
       )
       :effect (and 
         (has_smuggler_connections)
       )
   )
   
   ; Take to sea
   (:action try-fight-pirates
       :parameters (?l - location ?gs - speck ?gc - coin ?gb - brick
                  ?d - dinghy ?f - frigate ?c - caravel)
       :precondition (and 
         (at ?l)
         (offers_pirates ?l)
         (not (is_hardened))
       )
       :effect (and 
         (is_hardened)
         (not (own ?gs))
         (not (own ?gc))
         (not (own ?gb))
         (not (own ?f))
         (not (own ?c))
         (own ?d)
       )
   )

   (:action join-pirates
       :parameters (?l - location)
       :precondition (and 
         (at ?l)
         (offers_pirates ?l)
         (has_shady_connections)
       )
       :effect (and 
         (has_joined_pirates)
         (is_tipsy)
       )
   )
   
   (:action defeat-pirates
       :parameters (?l - location ?gs - speck ?gc - coin ?gb - brick
                  ?d - dinghy ?f - frigate ?c - caravel)
       :precondition (and 
         (at ?l)
         (offers_pirates ?l)
         (is_hardened)
         (own ?c)
       )
       :effect (and 
         (has_defeated_pirates)
         (own ?gs)
         (own ?gc)
         (own ?gb)
         (own ?d)
         (own ?f)
         (own ?c)
       )
   )

   ; Marriage
   (:action impress-girl
       :parameters (?l - location)
       :precondition (and 
         (at ?l)
         (offers_girl ?l)
         (or 
            (has_fought_bear)
            (has_defeated_pirates)
            (is_captain)
         )
       )
       :effect (and 
         (has_impressed_girl)
       )
   )

   (:action craft-ring
       :parameters (?brick - brick ?perl - perl ?ring - ring)
       :precondition (and
         (own ?brick)
         (own ?perl)
        )
       :effect (and 
         (own ?ring)
         (not (own ?brick))
         (not (own ?perl))
       )
   )

   (:action marry-girl
       :parameters (?l - location ?ring - ring ?flower - flower)
       :precondition (and 
         (at ?l)
         (offers_girl ?l)
         (own ?ring)
         (own ?flower)
         (has_impressed_girl)
         (has_good_connections)
         (not (has_criminal_record))
         (not (is_drunk))
         (not (is_alcoholic))
       )
       :effect (and 
         (not (own ?ring))
         (not (own ?flower))
         (is_married)
       )
   )

   ; Admiral
   (:action become-admiral
       :parameters (?l - location ?i - item)
       :precondition (and 
         (at ?l)
         (own ?i)
         (offers_study ?l)
         (is_captain)
         (has_defeated_pirates)
         (is_sober)
       )
       :effect (and 
       (is_admiral)
       )
   )

   ; Turn Pablo Escobar
   (:action become-escobar
       :parameters (?l - location ?cocaine - cocaine ?frigate - frigate ?brick - brick)
       :precondition (and 
         (own ?cocaine)
         (is_alcoholic)
         (own ?frigate)
         (has_smuggler_connections)
         (own ?brick)
       )
       :effect (and 
         (is_escobar)
       )
   )
   
   
   
   
   


   
   


   
)