vec3 = copy(vec, {
	z = 0,
})

function vec3:printz()
	printh("z: "..self.z)
end
