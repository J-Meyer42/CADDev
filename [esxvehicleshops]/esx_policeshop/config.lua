Config                            = {}
Config.DrawDistance               = 10
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- If set to true, you need esx_addonaccount, esx_billing and esx_society
Config.EnablePvCommand            = true
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false
Config.ResellPercentage           = 50
Config.Locale                     = 'en'

Config.Zones = {

  ShopEntering2 = {
    Pos   = { x = 376.33, y = -945.32, z = -63.49 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 27,
  },

  ShopInside2 = {
    Pos     = { x = 449.31, y = -1020.52, z = 28.44 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = -20.0,
    Type    = -1,
  },

  ShopOutside2 = {
    Pos     = { x = 449.31, y = -1020.52, z = 28.44 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 90.0,
    Type    = -1,
  },

  BossActions2 = {
    Pos   = { x = -704.38391113281, y = -1287.1623535156, z = 4.0776014328003 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle2 = {
    Pos   = { x = 449.31, y = -1020.52, z = 28.44 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle2 = {
    Pos   = { x = -725.38537597656, y = -1327.8604736328, z = -0.47477427124977 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}
