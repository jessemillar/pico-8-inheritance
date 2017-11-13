function _init()
	a = copy(vec)
	b = copy(vec)
	a.x = 1
	a.y = 2
	b.x = 3
	b.y = -1

	printh("a: "..a.x.." "..a.y)
	printh("b: "..b.x.." "..b.y)

	c = copy(vec3)
	c.z=3

	printh("c: "..c.x.." "..c.y.." "..c.z)
end
