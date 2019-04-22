# Owl_rewrite

 ### Future plans

 - Immersive UI
 - Guild & Party
 - Questing
 - Smartz AI
 - Open world map
 - Immersive Combat System
   - Class related rotation
   - Class skill trees
   - Sphere grid

### What has been done so far

I have been working hard to learn as much as i can. I am by no means any good programmer so this has been a journey of experiences. I started a year a go with this project, and it was a casual learning project. It gradually evolved and i started to see so many aspects where i could improve the code. So i took my time to rewrite the project concept.


### combat calculation and resistance:

Resistance has been added, but with a few changs:
resistance value now holds true percentage mitigation towards damage.
> mitigation = damage * (resist/100)

*static/atom/mob/combat.dm*

### /mob/monster/ai

Originally written by Ter13. Temporarly doesn't have a specific use in terms of attacking but chasing is working fine. AI was rewritten from being it's own datum saved as an AI type to any mob, instead of being polymorphic to a certain mob child type. This seemed to be a bad approach, as polymorphic code is innherited to every type instead of being a case to case demand for specific mob's.


### Stats: player, npc and monster

type: /Stat
/mob/player, /mob/monster & /mob/npc all share a list called: combat_stats[].

example:
player.combat_stats["health" = var/Stat("health", 100)]

and mob has getters and setters for everything related to type /Stat.
found in /static/atom/mob/stats.dm


### /mob/npc/shopkeeper

Now holds different characteristics, sutch as being able to being owned by players. 
This will hold later significance as to having certain perks to certain shop keepers.

Shopkeepers holds a /inventory/shopContents, selling a certain amount of items, *restocking over said duration.(not added yet)*


### /mob/monster 

Inventory/dropContent holds information of which items that drops from said monster when it dies.
parent proc declaration is already in place, as to drops being automated on monsters death.

It's contents are added on specific subtypes that are spawned as monsters in the world.
example: */mob/monster/simpleMonster* 
It's dropContent can then be given new items on simpleMonster.New() 


