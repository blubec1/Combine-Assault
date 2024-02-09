ENT.Type = "anim"

ENT.PrintName = "crafter"
ENT.Spawnable = true

function ENT:SetupDataTables()

    self:NetworkVar("Int", 1, "MaterialAmount")

end
