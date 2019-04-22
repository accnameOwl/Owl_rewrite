
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