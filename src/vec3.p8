vec3 = copy(vec)

vec3.z = 0
vec3.test = {a = 1, b = 2, c = 3}

function vec3:printz()
	printh("z: "..self.z)
end

function vec3:printtest()
	printh("vec3:printtest(): "..self.test.a.." "..self.test.b.." "..self.test.c)
end
