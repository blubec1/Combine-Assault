

hook.Add( "PlayerButtonDown", "Recruit_Interface", function( ply, button )
	if button != KEY_E then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end

    if ply:Team() != 3 then
        return
    end

    print("hello")

    local ent = ply:GetEyeTrace().Entity
    local pos = ent:GetPos()

    print(ent)


    local entstr = tostring(ent)
    entstr = string.sub(entstr, string.find(entstr,']')+2, string.len(entstr)-1)

    if entstr == "prop_ragdoll" then


        ply:SetModel(ent:GetModel())
        net.Start("BodySwitch")
        net.WriteTable(pos)
        net.Send(ply)
        ent:Remove()
        
    local frame = vgui.Create("DFrame")
    closebutton:SetPos(ScrW()/2-100,ScrH()/2)
    closebutton:SetSize(200,50)
    closebutton:SetText("Close")
    closebutton.DoClick = function()

        frame:Close()

    end

    //countdown needed
    frame:SetSize(ScrW(),ScrH())
    frame:Center()
    frame:SetVisible(false)
    frame:MakePopup()
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(true)
    frame.Paint = function(s,w,h)

        draw.WordBox(4, w/2-390, h/3, "You have disguised yourself", "DermaLarge", Color(0, 0, 0, 255), Color(255, 255, 255, 255))

    end

        print("hewwo")

    end

end)