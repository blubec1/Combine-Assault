
rstate = {}

for i = 0, game.MaxPlayers() do

    rstate[i] = 0

end

function playerReady( ply )

    rstate[ply:EntIndex()] = 1

    net.Start("ReadyFrame")
        net.WriteTable(rstate)
    net.Send(ply)


end

net.Receive("ready", function()

    local ply = net.ReadEntity()

    rstate[ply:EntIndex()] = 2

    if not checkReadyState() then

        for _,p in ipairs(player.GetAll()) do

            net.Start("ReadyFrame")
                net.WriteTable(rstate)
            net.Send(p)

        end

    end

end)

net.Receive("classChooser", function()

    local numb = net.ReadInt(8)
    local ply = net.ReadEntity()

    if numb == 1 then

    player_manager.SetPlayerClass(ply, "Combine Soldier")

    elseif numb  == 2 then

    player_manager.SetPlayerClass(ply, "Combine Shotgunner")

    elseif numb == 3 then

    player_manager.SetPlayerClass(ply, "Combine Suppressor")

    elseif numb == 4 then

    player_manager.SetPlayerClass(ply, "Combine Ordinal")

    elseif numb == 11 then

    player_manager.SetPlayerClass(ply, "Resistance Leader")

    end

end)


function checkReadyState()

    local ok
    
    ok = 0

    for _,r in ipairs(player.GetAll()) do

        ok = 1

        if rstate[_] != 2 then 

            return false

        end

    end

    if ok == 0 then return false 

    else return true

    end
    

end

function sendClassPrompts()

    local randid = math.random(1, team.NumPlayers(2))
    print(team.NumPlayers(2))
    for _,p in ipairs(team.GetPlayers(2)) do
        if _ == randid then
            p:SetTeam(3)
            
        end
    end

    net.Start("classprompts")

    for _,p in ipairs(player.GetAll()) do

        if p:Team() == 1  or p:Team() == 3 then 
            


            rstate[_] = 3
            -- test this

            net.Send(p)

        end            

    end

end

function resetReadyState()

    for i = 0, game.MaxPlayers() do

        rstate[i] = 0

    end

end