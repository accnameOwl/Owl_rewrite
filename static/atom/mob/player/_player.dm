


mob

	Login()
		..()
		src.loc = locate(1,1,1)

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

		var
			list
				combat_stats = {(
					"health" = var/Stat("health",10),
					"regen" = var/Stat("regen", 1),
					"mana" = var/Stat("mana", 3),

					"strength" = var/Stat("strength", 1),
					"intellect" = var/Stat("intellect", 1),
					"agility" = var/Stat("agility", 1)
				)}

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