
local round_status = 2

function endRound()

    round_status = 0
    updateClientRoundStatus()
    for _, p in ipairs(player.GetAll()) do

        p:Kill()
        p:SetTeam(4)
        player_manager.ClearPlayerClass(p)
        net.Start("Dframe")
        net.Send(p)
        game.CleanUpMap()

    end

end

function getRoundStatus()

    return round_status

end

function updateClientRoundStatus()

    net.Start("UpdateRoundStatus")
        net.WriteInt(round_status,4)
    net.Broadcast()

end

function beginRound()
    
    round_status = 1
    updateClientRoundStatus()
    initArmorCountDown()
    initRCountdown()


    for _, p in ipairs(player.GetAll()) do
        p:Kill()
        p:Spawn()
    
    end

    game.CleanUpMap()
    net.Start("RoundStart")
    net.Broadcast()
    resetReadyState()

end

function beginLobbyPhase()

    round_status = 2
    updateClientRoundStatus()

end

function initCWin()

    net.Start("TeamWin")
        net.WriteInt(1,4)
    net.Broadcast()
    initCountdown()
    beginLobbyPhase()
    print("Combine Win")

end

function initRWin()

    net.Start("TeamWin")
        net.WriteInt(2,4)
    net.Broadcast()
    initCountdown()
    beginLobbyPhase()
    print("Resistance win")

end











