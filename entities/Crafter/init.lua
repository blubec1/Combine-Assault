AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("use")
util.AddNetworkString("spawn")
util.AddNetworkString("matupdate")
util.AddNetworkString("minus")

local interval = 1
local material = 0

function ENT:Initialize()

    self:SetModel("models/props_combine/combine_intmonitor003.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    
    self.timer = CurTime()
    timer.Create("mats", 1, 0, function()

        material = material + 1

    end)

end


function ENT:Use(activator)

    pos = self:GetPos()
    if activator:Team() != 1 then
        net.Start("use")
            net.WriteEntity(self)
        net.Send(activator)
    end

end

function ENT:Think()

    self:SetMaterialAmount(material)

end

hook.Add("PostCleanupMap", "mats reset", function()

    material = -2
    print("wtf")

end)

net.Receive("spawn", function()

    local spawned = net.ReadString()

    local spawn_entity = ents.Create(spawned)
    spawn_entity:SetPos(pos)
    spawn_entity:Spawn()

end)

net.Receive("minus", function()

    material = material - net.ReadInt(8)

end)


