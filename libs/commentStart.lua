local module = {};

function module.run(str)
    return str:gsub("μ£Όμμμ","--[[");
end

return module;