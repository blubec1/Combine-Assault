DEFINE_BASECLASS("player_default")

local CSoldier = {}

CSoldier.DisplayName = "Combine Soldier"
CSoldier.WalkSpeed = 150
CSoldier.RunSpeed = 350
CSoldier.SlowWalkSpeed = 200
CSoldier.CrouchedWalkSpeed = 0.3
CSoldier.DuckSpeed = 0.35
CSoldier.UnDuckSpeed = 0.35
CSoldier.JumpPower = 150
CSoldier.CanUseFlashlight = true
CSoldier.MaxHealth = 100
CSoldier.MaxArmor = 25
CSoldier.StartHealth = 100
CSoldier.StartArmor = 25
CSoldier.DropWeaponOnDie = false
CSoldier.TeammateNoCollide = false
CSoldier.AvoidPlayers = false
CSoldier.UseVMHands = true

function CSoldier:Loadout()

    self.Player:Give("tfa_osips")
    self.Player:Give("weapon_fists")
    self.Player:Give("tfa_combeangren")
    self.Player:Give("tfa_combeangren")
    self.Player:Give("tfa_combeangren")
    self.Player:Give("weapon_medkit")
    self.Player:Give("weapon_stunstick")
    self.Player:Give("keycard")

end

function CSoldier:SetModel()

    self.Player:SetModel("models/jq/hlvr/characters/combine/grunt/combine_grunt_hlvr_player.mdl")

end

local CShotgunner = {}

CShotgunner.MaxHealth = 100
CShotgunner.MaxArmor = 100
CShotgunner.StartHealth = 100
CShotgunner.StartArmor = 100
CShotgunner.DisplayName = "Combine Shotgunner"
CShotgunner.WalkSpeed = 125
CShotgunner.SlowWalkSpeed = 50
CShotgunner.CrouchedWalkSpeed = 0.3
CShotgunner.RunSpeed = 275
CShotgunner.JumpPower = 125
CShotgunner.DuckSpeed = 0.4
CShotgunner.UnDuckSpeed = 0.4
CShotgunner.CanUseFlashlight = true
CShotgunner.DropWeaponOnDie = false
CShotgunner.TeammateNoCollide = false
CShotgunner.AvoidPlayers = false
CShotgunner.UseVMHands = true

function CShotgunner:Loadout()

    self.Player:Give("tfa_heavyshotgun")
    self.Player:Give("weapon_fists")
    self.Player:Give("weapon_stunstick")
    self.Player:Give("arc_medshot_1")
    self.Player:Give("arc_medshot_1")
    self.Player:Give("arc_medshot_1")
    self.Player:Give("arc_medshot_9")
    self.Player:Give("arc_medshot_16")


end

function CShotgunner:SetModel()

    self.Player:SetModel("models/hlvr/characters/combine/heavy/combine_heavy_hlvr_player.mdl")

end

local CSupressor = {}

CSupressor.DisplayName = "Combine Suppressor"
CSupressor.WalkSpeed = 100
CSupressor.RunSpeed = 275
CSupressor.SlowWalkSpeed = 50
CSupressor.CrouchedWalkSpeed = 0.3
CSupressor.DuckSpeed = 0.35
CSupressor.UnDuckSpeed = 0.35
CSupressor.JumpPower = 125
CSupressor.CanUseFlashlight = true
CSupressor.MaxHealth = 100
CSupressor.MaxArmor = 150
CSupressor.StartHealth = 100
CSupressor.StartArmor = 140
CSupressor.DropWeaponOnDie = false
CSupressor.TeammateNoCollide = false
CSupressor.AvoidPlayers = false
CSupressor.UseVMHands = true

function CSupressor:Loadout()

    self.Player:Give("tfa_suppressor")
    self.Player:Give("weapon_fists")
    self.Player:Give("weapon_stunstick")
    self.Player:Give("arc_medshot_2")
    self.Player:Give("arc_medshot_2")

end

function CSupressor:SetModel()

    self.Player:SetModel("models/hlvr/characters/combine/suppressor/combine_suppressor_hlvr_player.mdl")

end

local COrdinal = {}

COrdinal.DisplayName = "Combine Ordinal"
COrdinal.WalkSpeed = 150
COrdinal.RunSpeed = 350
COrdinal.SlowWalkSpeed = 75
COrdinal.CrouchedWalkSpeed = 0.3
COrdinal.DuckSpeed = 0.35
COrdinal.UnDuckSpeed = 0.35
COrdinal.JumpPower = 150
COrdinal.CanUseFlashlight = true
COrdinal.MaxHealth = 100
COrdinal.MaxArmor = 50
COrdinal.StartHealth = 100
COrdinal.StartArmor = 50
COrdinal.DropWeaponOnDie = false
COrdinal.TeammateNoCollide = false
COrdinal.AvoidPlayers = false
COrdinal.UseVMHands = true

function COrdinal:Loadout()

    self.Player:Give("tfa_ocipr")
    self.Player:Give("weapon_fists")
    self.Player:Give("weapon_stunstick")
    self.Player:Give("weapon_medkit")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_6")
    self.Player:Give("arc_medshot_0")
    self.Player:Give("arc_medshot_0")
    self.Player:Give("arc_medshot_0")
    self.Player:Give("arc_medshot_0")

end

function COrdinal:SetModel()

    self.Player:SetModel("models/hlvr/characters/combine_captain/combine_captain_hlvr_player.mdl")

end

local ResLeader = {}

ResLeader.DisplayName = "Resistance Leader"
ResLeader.WalkSpeed = 175
ResLeader.RunSpeed = 375
ResLeader.SlowWalkSpeed = 200
ResLeader.CrouchedWalkSpeed = 0.3
ResLeader.DuckSpeed = 0.3
ResLeader.UnDuckSpeed = 0.3
ResLeader.JumpPower = 150
ResLeader.CanUseFlashlight = false
ResLeader.MaxHealth = 100
ResLeader.MaxArmor = 0
ResLeader.StartHealth = 100
ResLeader.StartArmor = 0
ResLeader.DropWeaponOnDie = false
ResLeader.TeammateNoCollide = false
ResLeader.AvoidPlayers = false
ResLeader.UseVMHands = true

function ResLeader:Loadout()

    self.Player:Give("weapon_fists")
    self.Player:Give("arccw_ur_deagle")
    self.Player:Give("weapon_grab")
    self.Player:Give("arccw_ur_ak")
    self.Player:Give("arccw_ur_mp5")

end

function ResLeader:SetModel()

    self.Player:SetModel("models/daemon_alyx/players/male_citizen_10.mdl")

end

player_manager.RegisterClass("Combine Soldier", CSoldier, "player_default")
player_manager.RegisterClass("Resistance Leader", ResLeader, "player_default")
player_manager.RegisterClass("Combine Shotgunner", CShotgunner,"player_default")
player_manager.RegisterClass("Combine Suppressor", CSupressor, "player_default")
player_manager.RegisterClass("Combine Ordinal", COrdinal, "player_default")