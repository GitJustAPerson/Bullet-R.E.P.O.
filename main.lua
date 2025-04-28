local tilemap = require('tilemap')
local file = nil
local tiles = nil

function love.load()
    file = io.open('level.txt')
    tiles = tilemap.generateTiles(file)
    io.close(file)
    
    for i, v in ipairs(tiles) do
        print(v)
    end

end

function love.draw()
    tilemap.drawTiles(tiles)
end
