-- Nome: GorutubaWars

-- criando o Jogador e suas propriedades
jogador     = {}    
jogador.img = nil     
jogador.x   = 0    -- eixo horizontal 
jogador.y   = 450  -- eixo vertical
jogador.vel = 300  -- velocidade de movimentação

-- função é chamada quando o jogo é carregado
-- isso ocorre uma unica vez
function love.load()
	-- Carregar a imagem que estava como nil
	jogador.img = love.graphics.newImage('assets/player.png')
end

-- função executada a cada frame do jogo
-- nela colocamos toda a lógica do jogo  
function love.update(dt)

	-- verifica se a tecla esc foi precionada
	if love.keyboard.isDown('escape') then
		-- fecha a tela do jogo
		love.event.push('quit')
	end

	-- verifica de a seta pra esquerda ou a letra 'a' 
	-- foram digitadas
	if love.keyboard.isDown('left','a') then
		-- verifica se o jogador não esta no limite
		-- da tela no lado esquerdo
		if jogador.x > 0 then 
			-- atualiza a posição do jogador 
			-- diminuindo sua posição no eixo x
			jogador.x = jogador.x - jogador.vel*dt
		end	

	-- se a condição anterior for falsa
	-- verifica de a seta pra direira ou a letra 'd' 
	-- foram digitadas
	elseif love.keyboard.isDown('right','d') then
		-- verifica se o jogador não esta no limite
		-- da tela no lado direito
		-- nesse caso tem que subtrarir a largura do jogador
		if jogador.x < 
			(love.graphics.getWidth() - 
			jogador.img:getWidth()) then
			-- atualiza a posição do jogador 
			-- aumentando sua posição no eixo x
			jogador.x = jogador.x + jogador.vel*dt
		end	
	end

end

-- função chamada após a love.update
-- nela determinamos o que será desenhado na tela
function love.draw()
	-- desenha a imagem na tela
	love.graphics.draw(jogador.img,jogador.x,jogador.y)
end 
