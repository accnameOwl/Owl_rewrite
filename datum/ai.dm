ai
	var
		mob/npc/source
		scan_list[]

	proc

		scan_area(mob/npc/source, range)
			for(var/mob/player/m in source.view(range))
				if(!m) return FALSE
				scan_list.Add(m)
				return TRUE


		set_target(mob/npc/source, mob/player/m)
			if(!m || !source) return
			source.target = m

		move_to_target(mob/npc/source, mob/player/destination)
			step_towards(source, destination)
			