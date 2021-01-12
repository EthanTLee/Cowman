function spairs(t,order)
    local keys = {}
    for k in pairs(t) do 
        keys[#keys+1] = k
    end
    
    table.sort(keys, function(a,b) return order(t,a,b) end)

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end








