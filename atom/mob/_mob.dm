mob

	proc
		changeLoc(mob/_mob, location)
			if(_mob && location)
				_mob.loc = location

		delete(mob/m)
			m.loc = null

	proc
		onDel()
		preRead()
		postRead()
		preWrite()
		postWrite()
	Del()
		onDel()
		..()
	Read()
		preRead()
		..()
		postRead()
	Write()
		preWrite()
		..()
		postWrite()