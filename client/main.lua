local QBCore = exports['qb-core']:GetCoreObject()
local deleteobj = false

RegisterNetEvent('qb-table:Createtable', function(spawnedObj)
  local ped = GetPlayerPed(PlayerId())
  local inveh = IsPedInAnyVehicle(ped)
if deleteobj == false and not inveh then
  FreezeEntityPosition(ped, true)
  TriggerEvent('animations:client:EmoteCommandStart', {"pickup"})
  Wait(300)
  FreezeEntityPosition(ped, false)
    local modelHash = Table.prop 
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
    local forward = GetEntityForwardVector(PlayerPedId())
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(modelHash, x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, modelHash)
    deleteobj = true
end
end)

RegisterNetEvent('qb-table:DeleteTable', function()
    local ped = GetPlayerPed(PlayerId())
    local selectedWeapon = GetSelectedPedWeapon(ped)
    if selectedWeapon ~= GetHashKey("weapon_unarmed") then
        for a = 1, #Table.blacklistweapons do
            if selectedWeapon == GetHashKey(Table.blacklistweapons[a]) then
                QBCore.Functions.Notify('You Can`t Work With One Hand !', 'error', 7500) -- kareem dacca code enjoy fuckers
            end
        end
      elseif deleteobj == true then
      local obj = QBCore.Functions.GetClosestObject(spawnedObj)
      DeleteObject(obj)
      QBCore.Functions.Notify('Table In Your Bag', 'success', 7500)
      deleteobj = false
    end
end)


RegisterNetEvent('qb-table:MakeCoke', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
  local ped = GetPlayerPed(PlayerId())
	local time = math.random(7,10)
	local circles = math.random(2,4)
	local success = exports['qb-lock']:StartLockPickCircle(circles, time, success)
	if success then
    ClearPedTasks(ped)
    print('add code here you dump fuck')
    print('send nudes here plz daccakareem#7672')
	else
    print('add code here you dump fuck')
    ClearPedTasks(ped)
	end
end)


RegisterNetEvent('qb-table:cokemenu', function()
  exports['qb-menu']:openMenu({
		{
			header = "Coke Table",
			txt = "Coke Bag",
        params = {
				event = "qb-table:MakeCoke",
			}
		},
		{
			header = "exit",
			txt = "",
			params = {
				event = "",
			}
		},
	})
end)

Citizen.CreateThread(function()
Wait(200)
local models = {
  Table.prop,
  }
  exports['qb-target']:AddTargetModel(models, {
    options = {
      {
        num = 1,
        type = "client",
        event = "qb-table:DeleteTable",
        icon = 'fas fa-hand',
        label = 'put in',
      },
      {
        num = 2,
        type = "client",
        event = "qb-table:cokemenu",
        icon = 'fas fa-cannabis',
        label = 'Make Goods',
      },
    },
    distance = 1.5,
  })
end)