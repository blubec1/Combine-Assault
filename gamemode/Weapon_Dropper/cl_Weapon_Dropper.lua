hook.Add( "PlayerButtonDown", "Weapon_Drop", function( ply, button )
	if button != KEY_G then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end

	if ply:GetActiveWeapon():GetClass() == "weapon_fists" then
		return
	end

	net.Start("Weapon_Drop")
	net.SendToServer()

end)