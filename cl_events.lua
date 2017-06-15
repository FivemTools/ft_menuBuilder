-- @Date:   2017-06-11T11:07:04+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-15T14:08:56+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_menuBuilder:ClOpen')
AddEventHandler('ft_menuBuilder:ClOpen', function(name)
  Open(name)
end)

RegisterNetEvent('ft_menuBuilder:ClNext')
AddEventHandler('ft_menuBuilder:ClNext', function(name)
  Next(name)
end)

RegisterNetEvent('ft_menuBuilder:ClAdd')
AddEventHandler('ft_menuBuilder:Add', function(name, buttons, settings)
  Add(name, buttons, settings)
end)

RegisterNetEvent('ft_menuBuilder:ClRemove')
AddEventHandler('ft_menuBuilder:ClRemove', function(name)
  Remove(name)
end)

RegisterNetEvent('ft_menuBuilder:ClAddButton')
AddEventHandler('ft_menuBuilder:ClAddButton', function(name, button)
  AddButton(name, button)
end)

RegisterNetEvent('ft_menuBuilder:ClAddCleanButton')
AddEventHandler('ft_menuBuilder:ClAddCleanButton', function(name)
  CleanButton(name, button)
end)

RegisterNetEvent('ft_menuBuilder:ClClose')
AddEventHandler('ft_menuBuilder:ClClose', function()
  Close()
end)

RegisterNetEvent('ft_menuBuilder:ClIsOpened')
AddEventHandler('ft_menuBuilder:ClIsOpened', function(callback)
  callback(menus.opened)
end)

RegisterNetEvent('ft_menuBuilder:ClBack')
AddEventHandler('ft_menuBuilder:ClBack', function()
  Back()
end)

RegisterNetEvent('ft_menuBuilder:ClCurrent')
AddEventHandler('ft_menuBuilder:Current', function(callback)
  callback(menus.curent)
end)

RegisterNetEvent('ft_menuBuilder:ClFreeze')
AddEventHandler('ft_menuBuilder:ClFreeze', function(status)
  Freeze(status)
end)

RegisterNetEvent('ft_menuBuilder:ClGenerator')
AddEventHandler('ft_menuBuilder:ClGenerator', function(data)
  Generator(data)
end)
