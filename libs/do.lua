local module = {};

function module.run(str)
    return str:gsub("하다","do");
end

return module;