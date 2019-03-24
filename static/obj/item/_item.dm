item
	parent_type = /obj
	var
		itemLevel = 1
		
		//percentage, max = 100, destroyed = 0
		durability = 100

		//0 = null, 1 = head, 2 = chest, 3 = legs, 4 weapon
		item_slot = 0 

		//wielder
		mob/wielder

		//add attributes as stats in stat_l__statt
		stat_list[]

	New(name, itemLevel)
		if(!name && !itemLevel) return ..()
		src.name = name
		src.itemLevel = itemLevel
	proc
		stat_list_add()
			for(var/item_stat/__is in args)
				calculate_stat(__is)
				stat_list.Add(__is)

		stat_list_remove(item_stat/__stat)
			stat_list.Remove(__stat)

		calculate_stat(item_stat/__stat)
			if(!__stat) return

			var/math = __stat.get_value() * (src.itemLevel/100)
			__stat.set_value(round(math))

		itemStats_addTo(mob/m)
			//cycle through all stats for item
			for(var/item_stat/__is in stat_list)
				//if stat found is unliable with wielders stats, throw exception and cancle function
				if(!m.COMBAT_STATS.Find(__is.name)) 
					throw EXCEPTION("Could not find item_stat in mobs statlist")
				//Give wielder stats corresponding to it's stat
			//	__is.stats_add_value(m, __is.name, __is.get_value())
		itemStats_remTo(mob/m)
			for(var/item_stat/__is in stat_list)
				if(!m.COMBAT_STATS.Find(m.stats_get_name(m,__is.name))) throw EXCEPTION("Could not find item_stat in mobs statlist")
				else	m.stats_subtract_value(m, __is.name, __is.get_value())

		//Function for equipping said item to wielder
		//arg should always be wielder
		Equip(mob/m)
			if(!m) return
			switch(item_slot)
				if(1)
					m.Equipment_headslot = src
					itemStats_addTo(wielder)
				if(2)
					m.Equipment_chestslot = src
					itemStats_addTo(wielder)
				if(3)
					m.Equipment_legslot = src
					itemStats_addTo(wielder)
				if(4)
					m.Equipment_weaponslot = src
					itemStats_addTo(wielder)

		Unequip(mob/m)
			if(!m) return
			switch(item_slot)
				if(1)
					m.Equipment_headslot = null
					itemStats_remTo(wielder)
				if(2)
					m.Equipment_chestslot = null
					itemStats_remTo(wielder)
				if(3)
					m.Equipment_legslot = null
					itemStats_remTo(wielder)
				if(4)
					m.Equipment_weaponslot = null
					itemStats_remTo(wielder)
		Drop(mob/ref)
			loc = ref
