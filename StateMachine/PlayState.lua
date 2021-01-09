PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.bird = Birb()
    self.pipesTable = {}
    self.timer = 0
    self.score = 0
    
    self.limitY = -PIPE_HEIGHT + math.random(80) + 20
end

function PlayState:update(dt)

    self.timer = self.timer + dt

    if self.timer > 2 then
  
      local y = math.max(-PIPE_HEIGHT + 10,
            math.min(self.limitY + math.random(-20, 20), VIRTUAL_HEIGHT_PUSH - 90 - PIPE_HEIGHT))

      self.limitY = y
  
      table.insert(self.pipesTable, PipePair(y))
      self.timer = 0
    end
    for k, pair in pairs(self.pipesTable) do
        if not pair.scored then
            if pair.x + PIPE_WIDTH < self.bird.x then
                self.score = self.score + 1
                pair.scored = true
                sounds['score']:play()
            end
        end
        pair:update(dt)
    end

    for k, pair in pairs(self.pipesTable) do
        if pair.remove then
            table.remove(self.pipesTable, k)
        end
    end

    for k, pair in pairs(self.pipesTable) do
        for l, pipe in pairs(pair.pipes) do
            if self.bird:collides(pipe) then
                sounds['explosion']:play()
                sounds['hurt']:play()

                gStateMachine:change('score', {
                    score = self.score
                })
            end
        end
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
          sounds['explosion']:play()
                sounds['hurt']:play()

                gStateMachine:change('score', {
                    score = self.score
                })
        end
      end
    end
    
   self.bird:update(dt)

    if self.bird.y > VIRTUAL_HEIGHT_PUSH - 40 then
        sounds['explosion']:play()
        sounds['hurt']:play()

        gStateMachine:change('score', {
            score = self.score
        })
    end   
end

function PlayState:render()
    for k, pair in pairs(self.pipesTable) do
        pair:render()
    end
    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:render()
end

function PlayState:enter()  
    scrolling = true
end

function PlayState:exit()
    scrolling = false
end
