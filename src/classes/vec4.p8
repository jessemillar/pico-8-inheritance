vec4 = kind(vec3, {
	t = 0,
	test2 = {a = 4, b = 5, c = 6},
})

function vec4:printt()
	printh("t: "..self.t)
end

function vec4:printtest2()
	printh("vec4:printtest2(): "..self.test2.a.." "..self.test2.b.." "..self.test2.c)
end
