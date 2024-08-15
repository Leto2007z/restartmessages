RegisterNetEvent('SendMsg:Server')

AddEventHandler('SendMsg:Server', function(msg)
    TriggerClientEvent('chatMessage', -1, msg)
end)
