local module = {};

function module.run(str)
    return str:gsub("뺌","-"):gsub("빼다","-"):gsub("뺌하다","-"):gsub("뺄샘","-"):gsub("빼기","-"):gsub("마이너스","-");
end

return module;