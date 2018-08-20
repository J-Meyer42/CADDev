# esx_truckshop
This was created to take advantage of esx_jbtruck_inventory.  Since commercial vehicles can't be sold in the normal vehicle shop due to thier size, I had to create a new version in a new location that can support it.

I did not create the code.  I only edited the esx_vehicleshop code to create the new shop.  This code, unlike other versions of vehicleshop that I've seen, doesn't interfere with the original esx_vehicleshop.

The personal truck menu can be opened with /pt (like the vehicle shop /pv command).

[REQUIREMENTS]

* Auto mode
  * No need to download another resource

* Player management (billing and boss actions)
  * esx_society => https://github.com/FXServer-ESX/fxserver-esx_society
  * esx_billing => https://github.com/FXServer-ESX/fxserver-esx_billing

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
```
git clone https://github.com/Chip-W/esx_truckshop
```
3) Import esx_truckshop.sql in your database

4) Add this in your server.cfg :

```
start esx_truckshop
```
5) If you want player management you have to set Config.EnablePlayerManagement to true in config.lua
