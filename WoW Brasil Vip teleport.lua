local function CloseMap()
    if WorldMapFrame:IsShown() then
        HideUIPanel(WorldMapFrame)
    end
end

function PlayerLink(self, button, down)
    if ( IsModifiedClick("CHATLINK") ) then
        if IsModifierKeyDown() then
            local zone = WorldMapFrameAreaLabel:GetText()
            if zone then
                zone = string.gsub(zone, " |cff.+$", "")
                zone = string.gsub(zone, "'", "")
                zone = string.gsub(zone, "%s", "")
                SendChatMessage(".tele " .. zone, "GUILD")
                print(".tele " .. zone)
                CloseMap()
            end
        end
    end
end

WorldMapButton:HookScript("OnClick", PlayerLink)

local origScript = WorldMapButton_OnClick
WorldMapButton_OnClick = function(self, button, ...)
    if IsModifierKeyDown() then
        local zone = WorldMapFrameAreaLabel:GetText()
        if zone then
            zone = string.gsub(zone, " |cff.+$", "")
            zone = string.gsub(zone, "'", "")
            zone = string.gsub(zone, "%s", "")
            SendChatMessage(".tele " .. zone, "GUILD")
            print(".tele " .. zone)
            CloseMap()
        end
    else
        origScript(self, button, ...)
    end
end

print('WoW Brasil VIP teleport - Basta clicar no mapa segurando shift em algum lugar que mostre nome do local ao passar o mouse em cima')