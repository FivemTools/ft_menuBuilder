-- @Date:   2017-06-11T11:44:23+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-11T13:08:14+02:00
-- @License: GNU General Public License v3.0

function MenuGenerator(data)

  if type(data) == "table" then

    for menuName, menu in pairs(data) do

      MenusManager:Add(menuName, menu.buttons, menu.settings)

    end

  end

end
