
CountdownState = Class{__includes = BaseState}

Countdown_Time = 0.75

function CountdownState:init()
    self.count = 3
    self.timer = 0
end

--[[
    When time goes to 0, PlayState will be executed
]]

function CountdownState:update(dt)
    self.timer = self.timer + dt

    if self.timer > Countdown_Time then
        self.timer = self.timer % Countdown_Time
        self.count = self.count - 1

        if self.count == 0 then
            gStateMachine:change('play')
        end
    end
end

function CountdownState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH_PUSH, 'center')
end
