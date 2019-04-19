



Damage

	var tmp
		_damage

		_immunity_group[0]
		_target_group[0]

	New(mob/source, damage)
		if(source && !_immunity_group[source]) AddImmunities(src, source)
		if(damage)
			_damage = damage
	proc

		getImmunities(Damage/Damage)
			for(var/mob in Damage._immunity_group)
				return mob

		getDamage(Damage/Damage)
			if(!length(Damage._damage)) return 0
			return Damage._damage

		addImmunities(Damage/Damage, mob/mob)
			if(!Damage || mob) return
			Damage._immunity_group[mob] = mob

		addTarget(Damage/Damage, mob/mob)
			if(!Damage || mob) return
			Damage._target_group[mob] = mob

		Damage(Damage/Damage)
			var/mob/prefix 
			for(var/mob in Damage._target_group)
				if(!Damage._immunity_group.Find(mob))
					prefix.COMBAT_ON_DAMAGE(mob, Damage._damage)
