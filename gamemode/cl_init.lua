include("shared.lua")
include("Weapon_Dropper/cl_Weapon_Dropper.lua")
include("classes.lua")
include("RecruitScript/Recruit_Countdown.lua")
include("RecruitScript/Recruit_Interface.lua")
include("RecruitScript/RecruitPopUp.lua")
include("Round_Controller/cl_round_controller.lua")
include("Round_Controller/ReadyScript/cl_ready.lua")
include("VoiceScript/cl_voice.lua")

local screenw = ScrW()
local screenh = ScrH()

function GM:HUDDrawTargetID()
    return false
end

net.Receive("Dframe", function()

local frame = vgui.Create("DFrame")
frame:SetSize(ScrW(),ScrH())
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame:SetTitle("")
frame:SetDraggable(false)
frame:ShowCloseButton(false)
frame.Paint = function(s,w,h)

    draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0,255))

end

local button1 = vgui.Create("DButton", frame)
local button2 = vgui.Create("DButton", frame)

button1:SetPos(screenw/3-100,screenh/1.5)
button2:SetPos(2*screenw/3-100,screenh/1.5)

button1:SetText("Become Combine")
button2:SetText("Become Citizen/Resistance")

button1:SetSize(200,100)
button2:SetSize(200,100)

button1.DoClick = function()

    net.Start("TeamChooser")
        net.WriteInt(1 ,4)
    net.SendToServer()
    frame:Close()

end


button2.DoClick = function()

    net.Start("TeamChooser")
        net.WriteInt(2 ,4)
    net.SendToServer()
    frame:Close()
    
end

end)