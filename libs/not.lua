local module = {};

function module.run(str)
    return str:gsub("아니다","not ");
end

return module;