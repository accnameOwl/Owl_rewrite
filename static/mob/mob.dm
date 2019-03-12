mob

	/*Life and death*/
	var/const
		DEAD_DENSE = FALSE
		DEAD_INVISIBLE = TRUE
		DEAD_SEE_INVISIBLE = TRUE
	var
		dead = FALSE
		dead_sees_invisible = FALSE
		dead_can_respawn = TRUE
		dead_respawn_time = 10 * 10 // ms * 10
		health_regen = FALSE
		in_combat = FALSE

	//onDeath()
	proc/death() // Called on death

		//turn invisible
		if(DEAD_INVISIBLE == TRUE) invisibility = 100
		else invisibility = 0

		//remove density while dead
		if(DEAD_DENSE == FALSE) density = 0
		else density = 1

		dead = TRUE

		//trigger respawntime
		if(dead == TRUE && dead_can_respawn) spawn(dead_respawn_time) src.respawn()

	//respawn()
	proc/respawn()
		invisibility = 0
		density = 1
		dead = FALSE
		see_invisible = 0
		// Remove death sight
		if(dead_sees_invisible != FALSE)
			dead_sees_invisible = FALSE
			for(var/obj/sight/s in client.screen)	client.screen -= s
		health.setValue(health.getLimit())

	//damage()
	proc/damage(damage, mob/ref)
		if(istype(ref, /mob/player) || istype(ref, /mob/npc))
			in_combat = TRUE
		health.setValue( health.getValue() - damage)
		if(!health_regen) health_regen()
		if(health.getValue() <= 0) death()

	//health_regen()
	proc/health_regen()
		if(health_regen == FALSE)

			var/sleeptime = 20 - regen.getLevel()
			health_regen = TRUE

			while(health_regen)
				if(in_combat)	health_regen = FALSE
				while(health.getValue() < health.getLimit())
					var/amount = health.getValue() + regen.getValue()
					health.setValue( amount )
					regen.gainXp(10)
					if(sleeptime > 5)	sleep(sleeptime)
					else	sleep(5)
				//	Check overamount
				if(health_regen && health.getValue() > health.getLimit())
					health.setValue(health.getLimit())
					health_regen = !health_regen
