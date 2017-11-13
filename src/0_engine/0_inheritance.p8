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
