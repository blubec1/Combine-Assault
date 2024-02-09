ok = 0

local rstate = {}

for i = 0, game.MaxPlayers() do

    rstate[i] = 0

end

net.Receive("ReadyFrame", function()

if round_status != 1 then
    rstate = net.ReadTable()

	frame = vgui.Create("DFrame")
    readybut = vgui.Create("DButton", frame)	
	frame:SetSize(ScrW(),ScrH())
	frame:Center()
	frame:SetVisible(true)
	frame:MakePopup()
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)

    readybut:SetSize(200,100)
    readybut:SetPos(ScrW() - 200, ScrH() - 100)
    readybut:SetText("Ready Up")
    readybut.DoClick = function()

        net.Start("ready")
            net.WriteEntity(LocalPlayer())
        net.SendToServer()    
        frame:Close()
    
    end

    pos = 0

    for _,p in ipairs(player.GetAll()) do

        local name = vgui.Create("DLabel", frame)
        name:SetPos(ScrW()/4, 300 + pos)
        name:SetSize(450,300)

        if rstate[_] == 2 then 

            name:SetText(p:Nick() .. " is ready") 

        else 
        
            name:SetText(p:Nick() .. " isn't ready")

        end

        pos = pos + 400

    end

else frame:Close() end

end)

net.Receive("classprompts", function()

    -- make it not visible or make a new separate chat box

    cframe = vgui.Create("DFrame")
    cframe:SetSize(ScrW(),ScrH())
	cframe:Center()
	cframe:SetVisible(true)
	cframe:MakePopup()
	cframe:SetTitle("")
	cframe:SetDraggable(false)
	cframe:ShowCloseButton(false)

    local countdown = vgui.Create("DLabel", cframe)
    local time = 0

    timer.Create("countdown", 1, 15, function() 

    time = time + 1

    countdown:SetText(time .. "/15")

    end)

    countdown:SetPos(ScrW()/2,ScrH()/6)
    

    if LocalPlayer():Team() == 1 then

    local buttonCSo = vgui.Create("DButton", cframe)
    local buttonCSh = vgui.Create("DButton", cframe)
    local buttonCSu = vgui.Create("DButton", cframe)
    local buttonCO  = vgui.Create("DButton", cframe)

    buttonCSo:SetPos(ScrW()/4-300,ScrH()/1.5)
    buttonCSo:SetText("Become Combine Grunt")
    buttonCSo:SetSize(200,100)

    buttonCSh:SetPos(ScrW()*2/4-300,ScrH()/1.5)
    buttonCSh:SetText("Become Combine Shotgunner")
    buttonCSh:SetSize(200,100)

    buttonCSu:SetPos(ScrW()*3/4-300,ScrH()/1.5)
    buttonCSu:SetText("Become Combine Suppressor")
    buttonCSu:SetSize(200,100)

    buttonCO:SetPos(ScrW()-300,ScrH()/1.5)
    buttonCO:SetText("Become Combine Ordinal")
    buttonCO:SetSize(200,100)


    buttonCSo.DoClick = function()

        net.Start("classChooser")
            net.WriteInt(1, 8)
            net.WriteEntity(LocalPlayer())
        net.SendToServer()

    end

    buttonCSh.DoClick = function()

        net.Start("classChooser")
            net.WriteInt(2, 8)
            net.WriteEntity(LocalPlayer())
        net.SendToServer()

    end

    buttonCSu.DoClick = function()

        net.Start("classChooser")
            net.WriteInt(3, 8)
            net.WriteEntity(LocalPlayer())
        net.SendToServer()

    end

    buttonCO.DoClick = function()

        net.Start("classChooser")
            net.WriteInt(4, 8)
            net.WriteEntity(LocalPlayer())
        net.SendToServer()

    end

    else 

    local RL = vgui.Create("DButton", cframe)

    RL:SetPos(ScrW()/2,ScrH()/1.5)
    RL:SetText("Become Resistance Leader")
    RL:SetSize(200,100)

    RL.DoClick = function ()

        net.Start("classChooser")
            net.WriteInt(11, 8)
            net.WriteEntity(LocalPlayer())
        net.SendToServer()

    end

    end

end)

net.Receive("RoundStart", function()

    cframe:Close()

end)