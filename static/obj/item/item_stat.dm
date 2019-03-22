item_stat
	parent_type = /item 

	var
		value = 0
	
	proc
		get_name()
			return name
		set_name(name)
			src.name = name
		
		get_value()
			return value
		set_value(value)
			src.value = value