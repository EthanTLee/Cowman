function printTable(table)
    for index, data in ipairs(table) do
        print(index)
        for key, value in pairs(data) do
            print('\t', key, value)
        end
    end
end