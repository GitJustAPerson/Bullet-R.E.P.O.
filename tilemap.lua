local tilemap = {}

function tilemap.generateTiles(tileFile)

    local tileInfo = {}

    local nextTile = {}
    
    local i = 1
    while true do
        local nextTileNumber = tileFile:read('n')

        if (not nextTileNumber) then break end

        table.insert(nextTile, tonumber(nextTileNumber))

        if i == 5 then table.insert(tileInfo, nextTile); nextTile = {} end

        i = i + 1

    end

    return tileInfo

end

function tilemap.drawTiles(tileInfo)
    for i, tile in ipairs(tileInfo) do

        local currentTile = tile
        
        if currentTile[1] == 0 then
            
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.rectangle('fill', currentTile[2], currentTile[3], currentTile[4], currentTile[5])

        elseif currentTile[1] == 1 then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.rectangle('fill', currentTile[2], currentTile[3], currentTile[4], currentTile[5])
        end
    end

end

return tilemap