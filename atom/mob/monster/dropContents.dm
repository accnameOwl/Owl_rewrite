mob/monster
	/*combat*/
	var/npc_invincible = FALSE

	combat_on_death()
		if(npc_invincible) return
		if(length(dropContents))
			for(var/Item/item in dropContents)
				item.Drop(loc)
			Clear_dropContents()
		..()


	//@info LOOT FUNCTIONS
	var/dropContents[]

	proc
		Clear_dropContents()
			if(!length(dropContents)) return null
			dropContents = null

		//return TRUE if any items exists in droplist
		Check_dropContents()
			if(length(dropContents))
				return TRUE
