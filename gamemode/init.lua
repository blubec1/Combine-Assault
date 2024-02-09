AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("Weapon_Dropper/cl_Weapon_Dropper.lua")
AddCSLuaFile("Round_Controller/cl_round_controller.lua")
AddCSLuaFile("classes.lua")
AddCSLuaFile("RecruitScript/Recruit_Countdown.lua")
AddCSLuaFile("RecruitScript/Recruit_Interface.lua")
AddCSLuaFile("RecruitScript/RecruitPopUp.lua")
AddCSLuaFile("Round_Controller/ReadyScript/cl_ready.lua")
AddCSLuaFile("VoiceScript/cl_voice.lua")

util.AddNetworkString("Weapon_Drop")
util.AddNetworkString("Dframe")
util.AddNetworkString("TeamChooser")
util.AddNetworkString("Countdown")
util.AddNetworkString("UpdateRoundStatus")
util.AddNetworkString("TeamWin")
util.AddNetworkString("Resistanceteam")
util.AddNetworkString("Convert")
util.AddNetworkString("incrementRCounter")
util.AddNetworkString("Removerag")
util.AddNetworkString("BodySwitch")
util.AddNetworkString("ReadyFrame")
util.AddNetworkString("RoundStart")
util.AddNetworkString("ReadyFrame")
util.AddNetworkString("ready")
util.AddNetworkString("classChooser")
util.AddNetworkString("classprompts")

include("shared.lua")
include("Teams/Teams.lua")
include("Round_Controller/round_controller.lua")
include("Countdown/Countdown.lua")
include("classes.lua")
include("ArmorSaint/Armor_Countdown.lua")
include("RecruitScript/Recruit_Countdown.lua")
include("Eye_Trace/Eye_Trace_Disguise.lua")
include("Round_Controller/ReadyScript/sv_ready.lua")
include("VoiceScript/sv_voice.lua")

team.SetUp(1, "combine", Color(0,255,0), true)
team.SetUp(2, "citizen", Color(0,0,255), true)
team.SetUp(3, "resistance", Color(255,0,0), true)
team.SetUp(4, "undecided", Color(0,0,0,0), true)

team.SetClass(1, {"Combine Soldier","Combine Shotgunner","Combine Suppressor","Combine Ordinal"})
team.SetClass(3, {"Resistance Leader"})

team.SetSpawnPoint(1, {"info_terror"})

RunConsoleCommand("sv_alltalk", 0)
-- ghosts can be heard, need more attention (fixed?)

playerNumb = 0

local entemp = ents.Create("prop_ragdoll")

endRound()

for _,p in ipairs(player.GetAll()) do

    playerNumb = playerNumb + 1

end

net.Receive("BodySwitch", function()

    local pos = net.ReadTable()
    entemp:SetModel("models/daemon_alyx/players/male_citizen_10.mdl")
    entemp:SetPos(pos)
    entemp:Activate()
    entemp:Spawn()

end)

net.Receive("Convert", function()

    local playernick

    playernick = net.ReadString()

    for _,p in ipairs(player.GetAll()) do

        if p:Nick() ==  playernick then

            p:SetTeam(3)

        end

    end

end)

net.Receive("Weapon_Drop", function(len ,ply)

ply:DropWeapon()

end)

// make the combine choose their classes after everyone chose their teams
// idea: make the combine have a different ready state when they are ready to choose their class
net.Receive("TeamChooser", function(len, ply)

    local teamid = net.ReadInt(4)

    if teamid == 1 then

        ply:SetTeam(1)

    else 
        
        ply:SetTeam(2)

    end

    playerReady(ply)

end)

function GM:PlayerInitialSpawn(ply)

    print("Player"..ply:Name().." has spawned.")
    ply:SetTeam(4)
    if getRoundStatus() == 0 then

        net.Start("Dframe")
        net.Send(ply)

    else 

        ply:Spectate(6)
        ply:SetObserverMode(6) 
        ply:Kill()
    
    end
    

end

--test by modifying gm_construct with a door and a button

