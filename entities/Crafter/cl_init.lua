include("shared.lua")

surface.CreateFont("Matfont", {
    font = "Times New Roman",
    extended = true,
    size = 20
})

local material = 0
prevstate = 0

function ENT:Draw()
    self:DrawModel()
end

function ENT:Think()

    material = self:GetMaterialAmount()

end


net.Receive("use", function() 

    local ent = net.ReadEntity()

    if prevstate == 0 then 

    prevstate = 1
    local frame = vgui.Create("DFrame")
    local medbut = vgui.Create("DButton",frame)
    local knifebut = vgui.Create("DButton",frame)
    local m1911b = vgui.Create("DButton",frame)
    local bouncerb = vgui.Create("DButton",frame)
    local armorb = vgui.Create("DButton",frame)
    local ammob = vgui.Create("DButton",frame)
    frame:SetSize(ScrW(),ScrH())
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(true)
    function frame:OnClose()

        prevstate = 0

    end
    frame.Paint = function(s,w,h)

        draw.RoundedBox( 4, 0, 0, ScrW(), ScrH(), Color( 0, 0, 0) )
        draw.SimpleText("Materials: " .. tostring(ent:GetMaterialAmount()),"Matfont", ScrW()/2, 5 , Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    end
    medbut:SetPos(ScrW()/4-100,ScrH()/4 )
    medbut:SetSize(200,50)
    medbut:SetText("Meds = 15 materials")
    medbut.DoClick = function()


        if material >= 15 then

            prevstate = 0
            net.Start("spawn")
            net.WriteString("arc_medshot_4")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
                net.WriteInt(15, 8)
            net.SendToServer()

        end

    end

    knifebut:SetPos(ScrW()/4-100,ScrH()/4-200 )
    knifebut:SetSize(200,50)
    knifebut:SetText("Knife = 35 materials")
    knifebut.DoClick = function()

        if material >= 35 then

            prevstate = 0
            net.Start("spawn")
            net.WriteString("arccw_go_melee_knife")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
                net.WriteInt(35, 8)
            net.SendToServer()

        end

    end

    m1911b:SetPos(ScrW()/4-100,ScrH()/4+200 )
    m1911b:SetSize(200,50)
    m1911b:SetText("M1911 = 50 materials")
    m1911b.DoClick = function()

        if material >= 50 then

        prevstate = 0
            net.Start("spawn")
            net.WriteString("arccw_ur_m1911")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
                net.WriteInt(50, 8)
            net.SendToServer()

        end

    end

    bouncerb:SetPos(ScrW()/4-100,ScrH()/4+400 )
    bouncerb:SetSize(200,50)
    bouncerb:SetText("Bouncer = 40 materials")
    bouncerb.DoClick = function()

        if material >= 40 then

            prevstate = 0
            net.Start("spawn")
            net.WriteString("tfa_combeangren")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
            net.WriteInt(40, 8)
            net.SendToServer()
        
        end

    end    

    armorb:SetPos(ScrW()/4-100,ScrH()/4+600 )
    armorb:SetSize(200,50)
    armorb:SetText("Suit Energy = 10 materials")
    armorb.DoClick = function()

        if material >= 10 then

            prevstate = 0
            net.Start("spawn")
            net.WriteString("item_battery")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
                net.WriteInt(10, 8)
            net.SendToServer()

        end

    end 

    ammob:SetPos(ScrW()/2-100,ScrH()/4-200 )
    ammob:SetSize(200,50)
    ammob:SetText("Pulse Ammo = 5 materials")
    ammob.DoClick = function()

        if material >= 5 then

            prevstate = 0
            net.Start("spawn")
            net.WriteString("item_ammo_ar2_large")
            net.SendToServer()
            frame:Close()
            net.Start("minus")
                net.WriteInt(5, 8)
            net.SendToServer()

        end

    end 

    end

end)

