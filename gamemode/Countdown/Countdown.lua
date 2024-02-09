local timecheck
local curtime
local prevstate = 0

function initCountdown()

    timecheck = CurTime()

    prevstate = 0

    hook.Add("Think", "Countdown", function()
    
        curtime = CurTime()

        if curtime - timecheck >= 15 && prevstate == 0 then 

            prevstate = 1
            endRound()

        end

    end)

end