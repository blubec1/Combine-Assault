local curtime,timecheck,timesub,ok = true

function initArmorCountDown()

    timecheck = CurTime()

    hook.Add("Think", "Armor giver", function() 

        curtime = CurTime()

        timesub = curtime - timecheck

        if(math.floor(timesub) % 10 == 0 and ok == true) then

            ok = false

            for _,p in ipairs(player.GetAll()) do

                if player_manager.GetPlayerClass(p) == "Combine Suppressor" and p:Armor()<150 then

                    p:SetArmor(p:Armor() + 10)

                end

            end

        elseif math.floor(timesub) % 10 != 0 then

            ok = true

        end


    end)

end
