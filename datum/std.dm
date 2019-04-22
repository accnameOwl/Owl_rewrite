#define DEBUG

proc
	err(err)
		if(err) throw EXCEPTION(err)

	delete(atom/a)
		a.loc = null
	//istypes()
	isspell(a)	return istype(a,/Spell)
	isdamage(a)	return istype(a,/Damage)
	isitem(a)	return istype(a,/Item)
	isstat(a)	return istype(a,/Stat)
	isvect2(a)	return istype(a,/vect2)
	isvect3(a)	return istype(a,/vect3)
	ishud(a)	return istype(a,/Hud)
	iseffect(a)	return istype(a,/Effect)
	iscooldown(a)	return istype(a,/Cooldown)
	isinventory(a)	return istype(a,/Inventory)
	isplayer(a)	return istype(a,/mob/player)
	isnpc(a)	return istype(a, /mob/npc)
	isresist(a) return istype(a, /Resist)
	ismonster(a) return istype(a, /mob/monster)