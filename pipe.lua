brickPipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('sprites/brick.png')
PIPE_SPEED = 60
PIPE_HEIGHT = 288
PIPE_WIDTH = 70

function brickPipe:init(orientation, y)
  self.x = VIRTUAL_WIDTH_PUSH
  self.y = y

  self.width = PIPE_WIDTH
  self.height = PIPE_HEIGHT

  self.orientation = orientation
  
end

function brickPipe:update(dt)
end

function brickPipe:render()
  love.graphics.draw(PIPE_IMAGE, self.x,
    (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y),
    0, 1, self.orientation == 'top' and -1 or 1)
end
