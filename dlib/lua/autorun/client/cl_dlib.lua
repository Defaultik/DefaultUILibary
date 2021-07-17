surface.CreateFont("RobotoTitle", {font = "Roboto", size = ScrH() * 0.018, weight = 400, antialias = true})
surface.CreateFont("RobotoText", {font = "Roboto", size = ScrH() * 0.020, weight = 400, antialias = true})
surface.CreateFont("RobotoSmallText", {font = "Roboto", size = ScrH() * 0.015, weight = 400, antialias = true})
surface.CreateFont("RobotoButton", {font = "Roboto", size = ScrH() * 0.017, weight = 400, antialias = true})

--[[
    Default UI Libary
    https://github.com/Defaultik/DefaultUILibary
]]

DLib = {}
DLib.Color = {}
DLib.Material = {}

DLib.RoundingPower = 8 --[[ 0 - without rounding; 8 - perfect value ]]

DLib.Color.TitleText = Color(255, 255, 255, 255)
DLib.Color.Header = Color(100, 100, 255)
DLib.Color.Top = Color(100, 100, 255)
DLib.Color.GradientColor = Color(100, 100, 255, 120)
DLib.Color.Background = Color(25, 25, 25, 252)

DLib.Color.Text = Color(255, 255, 255, 255)

DLib.Color.SwitcherBackgroundOn = Color(105, 105, 255)
DLib.Color.SwitcherBackgroundOff = Color(80, 80, 165)

DLib.Material.blur = Material("pp/blurscreen")
DLib.Material.DownGradient = Material("gui/gradient_down")
DLib.Material.UpGradient = Material("gui/gradient_up")
DLib.Material.RightGradient = Material("vgui/gradient-r")
DLib.Material.LeftGradient = Material("vgui/gradient-l")

function DLib.Sound(sound, volume)
    LocalPlayer():EmitSound(sound, 75, 100, volume, CHAN_AUTO)
end

function DLib.Frame(x, y, w, h, title)
	frame = vgui.Create("DFrame")
    frame:MakePopup()
    frame:SetSize(w, h)
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:SetTitle("")
    frame.headerHeight = 30

    if (x == -1 && y == -1) then
        frame:Center()
    else
        frame:SetPos(x, y)
    end

    function frame:Paint(w, h)
        draw.RoundedBox(8, 0, 1, w, h - 1, DLib.Color.Background) -- Background
        draw.RoundedBoxEx(8, 0, 0, w, self.headerHeight, DLib.Color.Header, true, true) -- Header

        surface.SetDrawColor(DLib.Color.GradientColor) -- Gradient Color
        surface.SetMaterial(DLib.Material.DownGradient) -- Gradient Type
        surface.DrawTexturedRect(x, 8, w + 1, self.headerHeight * 18 - 105) -- Gradient Distance

        draw.SimpleText(title, "RobotoTitle", w * 0.0125, self.headerHeight / 2, DLib.Color.TitleText, 0, 1) -- Title in the Header
    end

    local close = DLib.Button(frame, frame:GetWide() - 50, -25, 44, 22, DLib.RoundingPower, DLib.Color.Header, "x") -- Close Button
    function close:DoClick()
        DLib.Sound("buttons/button15.wav", 0.4)
    	frame:Close()
    end
    return frame
end

function DLib.Button(frame, x, y, w, h, rounding, color, text)
    local button = vgui.Create("DButton", frame)
    button:SetPos(x, (frame.headerHeight or 30) + y)
    button:SetSize(w, h)
    button:SetText("")
    button:SetColor(color)
    button.Lerp = 0
    function button:Paint(w, h)
        draw.RoundedBox(rounding, 0, 0, w, h, button:GetColor())
        if self:IsHovered() then
            self.Lerp = Lerp(0.09, self.Lerp, 25)
        else
            self.Lerp = Lerp(0.09, self.Lerp, 0)
        end
        draw.RoundedBox(rounding, 0, 0, w, h, Color(255, 255, 255, self.Lerp))
        draw.SimpleText(text, "RobotoTitle", w / 2, h / 2, DLib.Color.Text, 1, 1)
    end
    return button
end

function DLib.CheckBox(frame, x, y, convar)
    local box = vgui.Create("DCheckBox", frame)
    box:SetPos(x, (frame.headerHeight or 30) + y)
    box:SetSize(20, 20)
    box:SetConVar(convar)
    box.Lerp = 0
    function box:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, DLib.Color.Top)
        if self:GetChecked() then
            box.Lerp = Lerp(0.1, box.Lerp, 255)
        else
            box.Lerp = Lerp(0.1, box.Lerp, 0)
        end
        draw.RoundedBox(8, 5, 5, w - 10, h - 10, Color(75, 75, 230, box.Lerp))
    end

    function box:OnChange(bVal) -- SPECIAL THANKS FOR THE ARTEMKING4
        if bVal ~= box.prevVal then
            DLib.Sound("buttons/button15.wav", 0.4)
        end

        box.prevVal = bVal
    end
    return box
end

