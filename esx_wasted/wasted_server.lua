ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_wastedscreen:moneyloss')
AddEventHandler('esx_wastedscreen:moneyloss', function(bank)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	local BankAccount = xPlayer.getAccount('bank').money
	local DirtyMoney = xPlayer.getAccount('black_money').money
	xPlayer.removeAccountMoney('bank', BankAccount)
	xPlayer.removeAccountMoney('black_money', DirtyMoney)
	xPlayer.setMoney(500)
	
	TriggerClientEvent('esx:showNotification', xPlayer.source, ('Uff, fortunately, your fortune managed to cover the cost of national health care!'))
	
end)