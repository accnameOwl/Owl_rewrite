
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
	COMBAT_INVISIBLE(mob/m, flag)

		if(flag == "true") m.invisibility = 100
		if(flag == "false") m.invisibility = 0

		if(!flag) return m.invisibility
	COMBAT_ON_DEATH(mob/m)
		if(!m) return FALSE
		//turn invisible
		if(m.COMBAT_TURNINVISIBLEONDEATH) COMBAT_INVISIBLE(m, TRUE)
		else m.COMBAT_INVISIBLE(m, FALSE)

		if(m.COMBAT_DEAD_DENSITY == FALSE) m.density = 0
		else	m.density = 1

		m.combat_dead = TRUE

		if(m.combat_dead == TRUE && m.combat_dead_canRespawn) spawn(m.combat_dead_respawnTime) m.COMBAT_ON_RESPAWN()


	COMBAT_ON_RESPAWN(mob/m)

		if(COMBAT_INVISIBLE(m)) COMBAT_INVISIBLE(m, "false")

		if(!m.density) m.density = 1

		if(m.combat_dead) m.combat_dead = FALSE

		if(m.combat_dead_seeInvisible) m.combat_dead_seeInvisible = FALSE
		stats_set_value(m, "health",stats_get_limit(m, "health"))

	COMBAT_ON_DAMAGE(mob/m, damage, ref)
		if(istype(ref, /mob/player) || istype(ref, /mob/npc))
			if(m.combat_dead) return
			m.combat_inCombat = TRUE
		stats_set_value( round(stats_get_value(m,"health") - damage))

		if(!m.combat_healthRegen_trigger) m.COMBAT_ON_REGEN(m)
		if(stats_get_value(m, "health") <= 0 ) COMBAT_ON_DEATH(m)

	COMBAT_ON_REGEN(mob/m)
		if(!m.combat_healthRegen_trigger)

			var/sleeptime = 20 - round(stats_get_level(m, "regen") / 2)
			if(sleeptime <= 5) sleeptime = 5
			m.combat_healthRegen_trigger = TRUE

			while(m.combat_healthRegen_trigger)
				if(m.combat_inCombat) m.combat_healthRegen_trigger = FALSE
				while(stats_get_value(m, "health") < stats_get_limit(m, "health"))
					var/amount = stats_get_value(m, "health") + stats_get_value(m, "regen")
					stats_set_value(m, "health", amount)
					stats_gain_experience(m, "regen", 10)
					sleep(sleeptime)

				if(m.combat_healthRegen_trigger && stats_get_value(m, "health") > stats_get_limit(m,"health"))
					stats_set_value(stats_get_limit(m, "health"))
					m.combat_healthRegen_trigger = !m.combat_healthRegen_trigger


//else

/*Continuing*/

/*@info mob/player ABILITIES*/
mob/player


mob
/*
	Move()
	Bump()
*/

	proc

		delete()
			del(src)