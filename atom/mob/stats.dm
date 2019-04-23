
mob/var
	list/combat_stats = list()
	list/resist = list()

/* 
mob/New()
	..()
 */

mob/proc
	/* @info COMBAT GET*/
	stats_get_name(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.name : 0
	stats_get_value(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.value : 0
	stats_get_level(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.level : 0
	stats_get_limit(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.limit : 0
	stats_get_experience(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.xp : 0
	stats_get_requiredexperience(stat)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		return A ? A.xp_next : 0
	/*@info COMBAT SET*/
	stats_set_name(stat, name)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && name) A.name=name
	stats_set_value(stat, value)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && value) A.value = value
	stats_set_limit(stat, limit)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && limit) A.limit = limit
	stats_set_experience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp = experience
	stats_set_requiredexperience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp_next = experience
	/*@info COMBAT ADD*/
	stats_add_value(stat, value)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && value) A.value += value
	stats_add_limit(stat, limit)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && limit) A.limit += limit
	stats_add_experience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp += experience
	stats_add_requiredexperience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp_next += experience
	/*@info COMBAT SUBTRACT*/
	stats_subtract_value(stat, value)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && value) A.value -= value
	stats_subtract_limit(stat, limit)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && limit) A.limit -= limit
	stats_subtract_experience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp -= experience
	stats_subtract_requiredexperience(stat, experience)
		var/Stat/A = src.combat_stats && src.combat_stats[stat]
		if(A && experience) A.xp_next -= experience

	stats_gain_experience(stat, amount)
		var/Stat/A =src.combat_stats && src.combat_stats[stat]
		if(A && amount) A.gainXp(amount)

	stats_get_primarystat()
		var/Stat/A = src.combat_stats && src.combat_stats["intellect"]
		var/Stat/B = src.combat_stats && src.combat_stats["strength"]
		var/Stat/C = src.combat_stats && src.combat_stats["agility"]

		if(A.value > B.value && A.value > C.value) return "intellect"
		if(B.value > A.value && B.value > C.value) return "stength"
		if(C.value > A.value && C.value > B.value) return "agility"