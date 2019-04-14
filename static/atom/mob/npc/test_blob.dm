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
		AI = New(src)

		while(src)
			if(actions[1] == "scan_area"))
				if(AI.scan_area(SCAN_RANGE))
					actions.Add("set_target")
				actions[1].Cut()

			if(actions[1] == "set_target")
				if(!AI.scal_list.len)
					actions[1].Cut()
				else 
					AI.set_target(AI.scan_list[1])
					actions.Add("move_to_target")
				actions[1].Cut()

			if(actions[1] == "move_to_target")
				actions[1].move_to_target(src, target)

			if(get_dist(src, target) <= 1)
				Punch(target)
			if(get_dist(src, target) >= 1)
				actions.Add("move_to_target")

			if(!actions.len)
				actions.Add("scan_area")
				step_rand(src, 1)
			
			sleep(tick_lag)
	
	verb

		Punch(mob/m)
			if(!m) return
			flick("punch")
			var/Damage/_damage = New(src)
			_damage.AddTarget(m)
			_damage.Damage()