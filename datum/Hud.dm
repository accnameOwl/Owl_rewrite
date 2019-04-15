#define HUD_UPDATE()\

Hud

	parent_type = /obj

	//anchored to parent
	var/parent[]
	//anchored childs
	var/child[]

	var
		//hud state.
		//changable for different HUD effects
		state = "null"



	New( screen_x, screen_y)

		while(src)
			frameUpdate()
			sleep(tick_lag*10)

	proc
		frameUpdate()
			

		setChild(Hud/hud,child)
			hud.child[child] = child
		setParent(Hud/hud, parent)
			hud.parent[parent] = parent