net.Receive("Resistanceteam", function()

    local frame = vgui.Create("DFrame")
    local closebutton = vgui.Create("DButton", frame)
    closebutton:SetPos(ScrW()/2-100,ScrH()/2)
    closebutton:SetSize(200,50)
    closebutton:SetText("Close")
    closebutton.DoClick = function()

        frame:Close()

    end
    frame:SetSize(ScrW(),ScrH())
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame.Paint = function(s,w,h)

        draw.WordBox(4, w/2-390, h/3, "YOU HAVE BEEN CONVERTED TO THE RESISTANCE`S FORCES", "DermaLarge", Color(0, 0, 0, 255), Color(255, 255, 255, 255))

    end

end)