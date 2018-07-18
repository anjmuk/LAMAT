--[[
function onCreated()
  topBar = CreateImage("GLOBAL/pixel.png", 200, 0, 250, 50)
  topBar:setColor(56,56,56,255)
  loginButton = makeButton("login", 200, 0, 100, 50)
  reportButton = makeButton("new_problem", 300, 0, 100, 50)

end

function onButtonPressed(button)
  if button == loginButton then
    window = script:getValue("window", "Scripts/login.lua")
    window:show()
  end
end

function makeButton(imgName, x, y, w, h)
  newButton = CreateButton("", x, y, w, h)
  newButton:setImage("UI/" .. imgName .. ".png")
  newButton:setScaleImage(true) 
  return newButton
end
--]]