GAME_WIDTH = 1280
GAME_HEIGHT = 720

VIRTUAL_WIDTH_PUSH = 512
VIRTUAL_HEIGHT_PUSH = 288

Class = require 'class'

require 'StateMachine'
require 'StateMachine/BaseState'
require 'StateMachine/CountdownState'
require 'StateMachine/TitleScreenState'
require 'StateMachine/PlayState'
require 'StateMachine/ScoreState'

require 'birb'
require 'pipe'
require 'PipePair'
push = require 'push'
require 'backdrop'
require 'ground'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Fluffy Bird')
  
    smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
    hugeFont = love.graphics.newFont('flappy.ttf', 56)
    love.graphics.setFont(flappyFont)
  
    sounds = {
        ['jump'] = love.audio.newSource('jump.wav', 'static'),
        ['explosion'] = love.audio.newSource('explosion.wav', 'static'),
        ['hurt'] = love.audio.newSource('hurt.wav', 'static'),
        ['score'] = love.audio.newSource('score.wav', 'static'),

        ['music'] = love.audio.newSource('marios_way.mp3', 'static')
    }

    sounds['music']:setLooping(true)
    sounds['music']:play()

  push:setupScreen(VIRTUAL_WIDTH_PUSH, VIRTUAL_HEIGHT_PUSH , GAME_WIDTH, GAME_HEIGHT, {
      fullscreen = false,
      vsync = true,
      resizable = true
    })

  background = backDrop()
  ground = stoneGround()
  birb = Birb()
  pipe = brickPipe()
  
  gStateMachine = StateMachine {
      ['title'] = function() return TitleScreenState() end,
      ['countdown'] = function() return CountdownState() end,
      ['play'] = function() return PlayState() end,
      ['score'] = function() return ScoreState() end
  }

  gStateMachine:change('title')
  
  love.keyboard.keysPressed = {}

  love.mouse.buttonsPressed = {}
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true

  if key == 'escape' then
    love.event.quit()
  end
end

function love.mousepressed(x, y, button)
  love.mouse.buttonsPressed[button] = true
end

function love.mouse.wasPressed(button)
  return love.mouse.buttonsPressed[button]
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  background:update(dt)
  ground:update(dt)

  gStateMachine:update(dt)

  love.mouse.buttonsPressed = {}
  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()
  
  background:render()

  gStateMachine:render()

  ground:render()

  push:finish()
end
