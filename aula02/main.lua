-- Nome: GorutubaWars

require("jogador")
require("tiro")

debug = false

function love.load()
	Jogador:load()
	Tiro:load()
end

function love.update(dt)
	Jogador:update(dt)
	Tiro:update(dt)
end

function love.draw()
	Tiro:draw()
	Jogador:draw()
	
	if debug then
		love.graphics.print('Tiros: '..#Jogador.tiros)
	end	
end

function love.keypressed(tecla, codigo, repetida)
	if tecla == 'escape' then
		love.event.push('quit')
	elseif tecla == 'f8' then 
		debug = not debug
	end
end