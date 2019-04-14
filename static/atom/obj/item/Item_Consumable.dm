Item

	Consumable


		var/const/list/EFFECTS = ("feast", "flask", "potion")

		New(_effect)

			if(!EFFECTS.Find(_effect) || !wielder) return



		Use(mob/_player)

			wielder = _player
		/*
		for _player, give effect from list: effects
		*/




Item/Consumable/test_potion

	var/duration = 100

	New()
		..()
		//add a /Stat to the consumables stat_list
		stat_list_add(var/Stat/item_stat/strength("strenght", 10))
		//add all /Stat from stat_list to wielder
		itemStats_addTo(wielder)

	Del()
		itemStats_remoTo(wielder)