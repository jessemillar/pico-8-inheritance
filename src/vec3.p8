vec3 = copy(vec)
vec3.z = 0

function vec3:printz()
	printh("z: "..self.z)
end
