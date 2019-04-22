mob/npc
	var/mob/target
	var/ai/AI

	New()
		..()

	/*combat*/
	var/npc_invincible = FALSE

	COMBAT_ON_DEATH()
		if(npc_invincible) return
		if(length(dropContents))
			for(var/Item/item in dropContents)
				item.Drop(loc)
			dropContents = null
		..()


	//@info LOOT FUNCTIONS
	var/dropContents[]

	proc
		Clear_dropContents()
			if(!length(LootList)) return null
			loot_array = null

		//return TRUE if any items exists in droplist
		Check_dropContents()
			if(length(LootDropList)) 
				return TRUE
