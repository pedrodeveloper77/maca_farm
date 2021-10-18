local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local farms = {}
Tunnel.bindInterface("maca_farm",farms)

---VARIÁVEIS-------------------------
-------------------------------
local perm = 'admin.permissao'
local time = 5000
local item = 'folhamaconha'
local quantidade = 5

---FUNCTIONS-------------------------
-------------------------------
function farms.requestFarm()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,perm) then
        vRP.blockCommands(user_id, 5)
        Wait(time)
        TriggerClientEvent("Notify",source,"sucesso","Você recebeu x"..quantidade..' '..vRP.getItemName(item), 5)
        vRP.giveInventoryItem(user_id,item,quantidade)
        return true
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão.", 5)
    end
        return false
end

function farms.blockCommands(segundos)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.blockCommands(user_id, segundos)
	end
end