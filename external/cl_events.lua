-- @Date:   2017-06-11T11:07:04+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-11T18:33:29+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_menuBuilder:Open')
AddEventHandler('ft_menuBuilder:Open', function(name)
  MenusManager:Open(name)
end)

RegisterNetEvent('ft_menuBuilder:Next', name)
AddEventHandler('ft_menuBuilder:Next', function()
  MenusManager:Next(name)
end)

RegisterNetEvent('ft_menuBuilder:Add', name, buttons, settings)
AddEventHandler('ft_menuBuilder:Add', function()
  MenusManager:Add(name, buttons, settings)
end)

RegisterNetEvent('ft_menuBuilder:Close')
AddEventHandler('ft_menuBuilder:Close', function()
  MenusManager:Close()
end)

RegisterNetEvent('ft_menuBuilder:IsOpened', callback)
AddEventHandler('ft_menuBuilder:IsOpened', function()
  callback(MenusManager.opened)
end)

RegisterNetEvent('ft_menuBuilder:Back')
AddEventHandler('ft_menuBuilder:Back', function()
  MenusManager:Back()
end)

RegisterNetEvent('ft_menuBuilder:Current', callback)
AddEventHandler('ft_menuBuilder:Current', function()
  callback(MenusManager.curent)
end)

RegisterNetEvent('ft_menuBuilder:Freeze')
AddEventHandler('ft_menuBuilder:Freeze', function(status)
  MenusManager:Freeze(status)
end)
