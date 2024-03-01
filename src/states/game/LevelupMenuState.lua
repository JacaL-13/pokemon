--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelupMenuState = Class{__includes = BaseState}

function LevelupMenuState:init(def, onClose)
    self.battleState = def.battleState

	local currentStats = def.currentStats
	local statIncrease = def.statIncrease

	self.onClose = onClose

	local newStats = {
		['HP'] = currentStats.HP + statIncrease.HP,
		['attack'] = currentStats.attack + statIncrease.attack,
		['defense'] = currentStats.defense + statIncrease.defense,
		['speed'] = currentStats.speed + statIncrease.speed
	}
    
	local menuWidth = 200
	local menuHeight = 175
	
    self.levelupMenu = Menu {
        x = VIRTUAL_WIDTH - menuWidth,
        y = VIRTUAL_HEIGHT - menuHeight,
        width = menuWidth,
        height = menuHeight,
        items = {
			{
				text = 'HP: ' .. currentStats.HP .. ' + ' .. statIncrease.HP .. ' -> ' .. newStats.HP,
				-- onSelect = function()
				-- 	gStateStack:pop()
				-- end
			},
			{
				text = 'Attack: ' .. currentStats.attack .. ' + ' .. statIncrease.attack .. ' -> ' .. newStats.attack,
				-- onSelect = function()
				-- 	gStateStack:pop()
				-- end
			},
			{
				text = 'Defense: ' .. currentStats.defense .. ' + ' .. statIncrease.defense .. ' -> ' .. newStats.defense,
				-- onSelect = function()
				-- 	gStateStack:pop()
				-- end
			},
			{
				text = 'Speed: ' .. currentStats.speed .. ' + ' .. statIncrease.speed .. ' -> ' .. newStats.speed,
				-- onSelect = function()
				-- 	gStateStack:pop()
				-- end
			}
		},
		
		hasCursor = false
    }
end

function LevelupMenuState:update(dt)
    self.levelupMenu:update(dt)

	if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
		gStateStack:pop()
		self.onClose()
	end
end

function LevelupMenuState:render()
    self.levelupMenu:render()
end