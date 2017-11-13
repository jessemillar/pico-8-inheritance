function copy(o, props)
	local c

	if type(o) == 'table' then
		c = {}

		for k, v in pairs(o) do
			c[k] = copy(v)
		end
	else
		c = o
	end

	if props then
		for k,v in pairs(props) do
			c[k] = v
		end
	end

	return c
end
