
client
	var/walk_speed = 2
	var/GoingSomewhere = FALSE
	Click(object, location)
		set waitfor=0

		if(!object) err("[src] - client.Click() - could not find object")
		if(!location) err("[src] - client.Click() - could not find location")

		//if client is already walking somewhere, cancle the previous loop and walk to new location
		if(GoingSomewhere) ~GoingSomewhere
		GoingSomewhere = TRUE

		var
			distToDestination = get_dist(src, object)
			dirToDestination = get_dir(src, object)

		//while distance is greated then 0, then walk towards destination
		while(distToDestination > 0 && GoingSomewhere)
			step(src, dirToDestination)

			//calculate new distance
			distToDestination = get_dist(src, object)

			sleep(walk_speed)
