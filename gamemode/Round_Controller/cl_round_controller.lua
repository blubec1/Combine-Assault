round_status = 2

surface.CreateFont("TeamWin", {
    font = "Arial",
    extended = true,
    size = 50
})



net.Receive("UpdateRoundStatus", function(len)

    round_status=net.ReadInt(4)
    

end)

net.Receive("TeamWin", function()

    framew = 500
    frameh = 300
    frame = vgui.Create("DFrame")
    frame:SetVisible(false)

    print("teamwon")

    local teamId = net.ReadInt(4)
    if teamId == 1 then

        frame:SetSize(framew,frameh)
        frame:Center()
        frame:SetVisible(true)
        frame:MakePopup()
        frame:SetTitle("")
        frame:SetDraggable(false)
        frame:ShowCloseButton(true)
        frame.Paint = function(s,w,h)

            draw.WordBox(8, framew/2-200, frameh/5, "Combine Victory!", "TeamWin", Color(0,0,0,255), Color(255,255,255,255))

        end

    elseif teamId == 2 then 

        frame:SetSize(framew,frameh)
        frame:Center()
        frame:SetVisible(true)
        frame:MakePopup()
        frame:SetTitle("")
        frame:SetDraggable(false)
        frame:ShowCloseButton(true)
        frame.Paint = function(s,w,h)

            draw.WordBox(8, framew/2-200, frameh/5, "Resistance Victory!", "TeamWin", Color(0,0,0,255), Color(255,255,255,255))

        end

    end   

end)