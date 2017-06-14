-- @Date:   2017-06-11T10:22:24+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T21:08:41+02:00
-- @License: GNU General Public License v3.0

Citizen.CreateThread(function()

  if NetworkIsSessionStarted() then

	  while true do
	    Citizen.Wait(5)

	    -- Open game menu
	    if not IsPauseMenuActive() then
	      Show()
	    end
	  end

  end

end)
