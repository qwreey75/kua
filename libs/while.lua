local module = {};

function module.run(str)
    return str:gsub("동안","while");
end

return module;