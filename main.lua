GAME_WIDTH = 1280
GAME_HEIGHT = 720

VIRTUAL_WIDTH_PUSH = 512
VIRTUAL_HEIGHT_PUSH = 288

Class = require 'class'
push = require 'push'
require 'backdrop'


function love.load() 
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Dame! Ikuu ikuu')
  push:setupScreen(VIRTUAL_WIDTH_PUSH, VIRTUAL_HEIGHT_PUSH , GAME_WIDTH, GAME_HEIGHT, {
      fullscreen = false,
      vsync = true,
      resizable = true
    })
  background = backDrop()
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.update(dt)
  background:update(dt)
end

function love.draw()
push:start()
  
  background:render()
  
push:finish()
end