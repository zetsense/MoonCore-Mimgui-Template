local imgui = require 'mimgui'
local MoonCore = require "ubplibs.MoonCore"
local faicons = require('fAwesome6')
local imguiFunc = MoonCore.class("imguiFunc", {
    extends = MoonCore.BaseClass,
    public = {
        init = function(self)
            MoonCore.BaseClass.init(self)
        end,
        setupTheme = function(self)
            imgui.SwitchContext()
            --==[ STYLE ]==--
            imgui.GetStyle().WindowPadding = imgui.ImVec2(0, 0)
            imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
            imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
            imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
            imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
            imgui.GetStyle().IndentSpacing = 5  
            imgui.GetStyle().ScrollbarSize = 2.5
            imgui.GetStyle().GrabMinSize = 15
        
            --==[ BORDER ]==--
            imgui.GetStyle().WindowBorderSize = 0
            imgui.GetStyle().ChildBorderSize = 0
            imgui.GetStyle().PopupBorderSize = 0
            imgui.GetStyle().FrameBorderSize = 0
            imgui.GetStyle().TabBorderSize = 0
        
            --==[ ROUNDING ]==--
            imgui.GetStyle().WindowRounding = 12
            imgui.GetStyle().ChildRounding = 10
            imgui.GetStyle().FrameRounding = 7
            imgui.GetStyle().PopupRounding = 5
            imgui.GetStyle().ScrollbarRounding = 5
            imgui.GetStyle().GrabRounding = 5
            imgui.GetStyle().TabRounding = 5
        
            --==[ ALIGN ]==--
            imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
            imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
            imgui.GetStyle().SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
            
            --==[ COLORS ]==--
            imgui.GetStyle().Colors[imgui.Col.Text]                   = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = imgui.ImVec4(0.50, 0.50, 0.50, 1.00)
            imgui.GetStyle().Colors[imgui.Col.WindowBg]               = imgui.ImVec4(0.03, 0.03, 0.03, 1)
            imgui.GetStyle().Colors[imgui.Col.ChildBg]                = imgui.ImVec4(0.1, 0.13, 0.17, 0)
            imgui.GetStyle().Colors[imgui.Col.PopupBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
            imgui.GetStyle().Colors[imgui.Col.Border]                 = imgui.ImVec4(0.25, 0.25, 0.26, 0.54)
            imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
            imgui.GetStyle().Colors[imgui.Col.FrameBg]                = imgui.ImVec4(0.13, 0.16, 0.2, 1.00)
            imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = imgui.ImVec4(0.13, 0.16, 0.2, 1.00)
            imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = imgui.ImVec4(0.13, 0.16, 0.2, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TitleBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.HeaderHovered]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.HeaderActive]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
            imgui.GetStyle().Colors[imgui.Col.Header]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00) 
            imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 0) 
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]              = imgui.ImVec4(0.12, 0.12, 0.12, 0) 
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]              = imgui.ImVec4(0.12, 0.12, 0.12, 0) 
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]              = imgui.ImVec4(0.12, 0.12, 0.12, 0)
        end
    }
})

return imguiFunc
