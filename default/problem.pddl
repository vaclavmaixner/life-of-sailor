(define (problem inst)
   (:domain life-of-a-sailor)
    (:requirements :strips :typing :negative-preconditions)
   (:objects
      forest - forest
      river - river
      port - port
      pub - pub
      town - town
      academy - academy

      sea - sea
      lighthouse - lighthouse
      island - island

      wood - wood
      flower - flower
      alcohol - alcohol
      perl - perl
      ring - ring
      coconut - coconut
      cocaine - cocaine

      bearskin - bearskin
      map - map

      dinghy - dinghy
      frigate - frigate
      caravel - caravel

      speck - speck
      coin - coin
      brick - brick

      bear - bear
      mog - mog ; magical old geezer




   )
   (:init
      (path forest river) (path river forest)
      (path river port)   (path port river)
      (path port pub)     (path pub port)
      (path port town)    (path town port)
      (path town academy) (path academy town)
      
      (sea-route port sea)        (sea-route sea port)
      (sea-route port lighthouse) (sea-route lighthouse port)
      (sea-route sea island)      (sea-route island sea)
      (sea-route sea lighthouse)  (sea-route lighthouse sea)

      (yields wood forest)
      (yields flower forest)
      (yields bear forest)
      (yields mog forest)
      (yields alcohol pub)
      (yields dinghy river)
      (yields speck river)
      (yields perl sea)
      (yields coconut island)
      (yields wood island)
      (yields cocaine island)

      (offers_fight pub)
      (offers_sobering_up river)
      (offers_sobering_up sea)
      (offers_work port)
      (offers_bank town)
      (offers_community_service town)
      (offers_study academy)
      (offers_pirates sea)
      (offers_smugglers port)
      (offers_girl lighthouse)

      (at port)
      (is_sober)
   )

   (:goal (and
      (is_married)
      ; (is_admiral)
      ; (is_escobar)
    ))
)