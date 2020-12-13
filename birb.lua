Birb = Class {}

function Birb:init()
  self.image = love.graphics.newImage('sprites/birb.png')
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = VIRTUAL_WIDTH_PUSH / 2 - (self.width / 2)
  self.y = VIRTUAL_HEIGHT_PUSH / 2 - (self.height / 2)
  
end

function Birb:render()
  love.graphics.draw(self.image, self.x, self.y)
end