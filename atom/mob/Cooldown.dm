#ifndef TER13_STDLIB
	#warn CooldownLib depends on Ter13.StdLib. StdLib not present. CooldownLib will not be included.
#else
	#ifndef TER13_COOLDOWNLIB
		#define TER13_COOLDOWNLIB "version 2.0"

mob
	var
		list/cooldowns
		list/cooldown_preserve
	proc
		getCooldown(id)
			if(!cooldowns) return -1#INF
			return cooldowns[id]||-1#INF

		onCooldown()
			if(!cooldowns) return 0
			. = -1#INF
			for(var/id in args)
				. = max(cooldowns[id],.)
			return .>world.time

		getCooldowns()
			if(!cooldowns) return -1#INF
			. = -1#INF
			for(var/id in args)
				. = max(cooldowns[id]||-1#INF,.)
			return .

		setCooldown(id,duration,offset=1,preserve=PRESERVE_REALTIME)
			if(!cooldowns)
				cooldowns = list()
				cooldown_preserve = list()
			cooldowns[id] = (offset ? world.time+duration : duration)
			cooldown_preserve[id] = preserve

	Read(savefile/F)
		..()
		var/timeoffset = (world.time-save_worldtime)
		var/realoffset = (world.realtime-save_realtime) + timeoffset
		var/list/cdl = cooldowns, list/cdp = cooldown_preserve, ncd
		for(var/id in cdl)
			switch(cooldown_preserve)
				if(PRESERVE_NONE)
					ncd = world.time
				if(PRESERVE_WORLDTIME)
					ncd = cdl[id]+timeoffset
				if(PRESERVE_REALTIME)
					ncd = cdl[id]+realoffset
			if(ncd>world.time)
				cdl[id] = ncd
			else
				cdl -= id
				cdp -= id
		if(!cdl.len)
			cooldowns = null
			cooldown_preserve = null

	#endif

#endif