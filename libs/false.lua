local module = {};

function module.run(str)
    return str:gsub("거짓","false");
end

return module;