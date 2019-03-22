item_stat
	parent_type = /item 

	var
		value = 0
	
	proc
		get_value()
			return value ? value : 0
		set_value(val)
			value = val