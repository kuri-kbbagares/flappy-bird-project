stoneGround = Class{}

stoneGroundXPos = 0
stoneGroundMovement_SPEED = 90
stoneGroundLOOP_POS = 546
function stoneGround:init()
  self.image = love.graphics.newImage('sprites/ground.png')
  self.x = stoneGroundXPos
  self.y = VIRTUAL_HEIGHT_PUSH - 16
  self.dx = stoneGroundMovement_SPEED
end

function stoneGround:update(dt)
  self.x = (self.x + self.dx * dt) % stoneGroundLOOP_POS
end

function stoneGround:render()
  love.graphics.draw(self.image, -self.x, self.y)
end