
mob/var
	list/COMBAT_STATS = list()

/* 
mob/New()
	..()
 */

mob/proc
	/* @info COMBAT GET*/
	stats_get_name(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.name : 0
	stats_get_value(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.value : 0
	stats_get_level(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.level : 0
	stats_get_limit(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.limit : 0
	stats_get_experience(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.xp : 0
	stats_get_requiredexperience(mob/M, attribute)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		return A ? A.xp_next : 0
	/*@info COMBAT SET*/
	stats_set_name(mob/M, attribute, name)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && name) A.name=name
	stats_set_value(mob/M, attribute, value)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && value) A.value = value
	stats_set_limit(mob/M, attribute, limit)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && limit) A.limit = limit
	stats_set_experience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp = experience
	stats_set_requiredexperience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp_next = experience
	/*@info COMBAT ADD*/
	stats_add_value(mob/M, attribute, value)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && value) A.value += value
	stats_add_limit(mob/M, attribute, limit)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && limit) A.limit += limit
	stats_add_experience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp += experience
	stats_add_requiredexperience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp_next += experience
	/*@info COMBAT SUBTRACT*/
	stats_subtract_value(mob/M, attribute, value)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && value) A.value -= value
	stats_subtract_limit(mob/M, attribute, limit)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && limit) A.limit -= limit
	stats_subtract_experience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp -= experience
	stats_subtract_requiredexperience(mob/M, attribute, experience)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && experience) A.xp_next -= experience

	stats_gain_experience(mob/M, attribute, amount)
		var/attribute/A =M.COMBAT_STATS && M.COMBAT_STATS[attribute]
		if(A && amount) A.gainXp(amount)

	stats_get_primarystat(mob/M)
		var/attribute/A = M.COMBAT_STATS && M.COMBAT_STATS["intellect"]
		var/attribute/B = M.COMBAT_STATS && M.COMBAT_STATS["strength"]
		var/attribute/C = M.COMBAT_STATS && M.COMBAT_STATS["agility"]

		if(A.value > B.value && A.value > C.value) return "intellect"
		if(B.value > A.value && B.value > C.value) return "stength"
		if(C.value > A.value && C.value > B.value) return "agility"