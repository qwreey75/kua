local module = {};

function module.run(str)
    return str:gsub("다르다","~=");
end

return module;