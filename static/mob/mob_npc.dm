mob/npc

	New(name = "")
		src.name = name

	/*combat*/
	var/npc_invincible = FALSE

	death()
		if(npc_invincible) return
		if(npc_loot.len)
			for(var/i = 0, i <= npc_loot.len, i++)
				var/obj/o = npc_loot[i]
				o.Drop(src) 

	respawn() ..()
	damage() ..()
	health_regen() ..()

	/*loot*/
	var/list/npc_loot[0] 