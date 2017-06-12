-- @Date:   2017-06-11T09:33:07+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-12T15:39:34+02:00
-- @License: GNU General Public License v3.0

-- Constructor
MenusManager = {}
MenusManager.__index = MenusManager

-- Meta table for users
setmetatable(MenusManager, {

  __call = function(self)
    local p = {}
    p.opened = false
    p.backMenu = {}
    p.curent = nil
    p.list = {}
    p.selectedbutton = 0
    p.gameMenu = false
    p.freeze = false
    p.conf = {
      x = 0.9,
      y = 0.25,
      width = 0.2,
      height = 0.04,
      buttons = 10,
      from = 1,
      to = 10,
      backlock = false
    }
    return setmetatable(p, MenusManager)
  end

})

-- Check table size
function MenusManager:TableLength(T)

  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count

end

-- Reset Values
function MenusManager:Reset()
  Citizen.CreateThread(function()

    self.selectedbutton = 0
    self.conf.from = 1
    self.conf.to = 10
    self.freeze = false
    self.x = 0.9
    self.y = 0.25

  end)
end

-- Freeze menu
function MenusManager:Freeze(status)
  Citizen.CreateThread(function()

    MenusManager.freeze = status

  end)
end

-- Add new menu
function MenusManager:Add(name, buttons, settings)
  Citizen.CreateThread(function()

    if settings.top ~= nil and settings.top then
      settings.y = 0
      settings.top = nil
    end

    if settings.left ~= nil and settings.left then
      settings.x = 0 + (self.conf.width / 2)
      settings.horizontalPosition = nil
    elseif settings.center ~= nil and settings.center then
      settings.x = 0.9 / 2
      settings.horizontalPosition = nil
    end

    self.list[name] = {
      buttons = buttons,
      settings = settings,
    }

  end)
end

-- Next menu
function MenusManager:Next(name)
  Citizen.CreateThread(function()

    if self.curent ~= nil then
      local data = {
        name = self.curent,
        from = self.conf.from,
        to = self.conf.to,
        x = self.conf.x,
        y = self.conf.y,
        selectedbutton = self.selectedbutton,
      }
      table.insert(self.backMenu, data) -- Check if curent menu is backMenu

      MenusManager:Reset()
      self.curent = name
    else
      return
    end

  end)
end

-- Back last menu
function MenusManager:Back()
  Citizen.CreateThread(function()

    local backNumber = MenusManager:TableLength(self.backMenu)
    local data = self.backMenu[backNumber]

    -- Back menu
    if data.from ~= nil then
      self.conf.from = data.from
    end

    if data.to ~= nil then
      self.conf.to = data.to
    end

    if data.selectedbutton ~= nil then
      self.selectedbutton = data.selectedbutton
    end

    self.curent = data.name
    self.conf.freeze = false

    -- Remove menu
    table.remove(self.backMenu, backNumber)
    self.backMenu[backNumber] = nil

  end)
end

-- Open menu
function MenusManager:Open(name)
  Citizen.CreateThread(function()

    -- Check if menu is opened or not
    if self.opened then
      return
    end

    if self.list[name] ~= nil then
      self.opened = true
      self.curent = name
    else
      return
    end

  end)
end

-- Close Values
function MenusManager:Close()
  Citizen.CreateThread(function()

    self:Reset()
    self.backMenu = {}
    self.curent = nil
    self.opened = false
    self.conf.backlock = false

  end)
end

function MenusManager:BackBtn()
  Citizen.CreateThread(function()

    if self.conf.backlock then
      return
    end

    self.conf.backlock = true

    local name = self.curent
    local data = self.list[name]
    local settings = data.settings

    -- No closable manu for back button
    if settings.closable ~= nil and settings.closable == false then
      return
    end

    if settings.back ~= nil then
      local callback = settings.back
      callback()
    end

    local backNumber = MenusManager:TableLength(self.backMenu)
    if next(self.backMenu) and backNumber > 0 then
      self:Back()
    else
      self:Close()
    end

  end)
end

