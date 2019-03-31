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

Inventory

	var/content[]

	proc
		Find(item/item)
			if(!item || !content.len[item]) return 
			if(content[item]) 
				return TRUE
			else
				return FALSE
		Add(item/item)
			if(!item || !content.len[item]) return 
			content[item] = item
			
		Remove(item/item)
			if(!item || !content.len[item]) return 
			content[item] = null
		Replace(item/olditem, item/newitem)
			if(!olditem || !newitem || !content[olditem]) return
			src.Remove(olditem)
			src.Add(newitem)
		Recycle()
			var/tmp/temp[]
			for(var/item/item in content)
				temp[item] = content[item]
				content.Remove(item)
			for(var/item/item in temp)
				src.Add(item)
			
		Clear()
			var/empty[]
			content = empty