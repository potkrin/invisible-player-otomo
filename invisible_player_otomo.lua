-- this mod was helpful
-- Disable Other Players Pets (https://www.nexusmods.com/monsterhunterrise/mods/49)
log.info("[invisible-player-otomo.lua] started loading")

re.on_application_entry("PrepareRendering", function()
    local otomoman = sdk.get_managed_singleton("snow.otomo.OtomoManager")
    if not otomoman then return end

    local playman = sdk.get_managed_singleton("snow.player.PlayerManager")
    if not playman then return end

    local me = playman:call("findMasterPlayer")
    if not me then return end

    local player = playman:call("getPlayer", 0)
    if player then
        player:call("get_GameObject"):call("set_DrawSelf", false)
    end
     
    for i = 0, 1 do
        local otomo = otomoman:call("getOtomo", 0+4*i)
        if otomo then
            otomo:call("get_GameObject"):call("set_DrawSelf", false)
       end
    end
end)

log.info("[invisible_player_otomo.lua] finished loading")