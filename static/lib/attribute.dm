#ifndef lib_attribute
	#define lib_attribute

attribute  
	var
		const
			LIMIT_GAIN_RATE = 1
			XP_GAIN_RATE = 1
		name
		value = 0
		limit = 0
		level = 1
		xp = 0
		xp_next = 100
		xp_total = 0
		limit_gain_rate = LIMIT_GAIN_RATE
		xp_gain_rate = XP_GAIN_RATE
	
	New(name, value = 0, level = 1, xp_next = 100, limit_gain_rate = LIMIT_GAIN_RATE, xp_gain_rate = XP_GAIN_RATE)
		src.name = name
		src.value = value
		src.level = level
		src.xp_next = xp_next
		src.limit_gain_rate = limit_gain_rate
		src.xp_gain_rate = xp_gain_rate

	proc
		setName(val)
			if(val) name = val
			else throw EXCEPTION("src : [src] - Expecting argument: setName(val)")
		setValue(val)
			if(val) value = val
			else throw EXCEPTION("src: [src] - Expecting argument: setValue(val)")
		setLevel(val)
			if(val) level = val
			else throw EXCEPTION("src: [src] - Expecting argument: setLevel(val)")
		setXp(val)
			if(val) xp = val
			else throw EXCEPTION("src: [src] - Expecting argument: setXp(val)")
		setXpNext(val)
			if(val) xp_next = val
			else throw EXCEPTION("src: [src] - Expecting argument: setXpNext(val)")
		setLimitGainRate(val)
			if(val) limit_gain_rate = val
			else throw EXCEPTION("src: [src] - Expecting argument: setLimitGainRate(val)")
		setXpGainRate(val)
			if(val) xp_gain_rate = val
			else throw EXCEPTION("src: [src] - Expecting argument: setXpGainRate(val)")
		
		getName() return name;
		getValue() return value;
		getLevel() return level;
		getXp() return xp;
		getXpNext() return xp_next;
		getLimitGainRate() return limit_gain_rate;
		getXpGainRate() return xp_gain_rate;

		gainXp(_xp)
			xp += _xp
			xp_total += _xp
			. = level
			while(xp >= xp_next)
				limit += round(level * limit_gain_rate)
				value = limit
				++level
				xp -= xp_next
				xp_next = round(xp_next * xp_gain_rate)