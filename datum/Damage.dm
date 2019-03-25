



Damage
	var tmp
		_damage

		_immunity_group[0]
		_target_group[0]

	New(mob/source)
		if(source && !_immunity_group[source]) AddImmunities(src, source)

	proc

		GetImmunities(Damage/Damage)
			for(var/mob in Damage._immunity_group)
				return mob

		GetDamage(Damage/Damage)
			if(!length(Damage._damage)) return 0
			return Damage._damage

		AddImmunities(Damage/Damage, mob/mob)
			if(!Damage || mob) return
			Damage._immunity_group[mob] = mob

		AddTarget(Damage/Damage, mob/mob)
			if(!Damage || mob) return
			Damage._target_group[mob] = mob

		Damage(Damage/Damage)
			var/mob/prefix 
			var/__target_group = Damage._target_group
			var/__immunity_group = Damage._immunity_group
			for(var/mob in __target_group)
				if(!__immunity_group.Find(mob))
					prefix.COMBAT_ON_DAMAGE(mob, Damage._damage)

/*logs*/

	()
		.=..()
		#ifdef LOG_COMBAT
		log("")
		#endif