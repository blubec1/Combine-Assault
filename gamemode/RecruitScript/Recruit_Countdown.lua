
local curtime,timecheck,timesub,ok = true

function initRCountdown()

timecheck = CurTime()

hook.Add("Think", "Recruit", function()

    curtime = CurTime()

    timesub = curtime - timecheck

    if math.floor(timesub) % 60 == 0 and ok == true then

        net.Start("incrementRCounter")
        net.Broadcast()
        ok = false

    elseif math.floor(timesub) % 10 != 0 then ok = true

    end

end)

end

