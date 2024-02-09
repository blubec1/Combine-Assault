ok = 0

hook.Add("PlayerStartVoice" , "Start" , function(ply)

	if ply:Team() == 1 then 

		surface.PlaySound("open.mp3")

	end

end)


hook.Add("PlayerEndVoice" , "Stop" , function(ply)

if ply:Team() == 1 then 

	surface.PlaySound("close.mp3")

end

function GM:PlayerCanHearPlayersVoice(list, talk)

    if not talk:Alive() then

        return false

    end

    --Test it
    if list:Team() == talk:Team() and talk:getCVoiceStatus() then
        return true,false
    end

    return true,true

end


end)

