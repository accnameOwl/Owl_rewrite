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
		attribute/level = new("level", 1, 1, 100, 1, 1.4)
		attribute/health = new("health", 20, 1, 100, 1.2, 1.4)
		attribute/stamina = new("stamina",10, 1, 100, 1.2, 1.4)
		attribute/regen = new("regen", 1, 1, 100, 1.2, 1.4)
		attribute/strength = new("strength", 1, 1, 100, 1.2, 1.4)



	death()
		//Able to see invisible shit
		if(DEAD_SEE_INVISIBLE == TRUE)
			/* Death sight*/
			var/obj/sight/s = new()
			//s.Blend(rgb(10,10,10, 100))
			s.layer = 7
			s.screen_loc = "SOUTHWEST to NORTHEAST"
			client.screen += s

			see_invisible = 100
			dead_sees_invisible = TRUE
		else
			see_invisible = 0
			dead_sees_invisible = FALSE
		..()