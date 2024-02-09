AddCSLuaFile()

SWEP.Author = "Bluker"
SWEP.Base = "weapon_base"
SWEP.PrintName = "Combine Keycard"
SWEP.ViewModel = "models/weapons/v_pistol.mdl" --temp model
SWEP.WorldModel = "models/weapons/v_pistol.mdl" --temp model
SWEP.DrawCrosshair = false 
SWEP.Spawnable = true

function SWEP:CanPrimaryAttack()
    return false
end

function SWEP:CanSecondaryAttack()
    return false
end
