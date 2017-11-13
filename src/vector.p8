vec = {}
vec.x = 0
vec.y = 0

function vec:add(v)
	self.x += v.x
	self.y += v.y
end

function vec:subs(v)
	self.x -= v.x
	self.y -= v.y
end

function vec:mult(c)
	self.x *= c
	self.y *= c
end
