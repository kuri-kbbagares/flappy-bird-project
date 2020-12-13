GAME_WIDTH = 1280
GAME_HEIGHT = 720

VIRTUAL_WIDTH_PUSH = 512
VIRTUAL_HEIGHT_PUSH = 288

Class = require 'class'
require 'StateMachine'
require 'StateMachine/BaseState'
require 'StateMachine/CountdownState'
require 'StateMachine/TitleScreenState'
require 'birb'

push = require 'push'
require 'backdrop'
require 'ground'


function love.load() 
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Fluffy Bird')
  push:setupScreen(VIRTUAL_WIDTH_PUSH, VIRTUAL_HEIGHT_PUSH , GAME_WIDTH, GAME_HEIGHT, {
      fullscreen = false,
      vsync = true,
      resizable = true
    })
  background = backDrop()
  ground = stoneGround()
  birb = Birb()
  
  gStateMachine = StateMachine {
      ['title'] = function() return TitleScreenState() end,
      ['countdown'] = function() return CountdownState() end,
      ['play'] = function() return PlayState() end,
      ['score'] = function() return ScoreState() end
  }
  gStateMachine:change('title')  
  
  love.keyboard.keysPressed = {}
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.update(dt)
  background:update(dt)
  ground:update(dt)
end

function love.draw()
push:start()
  
  background:render()
  ground:render()
  birb:render()
  
push:finish()
end
