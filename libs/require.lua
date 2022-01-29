local module = {};

function module.run(str)
	return str:gsub("요구하다","require")
		:gsub("불러오기","require")
		:gsub("요구하기","require")
		:gsub("불러오다","require");
end

return module;