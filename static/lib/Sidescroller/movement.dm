var
	cost
		STANDING = "standing"
		MOVING= "moving"
		CLIMBING = "climbing"
		JUMPING = "jumping"

		RIGHT = EAST
		LEFT = WEST

mob
	icon_state = "mob"

	var
		on_left = 0
		on_right = 0
		on_ceiling = 0
		on_ground = 0
		on_ladder = 0

		base_state = ""

		accel = 1
		decel = 1
		gravity = 1

		