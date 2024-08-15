RegisterCommand('restart', function()
    Citizen.CreateThread(function()
        local i = 15
        local msg = { 'Сервер перезагрузится через', tostring(i), 'минут!' }
        local args

        while i >= 5 do
            msg[2] = tostring(i)

            TriggerServerEvent('SendMsg:Server', msg[1]..' '..msg[2]..' '..msg[3])

            if i ~= 5 then
                Citizen.Wait(300000)
                i = i - 5
            end

            if i == 5 then
                while i > 0 do
                    if i == 4 or i == 3 or i == 2 then
                        msg[3] = 'минуты!'
                    elseif i == 1 then
                        msg[3] = 'минуту!'
                    end

                    msg[2] = tostring(i)

                    TriggerServerEvent('SendMsg:Server', msg[1]..' '..msg[2]..' '..msg[3])
                    Citizen.Wait(60000)
                    i = i - 1

                    if i == 0 then
                        TriggerServerEvent('SendMsg:Server', 'Сервер перезагружается!')
                    end
                end
            end
        end
    end)
end)
