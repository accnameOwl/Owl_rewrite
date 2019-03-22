item
	parent_type = /obj
	var
		itemLevel = 1
		
		//percentage, max = 100, destroyed = 0
		durability = 100

		//add attributes as stats in stat_list
		stat_list[]

	New(name = "", itemLevel)

	proc
		stat_list_add(name, value)
			stat_list.Add(new/item_stat(name, value))
		stat_list_remove(item_stat/is)
			stat_list.Remove(is)

		calculate_stat(item_stat/is)
			if(!is) return

			var/math = is.get_value() * src.itemLevel
			is.set_value(math)


