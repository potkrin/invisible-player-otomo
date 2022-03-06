log.info("[invisible-player-otomo.lua] started loading")

re.on_application_entry("PrepareRendering", function()
    local otomoManager = sdk.get_managed_singleton("snow.otomo.OtomoManager")
    if not otomoManager then return end

    local playerManager = sdk.get_managed_singleton("snow.player.PlayerManager")
    if not playerManager then return end

    local master = playerManager:call("findMasterPlayer")
    if not master then return end

    local player = playerManager:call("getPlayer", 0)
    if player then
        player:call("get_GameObject"):call("set_DrawSelf", false)
    end
     
    for i = 0, 1 do
        local otomo = otomoManager:call("getOtomo", 0+4*i)
        if otomo then
            otomo:call("get_GameObject"):call("set_DrawSelf", false)
       end
    end
end)

log.info("[invisible_player_otomo.lua] finished loading")