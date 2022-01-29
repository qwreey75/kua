local module = {};

function module.run(str)
	return str:gsub("그리고","and");
end

return module;