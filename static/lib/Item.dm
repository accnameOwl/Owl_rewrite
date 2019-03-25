item
	parent_type = /obj

	var
		equipment = ""
		rarity = ""

		//1 = bad, 2 = moderate, 3 = good
		list/EQUIPMENT_RARITY = list(1,2,3)
		list/EQUIPMENT_PIECES = list("head", "chest", "legs", "shield", "sword",)

		resist/resist = new()

	New(name, rarity, equipment)
		src.name = name

		if(!EQUIPMENT_RARITY.Find(rarity) )
			throw EXCEPTION("ERROR, wrong type definition: [src].[type], expecting value: 1, 2 or 3")
		else
			src.rarity = rarity

		if(!EQUIPMENT_PIECES.Find(equipment))
			throw EXCEPTION("ERROR, wrong equipment definition: [src].[equipment]")
		else
			src.equipment = equipment

	proc

		set_name(val)
			name = val

		set_rarity(val)
			if(!EQUIPMENT_RARITY.Find(val))
				throw EXCEPTION("ERROR, wrong type definition: [src].[type]")
			else
				rarity = val

		set_equipment()
		set_resist(resist/r)

		get_name() 	return name
		get_rarity()	return rarity 
		get_equipment() return equipment
		get_resist()	return resist




	/*Pickup mechanic*/
	proc
		pickup(mob/ref, item/t)
			if(!ismob(ref) && !istype(t, /item )) return FALSE
				/*Drop effects*/
				src.loc = ref.loc
		drop()
			drop_effect()


	// Drop movement
	proc
		drop_effect()
			/*Drop in random directions.
			when items drop, they get spawned in a random directions. */

			var
				_y	= src.y
				speed = 2
			for(_y = 0, _y <= 4, _y++)
				src.y += y
				sleep(speed)
			for(_y = 4, _y >= 0, _y--)
				src.y -=y
				sleep(speed)