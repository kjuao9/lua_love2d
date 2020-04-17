-- criando o Jogador e suas propriedades
Jogador = {} 

function Jogador:load()
    self.img        = love.graphics.newImage('assets/player.png')
    self.largura    = self.img:getWidth()
    self.altura     = self.img:getHeight()
    self.x          = love.graphics.getWidth()/2     
    self.y          = love.graphics.getHeight() * 0.8
    self.cx         = self.largura / 2
    self.cy         = self.altura  / 2
	self.vel        = 300 
	self.intervalo  = 0.3
	self.podeAtirar = 0 
	self.tiros      = {}
end

function Jogador:update(dt)

	if love.keyboard.isDown('left','a') then
		self.x = self.x - self.vel*dt
	elseif love.keyboard.isDown('right','d') then
		self.x = self.x + self.vel*dt
	end

	-- teste de borda da esquerda
	if self.x < self.largura / 2 then
		self.x = self.largura /2
	end	
	-- teste de borda da direita 
	if self.x > love.graphics.getWidth() - self.largura / 2 then
		self.x = love.graphics.getWidth() - self.largura / 2	
	end

	self.podeAtirar = self.podeAtirar - dt
	if  love.keyboard.isDown('space') and self.podeAtirar <= 0 then
		self.podeAtirar = self.intervalo
		self:fire()
	end	
end    

function Jogador:draw()
	love.graphics.draw(self.img,self.x,self.y,0,1,1,self.cx,self.cy)
end    

function Jogador:fire()
	table.insert(self.tiros, Tiro:create())
end	