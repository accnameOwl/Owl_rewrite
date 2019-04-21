resist
	var
		name = ""
		element = ""

		value = 0
		limit = 0

	New(name = "", element ="", value = 0, limit = 0, math_multiplier = 0)
		src.name = name
		src.element = type
		src.value = value
		src.limit = limit

	proc
		Add(resist/r, value)
			if(!r && !value) return FALSE
			r:value = r:value + value
		Subtract(resist/r, value)
			if(!r && !value) return FALSE
			r.value = r:value - value
			

	proc
		get_name(resist/r)
			return r:name
		get_element(resist/r)
			return r:element
		get_value(resist/r)
			return r:value
		get_limit(resist/r)
			return r:limit
		get_percent(resist/r)
			return calc_percent(r)

		set_name(resist/r, name)
			r:name = name
		set_element(resist/r, element)
			r:element = element
		set_value(resist/r, value)
			r:value = value
		set_limit(resist/r, limit)
			r:limit = limit
