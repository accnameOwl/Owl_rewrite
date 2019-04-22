#define SCAN_RANGE = 10

mob/npc

	Move()
		..()
		moving = TRUE

	test_blob
		var/tmp/moving = FALSE
		var/target
		var/actions[]
	New()
		AI = New()
		COMBAT_STATS = list(
			Stat/new("health",120),
			Stat/new("regen", 3),
			Stat/new("mana", 20),

			Stat/new("strength", 6),
			Stat/new("intellect", 1),
			Stat/new("agility", 1),
		)
		spawn() AI()

			/*
				
			if(actions[1] == "scan_area"))
				if(AI.scan_area(src, SCAN_RANGE))
					actions.Add("set_target")
				actions[1].Cut()

			if(actions[1] == "set_target")
				if(!AI.scal_list.len)
					actions[1].Cut()
				else 
					AI.set_target(src, AI.scan_list[1])
					actions.Add("move_to_target")
				actions[1].Cut()

			if(actions[1] == "move_to_target")
				actions[1].move_to_target(src, target)

			if(get_dist(src, target) <= 1)
				actions.Add("punch_taret")
			if(get_dist(src, target) >= 1)
				actions.Add("move_to_target")

			if(!actions.len)
				actions.Add("scan_area")
				step_rand(src, 1)
			
			sleep(tick_lag)
			*/

	proc
		AI()
			while(src && AI)
				if(!AI.running)
					sleep(tick_lag * 10)
				else
					switch(actions[1])
						if("scan_area")
							if(AI.scan_area(src, SCAN_RANGE))
								actions.Add("set_target")
							actions[1].Cut()
						if("set_target")
							if(!AI.scan_list.len) actions[1].Cut()
							else
								AI.set_target(src, AI.scan_list[1])
								actions.Add("move_to_target")
								actions[1].Cut()
						if("move_to_target")
							AI.move_to_target(src, target)
							actions[1].Cut()
						if("punch_target")
							if(get_dist(src, target) >= 2)
								actions.Add("move_to_target")
							else
								src.Punch(target)
						else
							actions.Add("scan_area")
					sleep(tick_lag)
	verb

		Punch(mob/m)
			if(!m) return
			flick("punch")
			var/Damage = stats_get_value(src, "strength")
			combat_on_damage(m, damage)