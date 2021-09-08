
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1500 -- ms between each type for demonstration purpose

-- Create viewer
local viewer = View.create("viewer2D1")

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  viewer:clear()
  local img = Image.load('resources/BinarizeAdaptive.bmp')
  viewer:addImage(img)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Binarizing adaptively with local threshold 7, kernel size 11 and without inversion
  local img2 = img:binarizeAdaptive(7, 11, false)
  viewer:addImage(img2:invert()) -- Invert to preserve original image polarity
  viewer:present()
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
