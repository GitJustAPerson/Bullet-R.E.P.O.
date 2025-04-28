local tilemap = require('tilemap')
local file = nil
local tiles = nil

function love.load(arg, uArg)

    love.window.setTitle('Bullet-R.E.P.O.')

    file = io.open(uArg[2] or 'level.txt')
    tiles = tilemap.generateTiles(file)
    io.close(file)

end

function love.draw()
    tilemap.drawTiles(tiles)
end
