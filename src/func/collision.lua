
function resolveCol(a, b)
    if a.xpos and a.xrad and b.xpos and b.xrad then
        if detectCol(a,b) then
            if checkZAlignment(a,b) then
                print('zcol')
                if a.zpos < b.zpos then
                    zoverlap = (a.zpos + a.zrad/2) - (b.zpos - b.zrad/2)
                    a.zpos = a.zpos - zoverlap
                else
                    zoverlap = (b.zpos + b.zrad/2 ) - (a.zpos - a.zrad/2)
                    a.zpos = a.zpos + zoverlap
                end
            elseif checkXAlignment(a,b) then
                print('xcol')
                if a.xpos > b.xpos then
                    xoverlap = b.xpos + b.xrad/2 - (a.xpos - a.xrad/2)
                    a.xpos = a.xpos + xoverlap
                else
                    xoverlap = a.xpos + a.xrad/2 - (b.xpos - b.xrad/2)
                    a.xpos = a.xpos - xoverlap
                end
            elseif checkYAlignment(a,b) then
                if a.ypos + a.yrad/2 > b.ypos + b.ypos/2 then
                    yoverlap = b.ypos + b.yrad - a.ypos
                    a.ypos = a.ypos + yoverlap
                else
                    yoverlap = a.ypos + a.yrad - b.ypos
                    a.ypos = a.ypos - yoverlap 
                end
            end
        end
    end
end

function detectCol(a, b)
    return a.xpos + a.xrad/2 > b.xpos - b.xrad/2
    and a.xpos - a.xrad/2 < b.xpos + b.xrad/2
    and a.ypos + a.yrad > b.ypos
    and a.ypos < b.ypos + b.yrad
    and a.zpos - a.zrad/2 < b.zpos + b.zrad/2
    and a.zpos + a.zrad/2 > b.zpos - b.zrad/2
end

function checkXAlignment(a,b)
    return a.lastypos + a.yrad > b.lastypos
    and a.lastypos < b.lastypos + b.yrad
    and a.lastzpos - a.zrad/2 < b.lastzpos + b.zrad/2
    and a.lastzpos + a.zrad/2 > b.lastzpos - b.zrad/2
end

function checkYAlignment(a,b)
    return a.xpos + a.xrad/2 > b.xpos - b.xrad/2
    and a.lastxpos - a.xrad/2 < b.lastxpos + b.xrad/2
    and a.lastzpos - a.zrad/2 < b.lastzpos + b.zrad/2
    and a.lastzpos + a.zrad/2 > b.lastzpos - b.zrad/2
end

function checkZAlignment(a,b)
    return a.lastxpos + a.xrad/2 > b.lastxpos - b.xrad/2
    and a.lastxpos - a.xrad/2 < b.lastxpos + b.xrad/2
    and a.lastypos + a.yrad > b.lastypos
    and a.lastypos < b.lastypos + b.yrad
end

