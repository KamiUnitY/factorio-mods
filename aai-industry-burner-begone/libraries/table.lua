local function _table_clone(t)
	local clone = {}

	for key, value in pairs(t) do
		if value == t then
			clone[key] = clone
		elseif type(value) == "table" then
			clone[key] = _table_clone(value)
		else
			clone[key] = value
		end
	end

	return clone
end

local table = _table_clone(table)
local pairs, next, type = pairs, next, type

table.clone = function (t)
	local clone = _table_clone(t)

	return clone
end

table.contains = function (t, element)
	for _, value in pairs(t) do
		if value == element then
			return true
		end
	end

	return false
end

return table
