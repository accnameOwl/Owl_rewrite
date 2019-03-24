mob/player

	var/inventory[]

	//inventory Functions
	proc 
		inventory_Find(mob/player/player, item/item)
			if(player.inventory[item])
				return TRUE
			return FALSE
		
		inventory_Add(mob/player/player, item/item)
			if(!player && !item) return FALSE
			player.inventory[item] = item

		inventory_Remove(mob/player/player, item/item)
			if(!player && !item) return FALSE
			if(player.inventory[item])
				player.inventory[item] = null

		inventory_Replace(mob/player/player, item/olditem,item/newitem)
			if(!player || !olditem || !newitem) return FALSE
			var/mob/player/p
			if(p.inventory_Find(player, olditem))
				p:inventory_Remove(player, olditem)
				p:inventory_Add(player, newitem)

		inventory_Recycle(mob/player/player)
			var/temp[]
			var/mob/player/p
			for(var/item/i in player.inventory)
				temp[i] = player.inventory[i]
				p:inventory_Remove(player, i)
			p:inventory_Clear(player)
			for(var/item/i in temp)
				p:inventory_Add(player, i)

		inventory_Clear(mob/player/player)
			player.inventory.Clear()
	
	
	//other
	proc

