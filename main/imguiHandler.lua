local MoonCore = require "ubplibs.MoonCore"
local imgui = require 'mimgui'
local faicons = require('fAwesome6')
local encoding = require('encoding')
local vk = require('vkeys')
encoding.default = 'CP1251'
local u8 = encoding.UTF8
local json = require 'jbp'

local imguiHandler = MoonCore.class("imguiHandler", {
    extends = MoonCore.BaseClass,
    private = {},
    public = {
        init = function(self, dependencies)
            self.dependencies = dependencies
            self.storage = dependencies.storage
            self:InitializeFonts(dependencies)
            print(json.encode(self.storage.renderSettings))
            self:RenderWindow(dependencies)
        end,
        InitializeFonts = function(self, dependencies)
            imgui.OnInitialize(function()
                local status, err = pcall(function()
                    dependencies.imguifunc:setupTheme()
                    imgui.GetIO().IniFilename = nil
                    local config = imgui.ImFontConfig()
                    config.MergeMode = true
                    config.PixelSnapH = true
                    iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
                    imgui.GetIO().Fonts:AddFontFromMemoryCompressedBase85TTF(faicons.get_font_data_base85('solid'), 14, config, iconRanges) -- solid - ��� ������, ��� �� ���� thin, regular, light � duotone
                end)
                if not status then
                    print("Error loading fonts: " .. tostring(err))
                end
            end)
        end,
        RenderWindow = function(self, dependencies)
            imgui.OnFrame(
                function() return self.storage:get("renderSettings.Window.show")[0] end,
                function(selfFrame)
                    local status, err = pcall(function()
                        local resX, resY = getScreenResolution()
                        imgui.SetNextWindowPos(imgui.ImVec2(resX/2, resY/2), imgui.Cond.FirstUseEver)
                        imgui.SetNextWindowSize(self.storage:get("renderSettings.Window.size"), imgui.Cond.Always)
                        imgui.Begin(u8"Example Menu", self.storage:get("renderSettings.Window.show"), 
                        imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar)
                        imgui.End()
                    end)
                    if not status then
                        print("Error rendering window: " .. tostring(err))
                    end
                end
            )
        end,
        OpenMenu = function(self)
            self.storage:set("renderSettings.Window.show.value", not self.storage:get("renderSettings.Window.show")[0])
        end
    }
})

return imguiHandler