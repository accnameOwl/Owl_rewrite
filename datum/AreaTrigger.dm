//author: accnameowl

//date 22. april 2019

//max aggro range, in pixels
#define MAX_AGGRO_RANGE = 768

//This datum is used for triggering events for monster ai's
AreaTrigger

	parent_type = /obj

	var/mob/monster/source

	New(mob/_source)
		source = _source

	Crossed(atom/a)
		if(isplayer(a))
			//trigger source AI by calling foundTarget()
			source:foundTarget(a)

	proc

		//argument bound_ is bounds in pixels.
		SetBounds(w, h)

			//keep a max aggro distance for mobs,should resault in 768 pixels


			src.bound_width = w
			src.bound_height = h
