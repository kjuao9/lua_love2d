Tiro = {}

function Tiro:load()
    self.img = love.graphics.newImage("assets/laserGreen.png")
end    

function Tiro:create()
    local tiro   = {}
    tiro.img     = self.img
    tiro.largura = tiro.img:getWidth()
    tiro.altura  = tiro.img:getHeight()
    tiro.x       = Jogador.x     
    tiro.y       = Jogador.y
    tiro.cx      = tiro.largura / 2
    tiro.cy      = tiro.altura  / 2
    tiro.vel     = 1000  
    return tiro
end    

function Tiro:update(dt)
    for i, t in ipairs(Jogador.tiros) do
        t.y = t.y - t.vel * dt
        if t.y < 0 then
            table.remove(Jogador.tiros,i)
        end    
    end
end    

function Tiro:draw()
    for i, t in ipairs(Jogador.tiros) do
        love.graphics.draw(t.img,t.x,t.y,0,1,1,t.cx,t.cy)
    end    
end    