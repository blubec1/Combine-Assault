
local RecruitCounter = 0
local pos = 0
local ok = true
local w = ScrW() 
local h = ScrH()

net.Receive("incrementRCounter", function() 

RecruitCounter = RecruitCounter + 1

end)

hook.Add( "PlayerButtonDown", "Recruit_Interface", function( ply, button )
	if button != KEY_L then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end

	if player_manager.GetPlayerClass(ply) != "Resistance Leader" then
		return
	end

	if RecruitCounter != 0 then
	local frame = vgui.Create("DFrame")	
	frame:SetSize(ScrW(),ScrH())
	frame:Center()
	frame:SetVisible(true)
	frame:MakePopup()
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:ShowCloseButton(true)

	pos = 0

	for _,p in ipairs(player.GetAll()) do
			
		if p:Team() != 1 and p:Team() != 4 then
		local label = vgui.Create("DLabel", frame)
		label:SetPos(w/4, 100 + pos)
		label:SetText(p:Nick())
		label:SetSize(150, 100)
		local buttontemp = vgui.Create("DButton", frame) 
		buttontemp:SetPos(w/2, 100 + pos)
		buttontemp:SetText("Recruit")
		buttontemp:SetSize(150, 100)
		buttontemp.DoClick = function()

			net.Start("Convert")
			net.WriteString(p:Nick())
			net.SendToServer()
			frame:Close()
			RecruitCounter = RecruitCounter - 1
				

		end

		end
		
			
		pos = pos + 200
		
	end

	end


end)