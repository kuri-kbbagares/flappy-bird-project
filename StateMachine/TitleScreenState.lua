--[[
    Starting screen of the game.
    Will display "Press Enter" and the highest score.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    --
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fluffy Birb', 0, 64, VIRTUAL_WIDTH_PUSH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH_PUSH, 'center')
end
