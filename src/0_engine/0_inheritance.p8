function kind(parent, child)
	printh("kind()")

	local k = copy(parent)

	merge(k, child)

	return k
end

function copy(o)
	printh("copy() "..type(o))

	local c

	-- copy the supplied entity
	if type(o) == "table" then
		c = {}

		for k, v in pairs(o) do
			c[k] = copy(v)
		end
	else
		-- handle single variable copies
		c = o
	end

	return c
end

function merge(t1, t2)
	printh("merge()")

	for k,v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
end
