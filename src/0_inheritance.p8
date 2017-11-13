function new(o, props)
	local n=copy(o)

	if props then
		merge(n,props)
	end

	return n
end

function copy(o)
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
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end

    return t1
end
