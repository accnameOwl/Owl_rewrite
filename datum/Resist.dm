Resist
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
		Add(Resist/r, value)
			if(!r && !value) return FALSE
			r:value = r:value + value
		Subtract(Resist/r, value)
			if(!r && !value) return FALSE
			r.value = r:value - value


	proc
		get_name(Resist/r)
			return r:name
		get_element(Resist/r)
			return r:element
		get_value(Resist/r)
			return r:value
		get_limit(Resist/r)
			return r:limit

		set_name(Resist/r, name)
			r:name = name
		set_element(Resist/r, element)
			r:element = element
		set_value(Resist/r, value)
			r:value = value
		set_limit(Resist/r, limit)
			r:limit = limit
