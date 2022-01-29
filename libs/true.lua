local module = {};

function module.run(str)
    return str:gsub("참","true");
end

return module;