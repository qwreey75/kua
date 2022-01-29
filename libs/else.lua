local module = {};

function module.run(str)
    return str:gsub("아니면","else");
end

return module;