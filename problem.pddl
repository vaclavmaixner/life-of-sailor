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
      bearskin - bearskin

      dinghy - dinghy
      frigate - frigate
      caravel - caravel

      speck - speck
      coin - coin
      brick - brick

      bear - bear




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

      (yields speck river)

      (at port)
      (is_sober)
   )

   (:goal (and
      (at lighthouse)
      (own speck)
      (own wood)
      (own frigate)
      (has_fought_bear)
    ))
)