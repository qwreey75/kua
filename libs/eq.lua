local module = {};

function module.run(str)
    return str:gsub("같다","==");
end

return module;