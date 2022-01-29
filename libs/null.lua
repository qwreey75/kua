local module = {};

function module.run(str)
    return str:gsub("빈","nil");
end

return module;