local module = {};

function module.run(str)
    return str:gsub("주석끝","]]");
end

return module;