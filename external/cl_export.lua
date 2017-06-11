-- @Date:   2017-06-11T10:42:23+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-11T10:43:43+02:00
-- @License: GNU General Public License v3.0

function Open(name)
 return MenusManager:Open(name)
end

function Next(name)
  return MenusManager:Next(name)
end

function Add(name, buttons, options)
  MenusManager:Add(name, buttons, options)
end

function Close()
  MenusManager:Close()
end

function IsOpened()
  return MenusManager.opened
end

function Back()
  return MenusManager:Back()
end

function Current()
  return MenusManager.curent
end

function Freeze()
  return MenusManager:Freeze()
end
