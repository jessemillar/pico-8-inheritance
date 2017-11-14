vec3 = kind(vec, {
	z = 0,
	test = {a = 1, b = 2, c = 3},
})

function vec3:printz()
	printh("z: "..self.z)
end

function vec3:printtest()
	printh("vec3:printtest(): "..self.test.a.." "..self.test.b.." "..self.test.c)
end
