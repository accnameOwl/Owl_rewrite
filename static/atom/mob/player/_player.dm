


mob

	Login()
		src.loc = locate(1,1,1)
		combat_stats = list(\
			var/Stat/health = New("health",10),
			var/Stat/regen = New("regen", 1),
			var/Stat/mana = New("mana", 3),

			var/Stat/strength = New("strength", 1),
			var/Stat/intellect = New("intellect", 1),
			var/Stat/agility = New("agility", 1),
		)
		src << list2params(combat_stats)
		..()

	player

		see_invisible = 0

		//Icon
		icon = 'mob.dmi'
		icon_state = "placeholder"
		//Pixel Movement: Bounderies
		bound_x = 4
		bound_y = 4
		bound_height = 24
		bound_width = 24


mob/player
	combat_on_death()
		//Able to see invisible shit
		if(src.combat_dead_seeInvisible == TRUE)
			/* Death sight*/
			var/obj/sight/s = new()
			//s.Blend(rgb(10,10,10, 100))
			s.layer = 7
			s.screen_loc = "SOUTHWEST to NORTHEAST"
			client.screen += s

			src.see_invisible = 100
			src.combat_dead_seeInvisible = TRUE
		else
			src.see_invisible = 0
			src.combat_dead_seeInvisible = FALSE
		..()