Config                            = {}
Config.DrawDistance               = 10
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- If set to true, you need esx_addonaccount, esx_billing and esx_society
Config.EnablePtCommand            = true
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false
Config.ResellPercentage           = 50
Config.Locale                     = 'en'

Config.Zones = {

  ShopEntering = {
    Pos   = { x = 1220.52, y = -1270.21, z = 34.99 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 27,
  },

  ShopInside = {
    Pos     = { x = 1206.00, y = -1265.73, z = 34.99 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 271.0,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = 1206.00, y = -1265.73, z = 34.99 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 271.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = 142.0, y = -3180.0, z = 5.0 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = 1206.00, y = -1265.73, z = 34.99 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = 1197.00, y = -1261.66, z = 34.99},
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 27,
  },

}
