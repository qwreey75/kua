local module = {};

function module.run(str)
    return str:gsub("이다","=");
end

return module;