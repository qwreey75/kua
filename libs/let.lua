local module = {};

function module.run(str)
    return str:gsub("지역","local");
end

return module;