function MenusManager:Hover()
  Citizen.CreateThread(function()

    local selected = self.selectedbutton
    if selected ~= 0 then

      local curent = self.curent
      local menu = self.list[curent]
      local infos = menu.buttons[selected]

      if infos.hoverCallback ~= nil then
        local callback = infos.hoverCallback
        callback(infos.data)
      elseif infos.hoverEventServer ~= nil then
        TriggerServerEvent(infos.hoverEventServer, infos.data)
      elseif infos.hoverEventClient ~= nil then
        TriggerEvent(infos.hoverEventClient, infos.data)
      else
        return
      end

    end

  end)
end

function MenusManager:Exec()
  Citizen.CreateThread(function()

    local selected = self.selectedbutton
    if selected ~= 0 then

      local curent = self.curent
      local menu = self.list[curent]
      local infos = menu.buttons[selected]

      -- Execute function
      if infos.callback ~= nil then
        local callback = infos.callback
        callback(infos.data)
      end

      -- Send to server event
      if infos.eventServer ~= nil then
        TriggerServerEvent(infos.eventServer, infos.data)
      end

      -- Send to client event
      if infos.eventClient ~= nil then
        TriggerEvent(infos.eventClient, infos.data)
      end

      -- Go to next menu
      if infos.menu ~= nil and self.list[infos.menu] ~= nil then
        self:Next(infos.menu)
      end

      --
      if infos.freeze ~= nil and infos.freeze then
        self.freeze = infos.freeze
      elseif infos.close ~= nil and infos.close then
        self:Close()
      elseif infos.back ~= nil and infos.back then
        self:Back()
      end

    end

  end)
end

function MenusManager:Show()
  Citizen.CreateThread(function()

    -- Open game menu
    if IsPauseMenuActive() then
      self.gameMenu = true
    else
      self.gameMenu = false
    end

    if self.opened then

      local curent = self.curent
      local menu = self.list[curent]
      local settings = menu.settings
      local buttons = menu.buttons

      if buttons == nil then
        MenusManager:Close()
      end

      local countBtns = MenusManager:TableLength(buttons)

      -- Position
      local posX = settings.x or self.conf.x
      local posY = settings.y or self.conf.y

      local y = posY -- Position for buttonss
      local selected = false

      -- Big title
      if settings.title ~= nil then
        Ui.DrawText(settings.title, 1, 1, posX, posY, 1.0, 255, 255, 255, 255)
        y = y + 0.12
      end

      -- Top menu
      settings.count = self.selectedbutton .. "/" .. countBtns
      Ui.DrawMenuTitle(settings, posX, posY + 0.08, self.conf.width, self.conf.height)

      for i, button in pairs(buttons) do

        if i >= self.conf.from and i <= self.conf.to then
          if i == self.selectedbutton then
            selected = true
          else
            selected = false
          end

          Ui.DrawMenuButton(button, posX, y, self.conf.width, self.conf.height, selected)
          y = y + 0.04
        end
      end

      if not self.freeze then

        -- Up
        if IsControlJustPressed(2, 187) and GetLastInputMethod(2) and not self.gameMenu then
          if self.selectedbutton < countBtns then
            self.selectedbutton = self.selectedbutton + 1
            if countBtns > 10 and self.selectedbutton > self.conf.to then
              self.conf.to = self.conf.to + 1
              self.conf.from = self.conf.from + 1
            end
            MenusManager:Hover()
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
          end
        end

        -- Down
        if IsControlJustPressed(2, 188) and GetLastInputMethod(2) and not self.gameMenu then
          if self.selectedbutton > 1 then
            self.selectedbutton = self.selectedbutton - 1
            if countBtns > 10 and self.selectedbutton < self.conf.from then
              self.conf.from = self.conf.from - 1
              self.conf.to = self.conf.to - 1
            end
            MenusManager:Hover()
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
          end
        end

        -- Back
        if IsControlJustPressed(2, 177) and not IsControlJustPressed(2, 322) and not IsControlJustPressed(2, 24) and not IsControlJustPressed(0, 25) and GetLastInputMethod(2) and not self.gameMenu then
          self:BackBtn()
          PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end
        if IsControlJustPressed(2, 177) and not IsControlJustPressed(2, 322) and not IsControlJustPressed(2, 24) and not IsControlJustPressed(0, 25)  and GetLastInputMethod(2) and not self.gameMenu then
          self.conf.backlock = false
        end

        -- Enter
        if IsControlJustPressed(2, 201) and GetLastInputMethod(2) and not self.gameMenu then
          self:Exec()
          PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end

      end -- end ckeck freeze

    end

  end)
end
