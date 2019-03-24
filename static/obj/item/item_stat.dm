item_stat
	parent_type = /attribute

	proc
		get_value()
			return value ? value : 0
		set_value(val)
			value = val