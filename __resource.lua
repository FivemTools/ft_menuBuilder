-- @Author: samuelds
-- @Date:   2017-06-08T23:28:39+02:00
-- @Project: FiveM Tools
-- @Last modified by:
-- @Last modified time: 2017-06-11T13:44:32+02:00
-- @License: GNU General Public License v3.0

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Scripts
client_scripts {

  "cl_init.lua",
  "classes/cl_ui.lua",
  "classes/cl_menusManager.lua",
  "cl_showMenu.lua",

  -- Event / Exports
  "external/cl_export.lua",
  "external/cl_events.lua",
  "external/cl_generator.lua",

}

exports {

  "Add",
  "Open",
  "Close",
  "IsOpened",
  "Back",
  "Next",
  "Current",
  "Freeze",
  "MenuGenerator",

}
