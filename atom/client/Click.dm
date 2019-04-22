
client
	var/walk_speed = 2
	Click(object, location)
		if(!clicked) return

		if(get_dist(src, location) == 0)
			return 0
		else
			step_to(usr, location)

		src << clicked + location
