local module = {};

function module.run(str)
    return str:gsub("주석시작","--[[");
end

return module;