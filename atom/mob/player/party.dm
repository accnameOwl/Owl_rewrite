mob/player
	var/Party/party

	verb
		party_create()
			if(party) src << "You are already in a party!"
			party = new(src)
			src.verbs += new/mob/player/party/verb/party_remove()
			src.verbs += new/mob/player/party/verb/party_promote_to_leader()
			src.verbs += new/mob/player/party/verb/party_leave()
	party/verb
		party_invite(mob/player/m in world)
			party.invite(m)
			m.verbs += new/mob/player/party/verb/party_requestInvite()
		party_remove(mob/player/m in party.members)
			party.members[m] = null
			m.party = null
		party_promote_to_leader(mob/player/m in party.members)
			var/mob/player/leader = party.leader
			leader.verbs += new/mob/player/party/verb/party_promote_to_leader()
			party.leader = m
			m.verbs += new/mob/player/party/verb/party_promote_to_leader()
		party_requestInvite(mob/player/m in world)
			var/acceptance = input(party.leader, "[src] requests [m] to join party", "yes", "no")
			if(acceptance == "yes")
				party.invite(m)
			else
				return
		party_leave()
			party.leader = party.members[2]
			src.verbs -= new/mob/player/party/verb/party_remove()
			src.verbs -= new/mob/player/party/verb/party_promote_to_leader()
			src.verbs -= new/mob/player/party/verb/party_leave()
			src.party = null




Party

	var/members[]
	var/mob/leader

	New(mob/player/_leader)
		leader = _leader
		members.Add(_leader)
	proc
		Add(mob/player/m)
			members.Add(m)
			m.party = src
	verb
		invite(mob/player/_player)
			if(!_player.party)
				Add(_player)
			else
				return "[_player] is already in a party. player needs to leave their party"