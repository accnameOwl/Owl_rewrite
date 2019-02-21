world

	mob = /mob/player


mob

	player

		/*pixel movement*/
		bound_x = 4
		bound_y = 2
		bound_width = 14
		bound_height = 12

		//icon	= ''

		see_invisible = 0
mob
	/*stats*/
	var
		attribute/level = new/attribute("level", 1, 1, 100, 1, 1.4)
		attribute/health = new/attribute("health", 20, 1, 100, 1.2, 1.4)
		attribute/stamina = new/attribute("stamina",10, 1, 100, 1.2, 1.4)
		attribute/regen = new/attribute("regen", 1, 1, 100, 1.2, 1.4)
		attribute/strength = new/attribute("strength", 1, 1, 100, 1.2, 1.4)


