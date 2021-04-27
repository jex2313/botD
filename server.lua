local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
        code, id, value, value2, amount = vRPWG.check_value()
        if code ~= nil then
            if vRPWG.WooGi_Script(code, id, value, value2, amount) ~= true then
                local user_id = vRP.getUserSource({id})
                local player = vRP.getUserId({user_id})
                if user_id ~= nil then
                    if code == 1 then
                        -- vRP.addUserGroup({id, value})
                        vRP.giveInventoryItem({id, value, amount, true})
                        --ex) vRP.addUserGroup({id, value})
                        --ex) vRP.giveInventoryItem({player, value, tonumber(value2), true})
                        vRPWG.clear()
                    else if code == 2 then
                        --ex) vRP.addUserGroup({id, value})
                        --ex) vRP.giveInventoryItem({player, value, tonumber(value2), true})
                        vRPWG.clear()
                    end
                    end
                else
                    vRPWG.clear()
                end
            end
        end
    end
end)


-- 1. code는 어떤 스크립트를 실행할지 정하는 코드이며 id는 유저 아이디 
-- 2. value는 첫 번째 변수 값 
-- 3. value2는 두 번째 변수값입니다 
-- 4. 두 번째 변수는 거의 숫자로 이용되며 숫자로 변경하실때에는 tonumber(변수값) 이런식으로 적어주세요
-- 5. else if 를 적어주셨으면 end처리를 정확히 해주세요
-- 6. 구문을 다 적으셨으면 그 else if 구문 마지막에 vRPWG.clear()를 꼭 적어주세요