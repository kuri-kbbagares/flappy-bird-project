Birb = Class {}

local GRAVITY = 20

function Birb:init()
  self.image = love.graphics.newImage('sprites/birb.png')
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = VIRTUAL_WIDTH_PUSH / 2 - (self.width / 2)
  self.y = VIRTUAL_HEIGHT_PUSH / 2 - (self.height / 2)

  self.dy = 0
end

function Birb:update(dt)
  if self.y > VIRTUAL_HEIGHT_PUSH - 40 then
    self.dy = 0
    self.y = VIRTUAL_HEIGHT_PUSH - 40
  else
    self.dy = self.dy + GRAVITY * dt
  end 

  if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then
    self.dy = -5
  end

  self.y = self.y + self.dy

end

function Birb:render()
  love.graphics.draw(self.image, self.x, self.y)
end