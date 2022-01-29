local module = {};

function module.run(str)
    return str:gsub("함수","function");
end

return module;