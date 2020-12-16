brickPipe = Class{}

function brickPipe:init()
  self.image = love.graphics.newImage('sprites/brick.png')
  self.x = (VIRTUAL_WIDTH_PUSH / 2) * .5
  self.y = (VIRTUAL_HEIGHT_PUSH / 2) * .5
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  
end

function brickPipe:render()
  love.graphics.draw(self.image, self.x, self.y)
end
