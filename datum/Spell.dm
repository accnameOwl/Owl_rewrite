
#define SPELL_FLAG_DIRECTIONAL 1
#define SPELL_FLAG_HOMING 2
#define SPELL_FLAG_CURVE 3
Spell

	parent_type = /obj

	var
		mob/source
		mob/target
		damage

		id
		lifespan = 0
		flag
		walk_speed

	proc
		setSource(mob/source)
			if(!ismob(m)) return err("[src].setSource : Spell.setSource() requires /mob type as argument")
			src.source = source

		setTarget(mob/_target)
			if(_target) target = _target 

		setDir(dir)
			if(!dir) return FALSE
			if(dir != "NORTH" || dir != "SOUTH" || dir != "EAST" || dir != "WEST" || dir != "NORTHEAST" || dir != "NORTHWEST" || dir != "SOUTHEAST" || dir != "SOUTHWEST") return err("Spell.setDir() : arg not corresponding to any true direction")
			src.dir = dir

		setLoc(x,y,z)
			if(x) src.x = x
			if(y) src.y = y
			if(z) src.z = z

		setDamage(damage)
			if(!damage) err("[src] - /Spell - setDamage(damage) : damage argument was not found")
			else
				src.damage = damage

		setLifespan(_lifespan)
			lifespan = world.time + _lifespan

		setFlag()
			if()

		onBump(atom/a)

		onMove()
			if(lifespan)
				do ..()
				while(lifespan >= world.time)
				delete(src)

	Bump(atom/a)
		onBump(a)
		..()

	Move()
		onMove()



//Spell example
Spell/Example
	id = 1
	New(mob/_source)
		source = _source
		var/mob/_mob
		src.damage = New(src.source, _mob.stats_get_value(src.source, "intellect"))

	onBump(atom/a)
		if(ismob(a))

			damage.addTarget(a)
			damage.Damage(damage)
		delete(src)


mob/player
	verb
		ExampleSpell()
			var/Spell/Example/spell = New(src)
			spell.setTarget(src.target)

			spell.setLoc(src.x, src.y, src.z)
			if(spell.flag == "SPELL_FLAG_DIRECTIONAL")
				spell.setDir(src.dir)
				walk(spell, spell.dir)
			if(spell.flag == "SPELL_FLAG_HOMING")
				walk_towards(spell, spell.target)