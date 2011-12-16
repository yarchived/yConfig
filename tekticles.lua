
local function SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
    obj:SetFont(font, size, style)
    if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
    if sox and soy then obj:SetShadowOffset(sox, soy) end
    if r and g and b then obj:SetTextColor(r, g, b)
    elseif r then obj:SetAlpha(r) end
end

local NORMAL = [[Fonts\Normal.TTF]]
local COMBAT = [[Fonts\Combat.TTF]]
local CHAT_FONT_HEIGHTS = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
--f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()

    UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12

    wipe(_G.CHAT_FONT_HEIGHTS)
    for k, v in next, CHAT_FONT_HEIGHTS do _G.CHAT_FONT_HEIGHTS[k] = v end

    UNIT_NAME_FONT     = NORMAL
    NAMEPLATE_FONT     = NORMAL
    DAMAGE_TEXT_FONT   = COMBAT
    STANDARD_TEXT_FONT = NORMAL

    -- Base fonts
    SetFont(AchievementFont_Small,					NORMAL, 10)
    SetFont(FriendsFont_Large,                      NORMAL, 15, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_Normal,                     NORMAL, 13, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_Small,                      NORMAL, 11, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(FriendsFont_UserText,                   NORMAL, 12, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(GameTooltipHeader,						NORMAL, 14, "OUTLINE")
    SetFont(InvoiceFont_Med,						NORMAL, 13, nil, 0.15, 0.09, 0.04)
    SetFont(InvoiceFont_Small,						NORMAL, 11, nil, 0.15, 0.09, 0.04)
    SetFont(MailFont_Large,							NORMAL, 15, nil, 0.15, 0.09, 0.04, 0.54, 0.4, 0.1, 1, -1)
    SetFont(NumberFont_OutlineThick_Mono_Small,		NORMAL, 11, "OUTLINE")
    SetFont(NumberFont_Outline_Huge,				NORMAL, 20, "THICKOUTLINE", 30)
    SetFont(NumberFont_Outline_Large,				NORMAL, 14, "OUTLINE")
    SetFont(NumberFont_Outline_Med,					NORMAL, 12, "OUTLINE")
    SetFont(NumberFont_Shadow_Med,					NORMAL, 14)
    SetFont(NumberFont_Shadow_Small,				NORMAL, 13)
    SetFont(QuestFont_Large,						NORMAL, 15)
    SetFont(QuestFont_Shadow_Huge,					NORMAL, 18, nil, nil, nil, nil, 0.54, 0.4, 0.1)
    SetFont(ReputationDetailFont,					NORMAL, 10, nil, nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(SpellFont_Small,						NORMAL, 12)
    SetFont(SystemFont_InverseShadow_Small,			NORMAL, 10)
    SetFont(SystemFont_Large,						NORMAL, 13)
    SetFont(SystemFont_Med1,						NORMAL, 14)
    SetFont(SystemFont_Med2,						NORMAL, 14, nil, 0.15, 0.09, 0.04)
    SetFont(SystemFont_Med3,						NORMAL, 13)
    SetFont(SystemFont_OutlineThick_Huge2,			NORMAL, 22, "THICKOUTLINE")
    SetFont(SystemFont_OutlineThick_Huge4,			NORMAL, 26, "THICKOUTLINE")
    SetFont(SystemFont_OutlineThick_WTF,			NORMAL, 112, "THICKOUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
    SetFont(SystemFont_Outline_Small,				NORMAL, 12, "OUTLINE")
    SetFont(SystemFont_Shadow_Huge1,				NORMAL, 20)
    SetFont(SystemFont_Shadow_Huge3,				NORMAL, 25)
    SetFont(SystemFont_Shadow_Large, 				NORMAL, 13) -- 17
    SetFont(SystemFont_Shadow_Med1,					NORMAL, 14) -- 13
    SetFont(SystemFont_Shadow_Med3,					NORMAL, 14) -- 15
    SetFont(SystemFont_Shadow_Outline_Huge2,		NORMAL, 22, "OUTLINE")
    SetFont(SystemFont_Shadow_Small,				NORMAL, 12)
    SetFont(SystemFont_Small,						NORMAL, 13)
    SetFont(SystemFont_Tiny,						NORMAL, 9)
    SetFont(Tooltip_Med,							NORMAL, 13)
    SetFont(Tooltip_Small,							NORMAL, 12)

    -- Derived fonts
    SetFont(BossEmoteNormalHuge,					NORMAL, 25, "THICKOUTLINE")
    SetFont(CombatTextFont,							NORMAL, 25)
    SetFont(ErrorFont,								NORMAL, 14, nil, 60)
    SetFont(QuestFontNormalSmall,					NORMAL, 12, nil, nil, nil, nil, 0.54, 0.4, 0.1)
    SetFont(WorldMapTextFont,						NORMAL, 31, "THICKOUTLINE",  40, nil, nil, 0, 0, 0, 1, -1)

    --[[for i=1,7 do
    local f = _G["ChatFrame"..i]
    local font, size = f:GetFont()
    f:SetFont(NORMAL, size)
    end]]

    --[[
    -- I have no idea why the channel list is getting fucked up
    -- but re-setting the font obj seems to fix it
    for i=1,MAX_CHANNEL_BUTTONS do
    local f = _G["ChannelButton"..i.."Text"]
    f:SetFontObject(GameFontNormalSmallLeft)
    -- function f:SetFont(...) error("Attempt to set font on ChannelButton"..i) end
    end

    for _,butt in pairs(PaperDollTitlesPane.buttons) do butt.text:SetFontObject(GameFontHighlightSmallLeft) end
    ]]
end)

