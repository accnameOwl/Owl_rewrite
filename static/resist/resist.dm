resist
	var
		name = ""
		element = ""

		value = 0
		limit = 0
		percent = 0

		math_multiplier = 0

	New(name = "", element ="", value = 0, limit = 0, math_multiplier = 0)
		src.name = name
		src.element = type
		src.value = value
		src.limit = limit
		percent = calc_percent()


	proc
		calc_percent(resist/r)
			if(!istype(r, /resist))		return
			if(value && limit)
				return value*math_multiplier/100