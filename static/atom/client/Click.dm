
client
	var/walk_speed = 2
	Click(atom/clicked)
		if(!clicked) return

		if(get_dist(src, clicked) <= 1)
			return src << "to close"
		else
			var/turf/t = clicked
			step_to(src, t,0,0)

		src << clicked
