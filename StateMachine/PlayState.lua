PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.bird = Birb()
    self.pipesTable = {}
    self.timer = 0

    self.limitY = -PIPE_HEIGHT + math.random(80) + 20
end

function PlayState:update(dt)

    self.timer = self.timer + dt

    if self.timer > 3 then
  
      local y = math.max(-PIPE_HEIGHT + 10,
            math.min(self.limitY + math.random(-20, 20), VIRTUAL_HEIGHT_PUSH - 90 - PIPE_HEIGHT))

      self.limitY = y
  
      table.insert(self.pipesTable, PipePair(y))
      self.timer = 0
    end
  
    birb:update(dt)
  
    for k, pair in pairs(self.pipesTable) do
      pair:update(dt)
  
      if pair.x < -PIPE_WIDTH then
        pair.remove = true
      end
    end
  
    for k, pair in pairs(self.pipesTable) do
      if pair.remove == true then
        table.remove(self.pipesTable, k)
      end
    end


    for k, pair in pairs(self.pipesTable) do
      for l, pipe in pairs(pair.pipes) do
        if self.bird:collides(pipe) then
          -- place the new ScoreState file here to process the collision
        end
      end
    end
    
end

function PlayState:render()
    for k, pair in pairs(self.pipesTable) do
        pair:render()
    end
end
