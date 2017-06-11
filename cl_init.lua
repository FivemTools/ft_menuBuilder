-- @Date:   2017-06-11T13:10:15+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-11T13:12:11+02:00
-- @License: GNU General Public License v3.0


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Complet join this server
    if NetworkIsSessionStarted() then

      MenusManager = MenusManager()
      break

    end
  end
end)
