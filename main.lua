RegisterCommand('faktura', function(source, args, rawCommand)
    local fakturaBelob = tonumber(args[1])
    local fakturaModtager = tonumber(args[2])
    
    if fakturaBelob == nil or fakturaModtager == nil then
      TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'System', 'Brug: /faktura [beløb] [modtager ID]'}
      })
    else
      TriggerServerEvent('sendFaktura', fakturaBelob, fakturaModtager)
    end
  end, false)
  
  RegisterNetEvent('modtagFaktura')
  AddEventHandler('modtagFaktura', function(fakturaBelob)
    TriggerEvent('chat:addMessage', {
      color = {0, 255, 0},
      multiline = true,
      args = {'System', 'Du har modtaget en faktura på DKK' .. fakturaBelob .. '!'}
    })
  end)
  