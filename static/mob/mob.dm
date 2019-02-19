mob

	/*Life and death*/
	var/const
		DEAD_DENSE = FALSE
		DEAD_INVISIBLE = TRUE
		DEAD_SEE_INVISIBLE = TRUE
	var
		dead_sees_invisible = FALSE
		dead_can_respawn = TRUE
		dead_respawn_time = 10 * 10 // ms * 10
		stamina_regen = FALSE
		in_combat = FALSE

	proc/onDeath() // Called on death
		if(DEAD_INVISIBLE == TRUE) invisibility = 100
		else invisibility = 0

		if(DEAD_DENSE == FALSE) density = 0
		else density = 1

		if(DEAD_SEE_INVISIBLE == TRUE)
			/* Death sight*/
			var/obj/sight = new()
			sight.Blend(rgb(10,10,10, 100))
			sight.layer = 7
			sight.screen_loc = "SOUTHWEST to NORTHEAST"
			client.screen += sight
			
			see_invisible = 100
			dead_sees_invisible = TRUE
		else 
			see_invisible = 0
			dead_sees_invisible = FALSE
		
		if(dead == TRUE && dead_can_respawn) spawn(dead_respawn_time) src.respawn()
		dead = TRUE
	
	proc/respawn()
		invisibility = 0
		density = 1
		dead = FALSE
		see_invisible = 0
		// Remove death sight
		if(dead_sees_invisible != FALSE)
			dead_sees_invisible = FALSE
			for(obj/sight/s in client.screen)	client.screen -= s
		stamina.setvalue(stamina.getLimit())

	proc/damage(damage, mob/ref)
		if(istype(ref, /mob/player) || istype(ref, /mob/npc))
			in_combat = TRUE
		stamina.setValue( stamina.getValue() - damage)
		if(!combat_regen) stamina_regen()
		if(stamina.getValue() <= 0) onDeath()

	proc/stamina_regen()
		if(stamina_regen == FALSE)

			var/sleeptime = 20 - regen.getlevel()
			!stamina_regen

			while(stamina_regen)
				if(in_combat)	!stamina_regen
				while(stamina.getValue() < stamina.getLimit())
					var/amount = stamina.getValue() + regen.getValue()
					stamina.setValue( amount )	
					regen.gainXp(10)
					if(sleeptime > 5)	sleep(sleeptime)
					else	sleep(5)
				//	Check overamount
				if(stamina_regen && stamina.getValue() > stamina.getLimit())
					stamina.setValue(stamina.getLimit())
				