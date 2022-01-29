local module = {};

function module.run(str)
    return str:gsub("출력","print");
end

return module;