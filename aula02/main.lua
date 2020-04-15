-- Nome: GorutubaWars

require("jogador")
require("tiro")

function love.load()
	Jogador:load()
	Tiro:load()
end

function love.update(dt)

	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	Jogador:update(dt)
	Tiro:update(dt)

end

function love.draw()
	Jogador:draw()
	Tiro:draw()
end 
