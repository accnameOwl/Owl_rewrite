#define DEBUG

proc
	err(err)
		if(err) throw EXCEPTION(err)


	//istypes()
	isspell(a)	return istype(a,/Spell) ? TRUE : FALSE
	isdamage(a)	return istype(a,/Damage) ? TRUE : FALSE
	isitem(a)	return istype(a,/Item) ? TRUE : FALSE
	isstat(a)	return istype(a,/Stat) ? TRUE : FALSE
	isvect2(a)	return istype(a,/vect2) ? TRUE : FALSE
	isvect3(a)	return istype(a,/vect3) ? TRUE : FALSE
	ishud(a)	return istype(a,/Hud) ? TRUE : FALSE
	iseffect(a)	return istype(a,/Effect) ? TRUE : FALSE
	iscooldown(a)	return istype(a,/Cooldown) ? TRUE : FALSE
	isinventory(a)	return istype(a,/Inventory) ? TRUE : FALSE
	isplayer(a)	return istype(a,/mob/player) ? TRUE : FALSE
	isnpc(a)	return istype(a, /mob/npc) ? TRUE : FALSE
	isresist(a) return istype(a, /Resist) ? TRUE : FALSE
	ismonster(a) return istype(a, /mob/monster) ? TRUE : FALSE