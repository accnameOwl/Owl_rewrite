mob/npc

	New(name = "")
		src.name = name

	/*combat*/
	var/npc_invincible = FALSE

	COMBAT_ON_DEATH()
		if(npc_invincible) return
		if(loot_array.len)
			for(var/i = 0, i <= loot_array.len, i++)
				var/item/o = loot_array[i]
				o.Drop(src)
			loot_array = null
		..()


	//@info LOOT FUNCTIONS
	var/list/loot_array = list()

	//clear droplist
	proc
		drop_array_clear()
			if(!loot_array.len) return null
			loot_array = null

		//return TRUE if any items exists in droplist
		drop_array_check()
			if(loot_array.len) return TRUE

		//return params of npc_droplist
		drop_array_list2params()
			return list2params(loot_array)



