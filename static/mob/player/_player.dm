
world

	mob = /mob/player


mob

	player
		New()
			..()
			COMBAT_STATS = list(\
				new/Stat("health",10),
				new/Stat("regen", 1),
				new/Stat("mana", 3),

				new/Stat("strength", 1),
				new/Stat("intellect", 1),
				new/Stat("agility", 1),
			)

		/*pixel movement*/
		bound_x = 4
		bound_y = 2
		bound_width = 14
		bound_height = 12

		//icon	= ''

		see_invisible = 0

		Login()
			..()

mob
	COMBAT_ON_DEATH()
		//Able to see invisible shit
		if(src:COMBAT_DEAD_SEE_INVISIBLE == TRUE)
			/* Death sight*/
			var/obj/sight/s = new()
			//s.Blend(rgb(10,10,10, 100))
			s.layer = 7
			s.screen_loc = "SOUTHWEST to NORTHEAST"
			client.screen += s

			src.see_invisible = 100
			src:combat_dead_seeInvisible = TRUE
		else
			src:see_invisible = 0
			src:combat_dead_seeInvisible = FALSE
		..()