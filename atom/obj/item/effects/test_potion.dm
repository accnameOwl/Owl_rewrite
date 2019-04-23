Effect

	var/tmp
		duration = -1#INF
		alive = FALSE

	var/mob/user

	New(mob/_user, _duration)
		user = _user
		duration += _duration
		alive = TRUE
		while(alive)
			if(_duration > -1#INF) alive = FALSE
			sleep(1)
			duration--
		Del(src)

	Del()
//		user.effects[src] = null


