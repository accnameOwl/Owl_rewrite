mob/player

	var/Inventory/inventory = new()

	//inventory Functions
	proc 
		inventory_Find(mob/player/player, item/item)
			if(!player && !item) return FALSE
			var/Inventory/__inventory = player.inventory
			if(__inventory.Find(item))
				return TRUE
			return FALSE
		
		inventory_Add(mob/player/player, item/item)
			if(!player && !item) return FALSE
			var/Inventory/__inventory = player.inventory
			__inventory.Add(item)

		inventory_Remove(mob/player/player, item/item)
			if(!player && !item) return FALSE
			var/Inventory/__inventory = player.inventory
			if(__inventory.Find(item))
				__inventory.Remove(item)

		inventory_Replace(mob/player/player, item/olditem,item/newitem)
			if(!player || !olditem || !newitem) return FALSE
			var/Inventory/__inventory = player.inventory
			if(__inventory.Find(olditem))
				__inventory.Replace(olditem, newitem)

		inventory_Recycle(mob/player/player)
			if(!player) return
			var/Inventory/__inventory = player.inventory
			__inventory.Recycle()

		inventory_Clear(mob/player/player)
			if(!player) return
			var/Inventory/__inventory = player.inventory
			__inventory.Clear()
	
	
	//other
	proc
