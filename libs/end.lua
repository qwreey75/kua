local module = {};

function module.run(str)
    return str:gsub("끝","end");
end

return module;