backDrop = Class{}

backgroundXPos = 0
backgroundMovement_SPEED = 30
backgroundLOOP_POS = 413

function backDrop:init()
  self.image = love.graphics.newImage('sprites/background.png')
  self.x = backgroundXPos
  self.y = 0
  self.dx = backgroundMovement_SPEED
end

function backDrop:update(dt)
  self.x = (self.x + self.dx * dt) % backgroundLOOP_POS
end

function backDrop:render()
  love.graphics.draw(self.image, -self.x, self.y)
end