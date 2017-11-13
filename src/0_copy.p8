function copy(o)
	local c

	if type(o) == 'table' then
		c = {}

		for k, v in pairs(o) do
			c[k] = copy(v)
		end
	else
		c = o
	end

	return c
end
