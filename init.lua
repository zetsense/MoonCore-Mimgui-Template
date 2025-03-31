local MoonCore = require "ubplibs.MoonCore"
local json = require "jbp"
local imgui = require "mimgui"
local vk = require "vkeys"

local renderHandler = require "MoonCore-Mimgui-Template.main.imguiHandler"
local imguiFunc = require "MoonCore-Mimgui-Template.main.ImguiFunc"

local init = MoonCore.class("init", {
    extends = MoonCore.BaseClass,
    private = {
        _initStorage = function(self, dependencies)
            if not doesDirectoryExist(dependencies.storagePath.path) then
                createDirectory(dependencies.storagePath.path)
                print("Created directory: " .. dependencies.storagePath.path)
            end 
            local defaultConfig = {
                renderSettings = {
                    Window = {
                        show = imgui.new.bool(false),
                        size = imgui.ImVec2(800, 600),
                    },
                }
            }
            local function compareTableStructure(t1, t2)
                if type(t1) ~= type(t2) then return false end
                if type(t1) ~= "table" then return true end
                
                for k, v in pairs(t1) do
                    if t2[k] == nil then return false end
                    if not compareTableStructure(v, t2[k]) then return false end
                end
                
                for k, v in pairs(t2) do
                    if t1[k] == nil then return false end
                end
                
                return true
            end
            local function mergeConfigs(default, saved)
                local result = {}
                for k, v in pairs(default) do
                    if type(v) == "table" and type(saved[k]) == "table" then
                        result[k] = mergeConfigs(v, saved[k])
                    else
                        result[k] = saved[k] ~= nil and saved[k] or v
                    end
                end
                return result
            end
            self.storage = json.create(defaultConfig)
            if doesFileExist(self.ConfigName) then
                local savedConfig = json.load_from_file(self.ConfigName)
                if savedConfig then
                    if compareTableStructure(defaultConfig, savedConfig) then
                        self.storage = json.create(savedConfig)
                    else
                        local mergedConfig = mergeConfigs(defaultConfig, savedConfig)
                        self.storage = json.create(mergedConfig)
                        self.storage:save_to_file(self.ConfigName, true, 2)
                    end
                else
                    self.storage:save_to_file(self.ConfigName, true, 2)
                end
            else
                self.storage:save_to_file(self.ConfigName, true, 2)
            end  
        end
    },
    public = {
        init = function(self, dependencies)
            MoonCore.BaseClass.init(self)
            self.dependencies = dependencies
            self.ConfigName = dependencies.storagePath.path .. "storage.json"
            self:_initStorage(dependencies)
            self.imguiFunc = imguiFunc:new()
            self.renderHandler = renderHandler:new({imguifunc = self.imguiFunc, storage = self.storage})
        end,
        update = function(self)
            lua_thread.create(function()
                while true do
                    while not isSampAvailable() or not sampIsLocalPlayerSpawned() do wait(0) end
                    if isKeyJustPressed(vk.VK_J) then
                        self.renderHandler:OpenMenu()
                    end
                    wait(0)
                end
            end)
        end
    }
})

return init

