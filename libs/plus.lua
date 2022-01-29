local module = {};

function module.run(str)
    return str:gsub("더함","+"):gsub("더하다","+"):gsub("합하다","+"):gsub("합치다","+"):gsub("플러스","+");
end

return module;