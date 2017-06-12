-- @Date:   2017-06-11T10:24:37+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-12T15:33:39+02:00
-- @License: GNU General Public License v3.0

Ui = {}

Ui.DrawText = function (text, font, centre, x, y, scale, r, g, b, a)
  Citizen.CreateThread(function()

    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)

  end)
end

Ui.DrawMenuTitle = function(data, x, y, width, height)
  Citizen.CreateThread(function()

    -- Color
    local red = data.red or 93
    local green = data.green or 166
    local blue = data.blue or 202
    local alpha = data.alpha or 150

    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.4, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString(data.menuTitle)
    DrawRect(x, y, width, height, red, green, blue, alpha)
    DrawText(x - width / 2 + 0.005, y - height / 2 + 0.0028)

    Ui.DrawText(data.count, 0, 0, x + width / 2 - 0.0385, y - 0.015, 0.4, 255, 255, 255, 255)

  end)
end

Ui.DrawMenuButton = function(data, x, y, width, height, selected)
  Citizen.CreateThread(function()

    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.4, 0.4)
    if selected then
      SetTextColour(0, 0, 0, 255)
    else
      SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(data.text)

    if selected then
      DrawRect(x, y, width, height, 255, 255, 255, 255)
    else
      DrawRect(x, y, width, height, 0, 0, 0, 150)
    end

    DrawText(x - width / 2 + 0.005, y - height / 2 + 0.0035)

    if data.subText ~= nil then
      if selected then
        Ui.DrawText(data.subText, 0, 0, x + width / 2 - 0.0385, y - height / 2 + 0.0035, 0.4, 0, 0, 0, 255)
      else
        Ui.DrawText(data.subText, 0, 0, x + width / 2 - 0.0385, y - height / 2 + 0.0035, 0.4, 255, 255, 255, 255)
      end
    end

  end)
end
