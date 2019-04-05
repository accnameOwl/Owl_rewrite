


mob

	Login()
		..()
		src.loc = locate(1,1,1)
		COMBAT_STATS = list(\
			new/Stat("health",10),
			new/Stat("regen", 1),
			new/Stat("mana", 3),

			new/Stat("strength", 1),
			new/Stat("intellect", 1),
			new/Stat("agility", 1),
		)
		src << list2params(COMBAT_STATS)
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

		New()
			..()

mob/player
	COMBAT_ON_DEATH()
		//Able to see invisible shit
		if(src.COMBAT_DEAD_SEE_INVISIBLE == TRUE)
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