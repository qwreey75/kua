local module = {};

function module.run(str)
    return str:gsub("연결",".."):gsub("연결하다","..");
end

return module;