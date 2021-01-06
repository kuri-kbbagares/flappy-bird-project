PipePair = Class {}

local GAP_HEIGHT = 90

function PipePair:init(y)
    self.x = VIRTUAL_WIDTH_PUSH + 32

    self.y = y

    self.pipes = {
        ['upper'] = brickPipe('top', self.y),
        ['lower'] = brickPipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

    self.remove = false
end

function PipePair:update(dt)

    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end

end

function PipePair:render()
    for l, pipe in pairs(self.pipes) do
        pipe:render()
    end
end
