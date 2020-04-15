-- criando o Jogador e suas propriedades
Jogador = {} 

function Jogador:load()
    self.img     = love.graphics.newImage('assets/player.png')
    self.largura = self.img:getWidth()
    self.altura  = self.img:getHeight()
    self.x       = love.graphics.getWidth()/2     
    self.y       = love.graphics.getHeight() * 0.8
    self.cx      = self.largura / 2
    self.cy      = self.altura  / 2
	self.vel     = 300  
	self.tiros   = {}
end

function Jogador:update(dt)

	if love.keyboard.isDown('left','a') then
		if self.x > 0 then 
			self.x = self.x - self.vel*dt
		end	
	elseif love.keyboard.isDown('right','d') then
		if self.x < 
			(love.graphics.getWidth() - 
			self.img:getWidth()) then
			self.x = self.x + self.vel*dt
		end	
    end
	
	if  love.keyboard.isDown('x') then
		self:fire()
	end	
end    

function Jogador:draw()
	love.graphics.draw(self.img,self.x,self.y,0,1,1,self.cx,self.cy)
end    

function Jogador:fire()
	table.insert(self.tiros, Tiro:create())
end	