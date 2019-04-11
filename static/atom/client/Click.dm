
client
	var/walk_speed = 2
	Click(atom/clicked)
		if(!clicked) return

		if(get_dist(src, clicked) == 0)
			return 0
		else
			step_to(src, t,0,0)

		src << clicked
