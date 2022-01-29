local module = {};

function module.run(str)
    return str:gsub("주석","--");
end

return module;