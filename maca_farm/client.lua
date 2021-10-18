local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")
fromServer = Tunnel.getInterface("maca_farm")

local etapa = 1
local dict = 'amb@prop_human_parking_meter@female@idle_a'
local anim = 'idle_a_female'

---CDS-------------------------
-------------------------------

local farm = {
    [1] = vec3(88.54,-1367.22,29.31),
    [2] = vec3(93.98,-1373.51,29.35)
}

CreateThread(function()
    repeat
            local ped = PlayerPedId()
            local cds = GetEntityCoords(ped)
            local distance = #( farm[etapa] - cds )
             DrawMarker(22,farm[etapa].x,farm[etapa].y,farm[etapa].z,0,0,0,0, 180.0,130.0,0.5,0.3,0.5, 0,102,0,180 ,1,0,0,1)
             if distance < 2.9 then
               local click = IsControlJustPressed(0,38)
                if click then
                 vRP._playAnim(true,{{dict,anim}},false)
                 if fromServer.requestFarm() then
                 vRP._stopAnim(false)
                 somarEtapa()
                 end
                end
             end
        Wait(0)
    until false
end)

function somarEtapa()
    if etapa == #farm then
        etapa = 1
    else
        etapa = etapa + 1
    end
end