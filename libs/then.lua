local module = {};

function module.run(str)
    return str:gsub("이라면","then"):gsub("라면","then");
end

return module;