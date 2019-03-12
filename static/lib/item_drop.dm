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
			throw EXCEPTION("ERROR, wrong type definition: [src].[type]")
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

		get_name()
		get_type()
		get_equipment()
		get_resist(resist/r)




	/*Pickup mechanic*/
	proc
		pickup(mob/ref, item/t)
			if(!ismob(ref) && !istype(t, /item )) return err
				/*Drop effects*/
				src.loc = ref.loc
		drop()