local module = {};

function module.run(str)
    return str:gsub("만약","if");
end

return module;