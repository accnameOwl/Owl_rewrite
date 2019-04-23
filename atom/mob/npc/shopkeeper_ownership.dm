var/shopkeeper_owners[]

mob/npc/shopkeeper
	var
		owner_key
	proc

		set_ownerkey(key)
			if(owner_key && shopkeeper_owners[owner_key])
				shopkeeper_owners[owner_key] -= src
				if(!length(shopkeeper_owners[owner_key]))
					shopkeeper_owners -= owner_key

			owner_key = key

			if(key)
				if(!shopkeeper_owners[key])
					shopkeeper_owners[key] = list()
				shopkeeper_owners[key] += src

	New()
		..()
		set_ownerkey(owner_key)

	onDel()
		set_ownerkey(null)

	postRead()
		set_ownerkey(owner_key)
