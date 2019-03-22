
#define seconds = 10

mob/combat/var
	const
		COMBAT_DEAD_DENSITY = 0
		COMBAT_TURNINVISIBLEONDEATH = TRUE
		COMBAT_DEAD_SEE_INVISIBLE = TRUE
	
	combat_dead = FALSE
	combat_dead_seeInvisible = TRUE
	combat_dead_canRespawn = TRUE
	combat_dead_respawnTime = 10 * seconds
	combat_healthRegen_trigger = FALSE
	combat_inCombat = FALSE


mob/proc
	COMBAT_ON_DEATH(mob/m)
		if(!m) return FALSE

		//turn invisible
		if(m:COMBAT_TURNINVISIBLEONDEATH) COMBAT_INVISIBLE(m, TRUE)
		else m.COMBAT_INVISIBLE(m, FALSE)

		if(m:COMBAT_DEAD_DENSITY == FALSE) m.density = 0
		else	m.density = 1

		m.combat_dead = TRUE

		if(m.combat_dead == TRUE && m.combat_dead_canRespawn) spawn(m.combat_dead_respawnTime) m.COMBAT_ON_RESPAWN()


	COMBAT_ON_RESPAWN(mob/m)
		if(COMBAT_INVISIBLE(m)) COMBAT_INVISIBLE(m, FALSE)

		if(!m.desnity) m.density = 1

		if(m:combat_dead) m:combat_dead = FALSE

		if(m:combat_dead_seeInvisible) m:combat_dead_seeInvisible = FALSE

		if(!m.health) return
		else	m.health.setValue(health.getLimit())

	COMBAT_ON_DAMAGE(mob/m, damage, ref)
		if(istype(ref, /mob/player) || istype(ref, /mob/npc))
			m:combat_inCombat = TRUE
		m.health.setValue( health.getValue/( . damage))
		if(!m:combat_healthRegen_trigger) COMBAT_ON_REGEN(m)
		if(m.health.getValue() <= 0) COMBAT_ON_DEATH(m)

	COMBAT_ON_REGEN(mob/m)
		if(!m:combat_healthRegen_trigger)

			var/sleeptime = 20 - round(m.regen.getLevel() / 2)
			if(sleeptime <= 5) sleeptime = 5
			health_regen = TRUE

			while(m:combat_healthRegen_trigger)
				if(m.combat_inCombat) m:combat_healthRegen_trigger = FALSE
				while(m.health.getValue() < m.health.getLimit())
					var/amount = m.health.getValue() + m.regen.getValue()
					m.health.setValue(amount)
					m.regen.gainXP(10)
					sleep(sleeptime)
				
				if(m.combat_healthRegen_trigger && m.health.getValue() > m.health.getLimit())
					m.health.setValue(health.getLimit())
					m.combat_healthRegen_trigger = !m.combat_healthRegen_trigger
	
	COMBAT_INVISIBLE(mob/m, flag)	
	
		if(flag) m.invisible = 100
		else m.invisible = 0

		if(!flag) return m.invisible