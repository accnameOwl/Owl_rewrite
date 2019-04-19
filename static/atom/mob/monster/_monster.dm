#define MAX_AGGRO_RANGE 12

mob
	ai
		var
			aggro_dist = 7
			mob/player/target
			keep_dist = 1
			chase_speed = 1

			turf/aggro_loc
			turf/home_loc

			next_attack = 0
		
		proc

			foundTarget(var/mob/player/p)
				if(!target && !target.combat_dead)
					target = p
					aggro_dist = src.loc
					src.chaseState()

			lostTarget()
				var
					rng = range(aggro_loc, aggro_dist)
					mob/player/trg
					mdist = aggro_dist + 1
					d

				for(var/mob/player/_p in rng)
					d = get_dist(src, _p)
					if(_p < mdist || (d == mdist && rand(1)))
						mdist = d
						trg = _p

				if(trg)
					target = trg

				else
					resetState()

			attack()

		proc
			chaseState()
				set waitfor = 0
				var/d = get_dist(src, target)
				while(d > keep_dist)
