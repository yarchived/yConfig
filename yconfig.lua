
hooksecurefunc('ShowReadyCheck', function() PlaySound('ReadyCheck') end)

local f = CreateFrame'Frame'
f:SetScript('OnEvent', function(self, event, ...)
    self[event](self, event, ...)
end)

f:RegisterEvent'VARIABLES_LOADED'
function f:VARIABLES_LOADED()

    COMBAT_THREAT_DECREASE_0 = ''
    COMBAT_THREAT_DECREASE_1 = ''
    COMBAT_THREAT_DECREASE_2 = ''
    COMBAT_THREAT_INCREASE_1 = ''
    COMBAT_THREAT_INCREASE_3 = ''

    hooksecurefunc('ShowReadyCheck', function() PlaySound('ReadyCheck') end)

--    SetCVar('useUiScale', '1')
--    SetCVar('UIScale', '0.800') -- scale people
--    SetCVar('cameraDistanceMax', '25') -- camera distance

--    SetCVar('gxcolorbits','16')
--    SetCVar('gxdepthbits','16')
--    SetCVar('Maxfps', '40') -- max fps
--    SetCVar('maxfpsbk', '20') -- max fps @ background

    SetCVar('screenshotFormat', 'tga')
    SetCVar('screenshotQuality', '10')

    SetCVar('showArenaEnemyFrames', '0') -- hide blizz arena unitframe

    SetCVar('showTargetCastbar', '0') -- target castbar
    SetCVar('showVKeyCastbar', '0') -- castbar under nameplate

    SetCVar('showArenaEnemyFrames', '0')

    SetCVar('deselectOnClick', '1')

    SetCVar('checkAddonVersion', '0') -- Load out-of-date addon!
    --SetCVar('accountName', 'user@domain.com')

 --   SetCVar('Sound_AmbienceVolume', 0.6)
 --   SetCVar('Sound_MusicVolume', 0.4)
 --   SetCVar('Sound_MasterVolume', 1)
 --   SetCVar('Sound_SFXVolume', 1)

 --   SetCVar('Sound_EnableAmbience', 1)
 --   SetCVar('Sound_EnableMusic', 0)
 --   SetCVar('Sound_EnableAllSound', 1)
 --   SetCVar('Sound_EnableSFX', 1)

    SetCVar('profanityFilter', 0)
    --SetCVar('mouseSpeed', '1.2')
--    SetCVar('Sound_EnableSoundWhenGameIsInBG', 1)
--    SetCVar('screenshotFormat', 'tga')
--    SetCVar('screenshotQuality', '10')

    for k ,v in pairs{
        'synchronizeMacros',
        'synchronizeBindings',
        'synchronizeConfig',
    } do
        SetCVar(v, '1')
    end

    for k, v in pairs(CHAT_CONFIG_CHAT_LEFT) do
        ToggleChatColorNamesByClassGroup(true, v.type)
    end
    for i = 1, 10 do
        ToggleChatColorNamesByClassGroup(true, 'CHANNEL' .. i)
    end

    ChatTypeInfo.WHISPER.sticky = 0

    JPACK_ORDER = GetLocale() == 'zhCN' and {
        '炉石', '气阀微粒提取器', '矿工锄', '剥皮小刀', '#鱼竿', '##材料', '#武器', '#护甲',
        '#配方', '#其它', '#消耗品', '#商品', '鱼油', '#任务', '##任务', '#珠宝',
    } or GetLocale() == 'zhTW' and {
        '爐石', '气阀微粒提取器', '礦工豬', '剝皮小刀', '#魚干', '##施法材料', '#武器', '#護甲',
        '#配方', '#其他', '#消耗品', '#商品', '魚油', '#任務', '##任務', '#珠寶',
    } or {
        'Hearthstone', '##Mounts', 'Mining Pick', 'Skinning Knife', '#Fishing Poles', '#Weapon', '#Armor',
        '#Recipe', '#Miscellaneous', '#Consumable', '#Trade Goods', 'Fish Oil', '#Quest', '#Gem', '##Jewelcrafting',
    }
    JPACK_DEPOSIT = {}
    JPACK_DRAW = {}
    JPACK_IGNORE_BAGS = {}
end

f:RegisterEvent'UPDATE_PENDING_MAIL'
function f:UPDATE_PENDING_MAIL()
    if(HasNewMail()) then
        PlaySoundFile[[Sound\Interface\Error.wav]]
    end
end
local PlaySoundKitID = PlaySoundKitID
_G.PlaySoundKitID = function(id, ...)
    return 18019 ~= id and PlaySoundKitID(id, ...)
end

SLASH_RELOAD3 = 'rl'

SlashCmdList.READYCHECK = DoReadyCheck
SLASH_READYCHECK1 = '/rc'

SlashCmdList.GM = ToggleHelpFrame
SLASH_GM1 = '/gm'
SLASH_GM2 = '/ticket'

SLASH_YTELEPORT1 = '/ytele'
SLASH_YTELEPORT2 = '/yteleport'
SLASH_YTELEPORT3 = '/tele'
function SlashCmdList.YTELEPORT()
    local inInstance, instanceType = IsInInstance()
    LFGTeleport(instanceType and instanceType == 'party')
end

