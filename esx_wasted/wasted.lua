ESX = nil

locksound = false

Citizen.CreateThread(function()
   while true do
       Citizen.Wait(0)      
            if IsEntityDead(PlayerPedId()) then
					
			
					StartScreenEffect("DeathFailOut", 0, 0)
					if not locksound then
                    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
					locksound = true
					end
					ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
					
					local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

					if HasScaleformMovieLoaded(scaleform) then
						Citizen.Wait(0)

					PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
					BeginTextComponent("STRING")
					AddTextComponentString("~r~wasted")
					EndTextComponent()
					PopScaleformMovieFunctionVoid()

				    Citizen.Wait(500)

					PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
                    while IsEntityDead(PlayerPedId()) do
					  DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
					  Citizen.Wait(0)
                     end
					 
				  StopScreenEffect("DeathFailOut")
				  locksound = false
				  
				  
			end
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsEntityDead(GetPlayerPed(-1)) then
			Wait(3500) -- Time until respawn 15s
			NetworkResurrectLocalPlayer(295.83, -1446.94, 29.97, true, true, false)
			RemoveAllPedWeapons(GetPlayerPed(-1), true)
			ClearPedBloodDamage(GetPlayerPed(-1))
			ClearPedLastDamageBone(GetPlayerPed(-1))
			ClearPedTasks(GetPlayerPed(-1))
			TriggerServerEvent('esx_wastedscreen:moneyloss')
		end
	end
end)