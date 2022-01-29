local module = {};

function module.run(str)
    return str:gsub("또는","or");
end

return module;