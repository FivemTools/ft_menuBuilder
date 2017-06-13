-- @Date:   2017-06-11T11:07:04+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T11:30:45+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_menuBuilder:ClOpen')
AddEventHandler('ft_menuBuilder:ClOpen', function(name)
  MenusManager:Open(name)
end)

RegisterNetEvent('ft_menuBuilder:ClNext')
AddEventHandler('ft_menuBuilder:ClNext', function(name)
  MenusManager:Next(name)
end)

RegisterNetEvent('ft_menuBuilder:ClAdd')
AddEventHandler('ft_menuBuilder:Add', function(name, buttons, settings)
  MenusManager:Add(name, buttons, settings)
end)

RegisterNetEvent('ft_menuBuilder:ClClose')
AddEventHandler('ft_menuBuilder:ClClose', function()
  MenusManager:Close()
end)

RegisterNetEvent('ft_menuBuilder:ClIsOpened')
AddEventHandler('ft_menuBuilder:ClIsOpened', function(callback)
  callback(MenusManager.opened)
end)

RegisterNetEvent('ft_menuBuilder:ClBack')
AddEventHandler('ft_menuBuilder:ClBack', function()
  MenusManager:Back()
end)

RegisterNetEvent('ft_menuBuilder:ClCurrent')
AddEventHandler('ft_menuBuilder:Current', function(callback)
  callback(MenusManager.curent)
end)

RegisterNetEvent('ft_menuBuilder:ClFreeze')
AddEventHandler('ft_menuBuilder:ClFreeze', function(status)
  MenusManager:Freeze(status)
end)