function DLib.Switch(frame, x, y, convar)
    local button = vgui.Create("DCheckBox", frame)
    button:SetPos(x, (frame.headerHeight or 30) + y)
    button:SetSize(35, 17)
    button:SetConVar(convar)
    button.Lerp = 0
    button.LerpR = 0
    button.LerpG = 0
    button.LerpB = 0
    function button:Paint(w, h)
        if self:GetChecked() then
            button.Lerp = Lerp(0.09, button.Lerp, w - (w * 0.500))
            button.LerpR = Lerp(0.09, button.LerpR, DLib.Color.SwitcherBackgroundOn.r)
            button.LerpG = Lerp(0.09, button.LerpG, DLib.Color.SwitcherBackgroundOn.g)
            button.LerpB = Lerp(0.09, button.LerpB, DLib.Color.SwitcherBackgroundOn.b)
        else
            button.Lerp = Lerp(0.09, button.Lerp, w - (w * 1))
            button.LerpR = Lerp(0.09, button.LerpR, DLib.Color.SwitcherBackgroundOff.r)
            button.LerpG = Lerp(0.09, button.LerpG, DLib.Color.SwitcherBackgroundOff.g)
            button.LerpB = Lerp(0.09, button.LerpB, DLib.Color.SwitcherBackgroundOff.b)
        end
        draw.RoundedBox(8, 0, 0, w, h, Color(button.LerpR, button.LerpG, button.LerpB))
        draw.RoundedBox(8, button.Lerp, 0, w / 2, h, Color(230, 230, 230))
    end

    function button:OnChange(bVal) -- SPECIAL THANKS TO THE ARTEMKING4
        if bVal ~= button.prevVal then
            DLib.Sound("buttons/button15.wav", 0.4)
        end

        button.prevVal = bVal
    end
    return button
end

function DLib.Text(frame, x, y, text)
    local label = vgui.Create("DLabel", frame)
    label:SetPos(x, (frame.headerHeight or 30) + y)
    label:SetText(text)
    label:SetFont("RobotoText")
    label:SizeToContents()
    label:SetColor(DLib.Color.Text)
    return label
end

include("vgui/dbinder.lua")
function DLib.Binder(frame, x, y, convar)
    binder = vgui.Create("DBinder", frame)
    binder:SetSize(90, 20)
    binder:SetPos(x, (frame.headerHeight or 30) + y)
    binder:SetConVar(convar)
    binder:SetFont("RobotoSmallText")
    binder:SetTextColor(DLib.Color.Text)

    function binder:Paint(w, h)
        draw.RoundedBox(8, 0, 0, binder:GetWide(), binder:GetTall(), Color(100, 100, 255))

        if binder.Hovered then 
            draw.RoundedBox(8, 0, 0, binder:GetWide(), binder:GetTall(), Color(255, 255, 255, 10))
        end
    end

    function binder:OnChange(bVal) -- SPECIAL THANKS FOR THE ARTEMKING4
        if bVal ~= binder.prevVal then
            DLib.Sound("buttons/button14.wav", 0.4)
        end
        binder.prevVal = bVal
    end

    function binder:DoClick()
        self:SetText("...") -- Change fu#king gmod "PRESS ANY KEY"
        input.StartKeyTrapping()
        self.Trapping = true
    end
end

function DLib.Slider(frame, x, y, w, h, minValue, maxValue, convar)
    local slider = vgui.Create("DNumSlider", frame)
    slider:SetPos(x, (frame.headerHeight or 30) + y)
    slider:SetSize(w, h)
    slider:SetDecimals(0)
    slider:SetMinMax(minValue, maxValue)
    slider:SetConVar(convar)
    slider.TextArea:SetFont("RobotoSmallText")
    slider.TextArea.SetTextColor(DLib.Color.Text)

    function slider.Slider.Knob:Paint() end
    function slider.Slider:Paint(w, h)
        draw.RoundedBox(8, 0, h / 4, w, h /2, Color(80, 80, 250, 100))
        draw.RoundedBox(8, 0, h / 4, w * ((self:GetParent():GetValue() - self:GetParent():GetMin()) / self:GetParent():GetRange()), h / 2, DLib.Color.Top) -- Thanks to the Exec
    end

    -- Fix gmod shit
    slider.Label:SetWide(0)
    function slider:PerformLayout() end
end

-- Special thanks to Crester for memorizing by means of convars
local r = CreateClientConVar("dlib_color_r", 255, true, false, "", 0, 255)
local g = CreateClientConVar("dlib_color_g", 255, true, false, "", 0, 255)
local b = CreateClientConVar("dlib_color_b", 255, true, false, "", 0, 255)

function DLib.GetColor()
    return Color(r:GetInt(), g:GetInt(), b:GetInt())
end

function DLib.ColorPicker(frame, x, y)
    local button = DLib.Button(frame, x, y, 20, 20, DLib.RoundingPower, DLib.GetColor(), "")
    function button:DoClick()
        DLib.Sound("buttons/button15.wav", 0.4)

        panel = vgui.Create("DPanel", frame)
        panel:SetPos(button:GetX() + 25, y - 50)
        panel:SetSize(170, 170)
        panel:Show()

        local close = DLib.Button(panel, 0, -30, panel:GetWide(), 22, 0, Color(90, 90, 240), "x") -- Close Button
        function close:DoClick()
            DLib.Sound("buttons/button15.wav", 0.4)
            panel:Hide()
        end

        local mixer = vgui.Create("DColorMixer", panel)
        mixer:SetSize(160, 140)
        mixer:SetPos(5, 26)
        mixer:SetPalette(false)
        mixer:SetAlphaBar(false)
        mixer:SetWangs(false)
        mixer:SetColor(DLib.GetColor())

        function mixer:ValueChanged(col)
            button:SetColor(DLib.GetColor())
            r:SetInt(col.r)
            g:SetInt(col.g)
            b:SetInt(col.b)
        end
    end
end
