#define HUD_UPDATE()\

Hud

	parent_type = /obj

	var/parent[]
	var/child[]



	New( screen_x, screen_y)



	proc
		setChild(Hud/hud,child)
			hud.child[child] = child
		setParent(Hud/hud, parent)
			hud.parent[parent] = parent

		frameUpdate()
			