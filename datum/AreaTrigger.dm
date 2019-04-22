//author: accnameowl

//date 22. april 2019

//max aggro range, in pixels
#define MAX_AGGRO_RANGE = 768

//This datum is used for triggering events for monster ai's
AreaTrigger

	parent_type = /obj

	var/mob/source

	New(mob/_source)
		source = _source

	Crossed(atom/a)
		if(isplayer(a))
			//trigger source AI by calling foundTarget()
			source.foundTarget(a)

	proc

		//argument bound_ is bounds in pixels.
		SetBounds(bound_width, bound_height)

			//keep a max aggro distance for mobs,should resault in 768 pixels
			if(bound_width > MAX_AGGRO_RANGE) bound_width = MAX_AGGRO_RANGE
			if(bound_height > MAX_AGGRO_RANGE) bound_WIDTH = MAX_AGGRO_RANGE

			src.bound_width = bound_width
			src.bound_height = bound_height
