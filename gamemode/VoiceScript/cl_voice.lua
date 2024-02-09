cVoice = 0

function getCVoiceStatus()
    return cVoice
end

hook.Add("PlayerStartVoice", "PanelKiller", function()
return true
end)

hook.Add( "PlayerButtonDown", "Combine Voice Channel open", function( ply, button )

	if button != KEY_M then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end    

    if ply:Team() != 1 then return end

    cVoice = 1

    if (isfunction(permissions.EnableVoiceChat)) then
        permissions.EnableVoiceChat( true )
    else
        RunConsoleCommand("+voicerecord")
    end

end)

hook.Add( "PlayerButtonUp", "Combine Voice Channel close", function( ply, button )

	if button != KEY_M then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end    

    if ply:Team() != 1 then return end

    cVoice = 0

    if (isfunction(permissions.EnableVoiceChat)) then
        permissions.EnableVoiceChat( false )
    else
        RunConsoleCommand("-voicerecord")
    end

end)