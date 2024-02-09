hook.Add("PlayerChangedTeam", "teams", function(ply,team2,team)

    if team == 1 then


    elseif team == 2 then
        ply:StripWeapons()
        ply:SetModel("models/daemon_alyx/players/male_citizen_10.mdl")
        ply:Give("weapon_fists")

    elseif team == 3 then

        net.Start("Resistanceteam")
        net.Send(ply)
    
    elseif team == 4 then
        ply:StripWeapons()
        
    end

end)