function GM:PlayerUse(ply,ent)

    local tr = util.TraceHull( {
	    start = ply:GetShootPos(),
	    endpos = ply:GetShootPos() + (ply:GetAimVector() * 100),
        filter = function(ent) return(ent:GetClass() == "prop_dynamic")  end,
	    mins = Vector( -10, -10, -10 ),
	    maxs = Vector( 10, 10, 10 ),
    } )

    if ent:GetClass() == "func_button" &&  tr.Entity:GetModel() == "models/props_combine/combinebutton.mdl" then 

        if  ply:GetActiveWeapon():GetPrintName() != "Combine Keycard" then
        
            print("uidsgh")
            return false

        end

    end

end

--rewrite this so it uses ENT:Fire() and uses the input press, but first, need to lock the button in the map to recognize its a keycard reader


/*
function GM:AcceptInput(ent, input, activator, caller, value)

    if ent == "func_button" && activator:GetActiveWeapon() != "keycard" then
        return true
    end

end
*/



hook.Add("Think", "RoundStarter", function()

    if getRoundStatus() == 0 then

        if checkReadyState() then
        
            sendClassPrompts()

            print("uwu")

        timer.Create("RoundStarter", 15, 1, function() 
    
            beginRound()
    
        end)

        end

    end


end)

hook.Add( "PlayerNoClip", "NoNoClip", function() 

    return false;

end)

hook.Add("DoPlayerDeath", "Death", function(ply,at,dmginfo)

    ply:CreateRagdoll()
    SafeRemoveEntity(ply:GetRagdollEntity())

    local rag = ents.Create("prop_ragdoll")
    rag:SetPos(ply:GetPos())
    rag:SetModel(ply:GetModel())
    rag:SetSkin(ply:GetSkin())
    for key, value in pairs(ply:GetBodyGroups()) do
      rag:SetBodygroup(value.id, ply:GetBodygroup(value.id))	
    end
    rag:SetAngles(ply:GetAngles())
    rag:SetColor(ply:GetColor())

    rag:Spawn()
    rag:Activate()
    rag.player_ragdoll = true
    rag.sid = ply:SteamID()

       local num = rag:GetPhysicsObjectCount()-1
   local v = ply:GetVelocity()

   -- bullets have a lot of force, which feels better when shooting props,
   -- but makes bodies fly, so dampen that here
   if dmginfo:IsDamageType(DMG_BULLET) or dmginfo:IsDamageType(DMG_SLASH) then
      v = v / 5
   end

   for i=0, num do
      local bone = rag:GetPhysicsObjectNum(i)
      if IsValid(bone) then
         local bp, ba = ply:GetBonePosition(rag:TranslatePhysBoneToBone(i))
         if bp and ba then
            bone:SetPos(bp)
            bone:SetAngles(ba)
         end

         -- not sure if this will work:
         bone:SetVelocity(v)
      end
   end

    -- add GM:AcceptInput to make keycards work, but first make the swep


    for _,  wep in ipairs(ply:GetWeapons()) do

        local wepstr = tostring(wep)
        wepstr = string.sub(wepstr, string.find(wepstr,']')+2, string.len(wepstr)-1)
        local weapon = ents.Create(wepstr)
        weapon:SetPos(ply:GetPos())
        weapon:Spawn()

    end

end)

hook.Add("Think", "IHateRagdolls", function()

    game.RemoveRagdolls()

end)

hook.Add("PostPlayerDeath", "Spectator", function(ply)

    ply:CreateRagdoll()
    SafeRemoveEntity(ply:GetRagdollEntity())

    ply:Spectate(6)
    ply:SetObserverMode(6)

end)

hook.Add("PlayerDeathThink", "Respawn Nullifier", function(ply)

local resistance_counter = 0
local combine_counter = 0

if getRoundStatus() == 1 then

    for _,p in ipairs(player.GetAll()) do

        local ply_id
        local alive
        ply_id = p:Team()
        alive = p:Alive()

        if ply_id == 1 && alive == 1 then combine_counter = combine_counter + 1

            elseif ply_id == 3 && alive == 1 then resistance_counter = resistance_counter + 1

        end

    end



 
    if resistance_counter == 0 then 

        initCWin()

    elseif combine_counter == 0 then

        initRWin()

    end 

end

return 1
end)

concommand.Add("set_team1", function(ply)

    ply:SetTeam(1)

end)
concommand.Add("set_team2", function(ply)

    ply:SetTeam(2)

end)
concommand.Add("set_team3", function(ply)

    ply:SetTeam(3)

end)