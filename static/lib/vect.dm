vect2
	var
		x
		y

	New(x, y)
		src.x = x
		src.y = y

vect3
	var
		x
		y
		z

	New(x,y,z)
		src.x = x
		src.y = y
		src.z = z

//global constructor
proc
	vect2(x,y)	return new/vect2(x,y)
	vect3(x,y,z)	return new/vect3(x,y,z)

//global namespace object
var/vect2/vect2 = new
var/vect3/vect3 = new


//struct
vect2
	proc
		//add two vectors together
		Add(vect2/a, vect2/b)
			return vect2(a.x + b.x, a.y + b.y)
		//subtract vector b from vector a
		Subtract(vect2/a, vect2/b)
			return vect2(a.x - b.x, a.y - b.y)

		Multiply(vect2/a, vect2/b)
			return vect2(a.x * b.x, a.y * b.y)

		Divite(vect2/a, vect2/b)
			return vect2(a.x / b.x, a.y / b.y)

		Dot(vect2/a, vect2/b)
			return a.x * b.x + a.y * b.y

vect3
	proc
		//add two vectors together
		Add(vect3/a, vect3/b)
			return vect3(a.x + b.x, a.y + b.y, a.z + b.z)
		//subtract vector b from vector a
		Subtract(vect3/a, vect3/b)
			return vect3(a.x - b.x, a.y - b.y, a.z - b.z)

		Multiply(vect3/a, vect3/b)
			return vect3(a.x * b.x, a.y * b.y, a.z * b.z)

		Divite(vect3/a, vect3/b)
			return vect3(a.x / b.x, a.y / b.y, a.z / b.z)

		Dot(vect3/a, vect3/b)
			return a.x * b.x + a.y * b.y + a.z * b.z
