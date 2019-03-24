#define SCALE_MIN 0.25
#define SCALE_MAX 5

projectile
	parent_type = /obj

	var
		damage = 0
		mob/player/source_player

	New(mob/player/p)
		source_player = p

	Bump(atom/a)
		if(istype(a, /mob/player))
			var/mob/player/player = a
			player.COMBAT_TAKE_DAMAGE(player, src.calculate_damage())
		if(istype(a, /mob/npc))
			var/mob/npc/npc = a
			npc.COMBAT_TAKE_DAMAGE(npc, src.calculate_damage())
		..()

	Move()
		..()

	proc
		Spawn(projectile/p, locx,locy,locz)
			p:locate(locx,locy,locz)

		Scale(projectile/p,var/ratio)
			//check min/max ratio
			if(p.ratio < SCALE_MIN)
				p.ratio = SCALE_MIN
			if(p.ration > SCALE_MAX)
				p.ration = SCALE_MAX

			//rescale icon
			//rescale bounds
			//relocate related to scale


		calculate_damage(stat_weight)
			if(!source_player) return throw EXCEPTION("No source_player for [src]")
			var/mob/m
			var/actualDamage = m.stats_get_value(source_player, stat_weight)
			return actualDamage