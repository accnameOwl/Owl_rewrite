ai
	var
		mob/npc/source
		scan_list[]

		running

	proc

		scan_area(mob/npc/source, range)
			for(var/mob/player/m in source.view(range))
				if(!m) return FALSE
				scan_list.Add(m)
				sleep(tick_lag*10/world.fps)
				return TRUE


		set_target(mob/npc/source, mob/player/m)
			if(!m || !source) return
			source.target = m

		move_to_target(mob/npc/source, mob/player/destination)
			step_towards(source, destination)
		
		sleeping(mob/npc/source)
			if(running) running = FALSE
			else running = TRUE