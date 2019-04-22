
#define cT = 10
#define MOB_COMBAT_REGEN_START(mob)\
#define MOB_COMBAT_REGEN_STOP(mob)\


mob/var
	const
		COMBAT_DEAD_DENSITY = 0
		COMBAT_TURNINVISIBLEONDEATH = TRUE
		COMBAT_DEAD_SEE_INVISIBLE = TRUE
	tmp
		combat_dead = FALSE
		combat_dead_seeInvisible = TRUE
		combat_dead_canRespawn = TRUE
		combat_dead_respawnTime = 100
		combat_healthRegen_trigger = FALSE
		combat_inCombat = FALSE


mob/proc
	combat_invisible(mob/m, flag)
		if(flag == null) return m.invisibility
		if(flag == TRUE) m.invisibility = 100
		if(flag == FALSE) m.invisibility = 0
	combat_on_death(mob/m)
		if(!m) return FALSE
		//turn invisible
		if(m.COMBAT_TURNINVISIBLEONDEATH) combat_invisible(m, TRUE)
		else m.combat_invisible(m, FALSE)
		m.density = 0
		m.combat_dead = TRUE
		if(m.combat_dead == TRUE && m.combat_dead_canRespawn) spawn(m.combat_dead_respawnTime) m.combat_on_respawn()


	combat_on_respawn(mob/m)

		if(combat_invisible(m)) combat_invisible(m, FALSE)

		if(!m.density) m.density = 1

		if(m.combat_dead) m.combat_dead = FALSE

		if(m.combat_dead_seeInvisible) m.combat_dead_seeInvisible = FALSE
		stats_set_value(m, "health",stats_get_limit(m, "health"))

	combat_on_damage(mob/m, damage, ref)
		if(istype(ref, /mob/player) || istype(ref, /mob/npc))
			if(m.combat_dead) return
			m.combat_inCombat = TRUE
		var/Resist/r = m.resist
		var/mitigated = damage * (r.get_value()/100)
		stats_set_value( round(stats_get_value(m,"health") - (damage - mitigated))

		if(!m.combat_healthRegen_trigger) m.combat_on_regen(m)
		if(stats_get_value(m, "health") <= 0 ) combat_on_death(m)

	combat_on_regen(mob/m)
		if(!m.combat_healthRegen_trigger)

			m.combat_healthRegen_trigger = TRUE

			while(m.combat_healthRegen_trigger)
				//if in combat, stop health regen
				if(m.combat_inCombat) m.combat_healthRegen_trigger = FALSE

				//delaytime for regen
				var/sleeptime = world.time + (10 - round(stats_get_level(m, "regen") / 2))
				
				if(world.time >= sleeptime)

					sleeptime = world.time + (10 - round(stats_get_level(m, "regen") / 2))

					if(stats_get_value(m, "health") < stats_get_limit(m, "health"))
						var/amount = stats_get_value(m, "health") + stats_get_value(m, "regen")
						stats_set_value(m, "health", amount)
						stats_gain_experience(m, "regen", 10)

				if(m.combat_healthRegen_trigger && stats_get_value(m, "health") > stats_get_limit(m,"health"))
					stats_set_value(stats_get_limit(m, "health"))
					m.combat_healthRegen_trigger = FALSE

				sleep(tick_lag * 5)

//else

/*Continuing*/

/*@info mob/player ABILITIES*/
mob/player


mob
	proc
		delete(mob/m)
			m.loc = null