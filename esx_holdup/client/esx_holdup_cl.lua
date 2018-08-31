local holdingup = false
local store = ""
local secondsRemaining = 0
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyrobbing')
AddEventHandler('esx_holdup:currentlyrobbing', function(robb, robberyTimer)
	holdingup = true
	store = robb
	secondsRemaining = robberyTimer
end)

RegisterNetEvent('esx_holdup:killblip')
AddEventHandler('esx_holdup:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setblip')
AddEventHandler('esx_holdup:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:toofarlocal')
AddEventHandler('esx_holdup:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)


RegisterNetEvent('esx_holdup:robberycomplete')
AddEventHandler('esx_holdup:robberycomplete', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled') .. Stores[store].reward)
	store = ""
	secondsRemaining = 0
	incircle = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

local weapons = {"WEAPON_PISTOL","WEAPON_BULLPUPRIFLE","WEAPON_ASSAULTSHOTGUN","WEAPON_MACHETE",
"WEAPON_DAGGER","WEAPON_SWITCHBLADE","WEAPON_MARKSMANRIFLE","WEAPON_MICROSMG","WEAPON_PUMPSHOTGUN",
"WEAPON_BULLPUPSHOTGUN","WEAPON_ASSAULTRIFLE","WEAPON_SPECIALCARBINE","WEAPON_HEAVYPISTOL","WEAPON_GUSENBERG",
"WEAPON_COMBATPDW","WEAPON_CARBINERIFLE","WEAPON_VINTAGEPISTOL","WEAPON_DBSHOTGUN","WEAPON_COMBATPISTOL",
"WEAPON_PISTOL50","WEAPON_SNSPISTOL","WEAPON_REVOLVER","WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_CROWBAR",
"WEAPON_WRENCH","WEAPON_GOLFCLUB","WEAPON_MACHINEPISTOL","WEAPON_BATTLEAXE","WEAPON_COMPACTRIFLE",
}


Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) then
						if CheckWeapon(ped) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofstore)
							else
							DisplayHelpText(_U('need_a_weapon'))
						end
						incircle = true
						if IsControlJustReleased(1, 51) and CheckWeapon(ped) then
						---Coords to streetname conversion for SauceCAD:
							local var, var2   = GetStreetNameAtCoord(pos2.x, pos2.y, pos2.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
							local location    = tostring(GetStreetNameFromHashKey(var)) .. ", " .. tostring(GetStreetNameFromHashKey(var2))
							TriggerServerEvent('esx_holdup:rob', k, location) --Make sure to add location to the event if you want it to passthrough to the CAD/MDT. 
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then

			drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)

			local pos2 = Stores[store].position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
				TriggerServerEvent('esx_holdup:toofar', store)
			end
		end

		Citizen.Wait(0)
	end
end)

local ped = PlayerPedId()

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end