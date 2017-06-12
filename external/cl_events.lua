-- @Date:   2017-06-11T11:07:04+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-12T16:52:28+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_menuBuilder:Open')
AddEventHandler('ft_menuBuilder:Open', function(name)
  MenusManager:Open(name)
end)

RegisterNetEvent('ft_menuBuilder:Next')
AddEventHandler('ft_menuBuilder:Next', function(name)
  MenusManager:Next(name)
end)

RegisterNetEvent('ft_menuBuilder:Add')
AddEventHandler('ft_menuBuilder:Add', function(name, buttons, settings)
  MenusManager:Add(name, buttons, settings)
end)

RegisterNetEvent('ft_menuBuilder:Close')
AddEventHandler('ft_menuBuilder:Close', function()
  MenusManager:Close()
end)

RegisterNetEvent('ft_menuBuilder:IsOpened')
AddEventHandler('ft_menuBuilder:IsOpened', function(callback)
  callback(MenusManager.opened)
end)

RegisterNetEvent('ft_menuBuilder:Back')
AddEventHandler('ft_menuBuilder:Back', function()
  MenusManager:Back()
end)

RegisterNetEvent('ft_menuBuilder:Current')
AddEventHandler('ft_menuBuilder:Current', function(callback)
  callback(MenusManager.curent)
end)

RegisterNetEvent('ft_menuBuilder:Freeze')
AddEventHandler('ft_menuBuilder:Freeze', function(status)
  MenusManager:Freeze(status)
end)
