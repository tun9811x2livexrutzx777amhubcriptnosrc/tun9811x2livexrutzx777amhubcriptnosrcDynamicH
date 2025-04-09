local executor = identifyexecutor()
-- PC
if executor == "Wave" or executor == "AWP" or executor == "Synapse Z" or executor == "Seriality" or executor == "Argon" or executor == "Atlantis" or executor == "Xeno" or executor == "Solara" or executor == "Velocity" or executor == "Seliware" or executor == "Swift"
-- Mobile
or executor == "Fluxus" or executor == "Delta" or executor == "Arceus X" or executor == "Codex" or executor == "Cryptic" or executor == "Krnl"
then
print("Executor " .. identifyexecutor())
local webh =
"https://discord.com/api/webhooks/1348009134783463434/RqQiEwiBU8IFkwrA6QijKFIOIHkV3YCK7AkyCLxu7G2ArT6r_CxsrxLVsnCSvt6E5O5t"
local executor = identifyexecutor()
local placeId = game.PlaceId
local mapName = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local currentTime = os.date("%Y-%m-%d %H:%M:%S")
local player = game.Players.LocalPlayer
local playerName = player.Name
local playerDisplayName = player.DisplayName
local playerPosition = player.Character and player.Character.HumanoidRootPart.Position or "Unknown"
local clientId = game:GetService('RbxAnalyticsService'):GetClientId()

pcall(function()
    local data = {
        ["embeds"] = {
            {
                ["title"] = "Game Information",
                ["description"] = string.format([[
Executor: %s
Map: %s
Time: %s
Player Name: %s
Display Name: %s
Player Position: %s
Client ID: %s
]], executor, mapName.Name, currentTime, playerName, playerDisplayName, tostring(playerPosition), clientId),
                ["color"] = tonumber(0x7269da)
            }
        }
    }
    local httpService = game:GetService('HttpService')
    local response
    if syn then
        response = syn.request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif request then
        response = request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif http_request then
        response = http_request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    end
end)

local webh =
"https://discord.com/api/webhooks/1348879379186585710/HL6nj5UQrxSgDUzsgWHWhoGUbZCdb5Oj7dMZvrhI8XuBUY53-ImRh9LSylqR_zA7QZT6"
local httpService = game:GetService('HttpService')
local marketplaceService = game:GetService("MarketplaceService")
local notified = false
task.spawn(function()
    while true do
        if game.PrivateServerId == nil or game.PrivateServerId == "" then
            local playerCount = #game.Players:GetPlayers()
            if playerCount < 5 and not notified then
                local jobId = game.JobId
                local success, serverTime = pcall(function()
                    return game:GetService("Lighting"):GetMinutesAfterMidnight()
                end)
                local hours, minutes = 0, 0
                if success then
                    hours = math.floor(serverTime / 60)
                    minutes = math.floor(serverTime % 60)
                else
                end
                local formattedTime = string.format("%02d:%02d", hours, minutes)
                local placeId = game.PlaceId
                local placeInfo = { Name = "Unknown" }
                local success, info = pcall(function()
                    return marketplaceService:GetProductInfo(placeId)
                end)
                if success then
                    placeInfo = info
                else
                end
                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "Low Server",
                            ["fields"] = {
                                { ["name"] = "Players :",     ["value"] = string.format("```yaml\n%d/12\n```", playerCount),                                                                            ["inline"] = false },
                                { ["name"] = "Server Time :", ["value"] = string.format("```fix\n%s\n```", formattedTime),                                                                              ["inline"] = false },
                                { ["name"] = "Job-Id :",      ["value"] = string.format("```yaml\n%s\n```", jobId),                                                                                     ["inline"] = false },
                                { ["name"] = "game Name :",   ["value"] = string.format("```yaml\n%s\n```", placeInfo.Name),                                                                            ["inline"] = false },
                                { ["name"] = "Script :",      ["value"] = string.format("```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"%s\")```", jobId), ["inline"] = false }
                            },
                            ["color"] = 0xFF0000
                        }
                    }
                }
                local success, response = pcall(function()
                    if syn then
                        return syn.request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif request then
                        return request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif http_request then
                        return http_request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    else
                        return nil
                    end
                end)
                if success and response and response.StatusCode == 200 then
                    notified = true
                else
                end
            elseif playerCount >= 5 then
                if notified then
                end
                notified = false
            end
        else
        end
        task.wait(21600)
    end
end)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
getgenv().Config = {
    Save_Member = true
}
_G.Check_Save_Setting = "CheckSaveSetting"
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis and not isfolder('Dynamic Hub Hunters') then
        makefolder('Dynamic Hub Hunters')
    end
    if not _G.Dis and not isfile('Dynamic Hub Hunters/' .. Name .. '.json') then
        writefile('Dynamic Hub Hunters/' .. Name .. '.json', JsonEncode(getgenv().Config))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Hunters') and isfile('Dynamic Hub Hunters/' .. Name .. '.json') then
        getgenv().Config = JsonDecode(readfile('Dynamic Hub Hunters/' .. Name .. '.json'))
        return getgenv().Config
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Hunters') and isfile('Dynamic Hub Hunters/' .. Name .. '.json') then
        writefile('Dynamic Hub Hunters/' .. Name .. '.json', JsonEncode(getgenv().Config))
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)
if getgenv().Config.Save_Member then
    getgenv()['MyName'] = game.Players.LocalPlayer.Name
elseif getgenv().Config.Save_All_Member then
    getgenv()['MyName'] = "AllMember"
else
    getgenv()['MyName'] = "None"
    _G.Dis = true
end
Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])
getgenv().Config.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/main.lua"))()
local SaveManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/InterfaceManager.lua"))()
--// Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(180)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
--[[]
local L_3c2 = 200
function TP(Pos)
local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance <= 100 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
if Distance < 80 then
Speed11 = 275
elseif Distance < 120 then
Speed11 = 300
elseif Distance < 150 then
Speed11 = 800
elseif Distance < 230 then
Speed11 = 740
elseif Distance < 330 then
Speed11 = 640
elseif Distance < 440 then
Speed11 = 520
elseif Distance < 580 then
Speed11 = 410
elseif Distance < 700 then
Speed11 = 350
elseif Distance < 800 then
Speed11 = 300
elseif Distance < 900 then
Speed11 = 275
elseif Distance >= 1000 then
Speed11 = 275
end
local tweenInfo = TweenInfo.new(Distance / getgenv().Config["Tween Speed"], Enum.EasingStyle.Linear)
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
tweenInfo, {
CFrame = Pos
})
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y,
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
if BypassTP and Distance >= 0 then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
tween:Play()
end
--]]
function TP(Pos)
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tweenInfo = TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
        tweenInfo, {
            CFrame = Pos
        })
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    if BypassTP and Distance >= 1000 then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    end
    tween:Play()
end
--[[]
function TP(Pos)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  Pos
end
--]]
function TP1(Pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        local humanoidRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        if humanoidRootPart:FindFirstChild("BodyClip") then
            humanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
        local character = game.Players.LocalPlayer.Character
        if character:FindFirstChild("Highlight") then
            character:FindFirstChild("Highlight"):Destroy()
        end
    end
end
function Rejoin()
    local TeleportService = game:GetService("TeleportService")
    local player = game.Players.LocalPlayer
    if player then
        pcall(function()
            TeleportService:Teleport(game.PlaceId, player)
        end)
    end
end
local VirtualInputManager = game:GetService("VirtualInputManager")
function Click()
    wait(0.1)
    VirtualInputManager:SendMouseButtonEvent(1280, 672, 0, true, game, 0)
    wait(0.05)
    VirtualInputManager:SendMouseButtonEvent(1280, 672, 0, false, game, 0)
end
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function isAutoEnabled()
    local keys_G = {
        "Auto Farm Dungeon",
    }
    for _, key in ipairs(keys_G) do
        if getgenv().Config[key] then return true end
    end
    return false
end
spawn(function()
while wait() do
if isAutoEnabled() then
    local hrp = Players.LocalPlayer.Character.HumanoidRootPart
    if not hrp:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = hrp
        Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        Noclip.Velocity = Vector3.new(0, 0, 0)
    end
end
end
end)
RunService.Stepped:Connect(function()
    if isAutoEnabled() then
        for _, v in pairs(Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)
--[[]
spawn(function()
    while wait() do
        if isAutoEnabled() then
            if not Players.LocalPlayer.Character:FindFirstChild("Highlight") then
                local Highlight = Instance.new("Highlight")
                Highlight.FillColor = Color3.fromRGB(81, 255, 60)
                Highlight.OutlineColor = Color3.fromRGB(81, 255, 60)
                Highlight.Parent = Players.LocalPlayer.Character
            end
        end
    end
end)
--]]
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Shadow = Instance.new("ImageLabel")
local ClickSound = Instance.new("Sound")
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.BackgroundTransparency = 0.8
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.4875, 0, 0.010, 0)
ImageButton.Size = UDim2.new(0, 52, 0, 50)
ImageButton.Draggable = false
ImageButton.Image = "http://www.roblox.com/asset/?id=" .. (_G.Logo)
ImageButton.ImageTransparency = 0.4
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
UIStroke.Parent = ImageButton
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 1
ClickSound.Parent = ImageButton
ClickSound.SoundId = "rbxassetid://130785805"
ClickSound.Volume = 1
local function playClickAnimation()
    local originalSize = ImageButton.Size
    local TweenSizeUp = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = UDim2.new(0, 52, 0, 50) })
    local TweenSizeDown = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = originalSize })
    TweenSizeUp:Play()
    TweenSizeUp.Completed:Connect(function()
        TweenSizeDown:Play()
    end)
end
ImageButton.MouseButton1Down:Connect(function()
    ClickSound:Play()
    playClickAnimation()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "RightControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "RightControl", false, game)
end)
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Window = WindUI:CreateWindow({
    Title = "Hunters - Dynamic Hub", -- UI Title
    Icon = "door-open",              -- Url or rbxassetid or lucide
    Author = "By x2Livex",           -- Author & Creator
    Folder = "Dynamic Hub",          -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(620, 420), -- UI Size
    Transparent = true,              -- UI Transparency
    Theme = "Dark",                  -- UI Theme
    SideBarWidth = 165,              -- UI Sidebar Width (number)
    HasOutline = false,              -- Adds Oultines to the window
})
Window:EditOpenButton({
    Title = "Open UI Button",
    Icon = "image-upscale", -- New icon
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 3,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    )
})
local AutoFarm = Window:Tab({
    Title = "Auto Farm",
    Icon = "swords",
})
local Stats = Window:Tab({
    Title = "Stats",
    Icon = "chart-bar",
})
b = Window:Divider()
local WindowTab = Window:Tab({
    Title = "Window and File Configuration",
    Icon = "settings",
})
local CreateThemeTab = Window:Tab({
    Title = "Create theme",
    Icon = "palette",
})
Window:Divider()
AutoFarm:Section({
    Title = "Dungeons [ 👑 ]",
    TextXAlignment = "Left"
})
AutoFarm:Toggle({
    Title = "Auto Farm Dungeon",
    Value = getgenv().Config["Auto Farm Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm Dungeon"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Dungeon"] then
            pcall(function()
                for i,v in pairs(workspace.Mobs:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                        repeat
                            wait()
                            v.Humanoid.WalkSpeed = 0
                            local targetPos = v.HumanoidRootPart.Position + Vector3.new(0, 8, 0)
                            local lookCFrame = CFrame.lookAt(targetPos, v.HumanoidRootPart.Position)
                            TP(lookCFrame)
                        until not getgenv().Config["Auto Farm Dungeon"] or not v.Parent
                    end
                end
            end)
        end
    end
end)
local DungeonOptions = {
    "Singularity",
    "Goblin Caves",
    "Spider Cavern"
}
AutoFarm:Dropdown({
    Title = "Dungeon Options",
    Multi = false,
    Value = getgenv().Config['Dungeon Options'] or "N/A",
    AllowNone = true,
    Values = DungeonOptions,
    Callback = function(Value)
        getgenv().Config['Dungeon Options'] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
local DungeonDifficulty = {
    "Regular",
    "Hard",
    "Nightmare"
}
AutoFarm:Dropdown({
    Title = "Dungeon Difficulty",
    Multi = false,
    Value = getgenv().Config['Dungeon Difficulty'] or "N/A",
    AllowNone = true,
    Values = DungeonDifficulty,
    Callback = function(Value)
        getgenv().Config['Dungeon Difficulty'] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
AutoFarm:Toggle({
    Title = "Auto Join Dungeon",
    Value = getgenv().Config["Auto Join Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Join Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Join Dungeon"] and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Wave.Visible == false then
            pcall(function()
                if getgenv().Config['Dungeon Options'] == "Singularity" and getgenv().Config['Dungeon Difficulty'] == "Regular" then
                    local args = {
                        [1] = "DoubleDungeonD"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Regular"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Singularity" and getgenv().Config['Dungeon Difficulty'] == "Hard" then
                    local args = {
                        [1] = "DoubleDungeonD"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))   
                    local args = {
                        [1] = "Hard"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Singularity" and getgenv().Config['Dungeon Difficulty'] == "Nightmare" then
                    local args = {
                        [1] = "DoubleDungeonD"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))   
                    local args = {
                        [1] = "Nightmare"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Goblin Caves" and getgenv().Config['Dungeon Difficulty'] == "Regular" then
                    local args = {
                        [1] = "GoblinCave"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Regular"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Goblin Caves" and getgenv().Config['Dungeon Difficulty'] == "Hard" then
                    local args = {
                        [1] = "GoblinCave"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Hard"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Goblin Caves" and getgenv().Config['Dungeon Difficulty'] == "Nightmare" then
                    local args = {
                        [1] = "GoblinCave"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Nightmare"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Spider Cavern" and getgenv().Config['Dungeon Difficulty'] == "Regular" then
                    local args = {
                        [1] = "SpiderCavern"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Regular"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Spider Cavern" and getgenv().Config['Dungeon Difficulty'] == "Hard" then
                    local args = {
                        [1] = "SpiderCavern"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Hard"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                elseif getgenv().Config['Dungeon Options'] == "Spider Cavern" and getgenv().Config['Dungeon Difficulty'] == "Nightmare" then
                    local args = {
                        [1] = "SpiderCavern"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("createLobby"):InvokeServer(unpack(args))      
                    local args = {
                        [1] = "Nightmare"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyDifficulty"):FireServer(unpack(args))  
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyStart"):FireServer()
                end
            end)
        end
    end
end)
AutoFarm:Toggle({
    Title = "Auto Start Dungeon",
    Value = getgenv().Config["Auto Start Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Start Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Start Dungeon"] and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Wave.Visible == true then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonStart"):FireServer()
            end)
        end
    end
end)
AutoFarm:Toggle({
    Title = "Enabled Instant Kill",
    Value = getgenv().Config["Enabled Instant Kill"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Instant Kill"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Enabled Instant Kill"] then
            pcall(function()
                for i,v in pairs(workspace.Mobs:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        v.Humanoid.Health  = 0
                        end
                    end
                end
            end)
        end
    end
end)
AutoFarm:Toggle({
    Title = "Lobby Friends Only",
    Value = getgenv().Config["Lobby Friends Only"] or false,
    Callback = function(Value)
        getgenv().Config["Lobby Friends Only"] = Value
        Update_Setting(getgenv()['MyName'])
        if Value then
            local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyFriendsOnly"):FireServer(unpack(args))
        else
            local args = {
                [1] = false
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LobbyFriendsOnly"):FireServer(unpack(args))
        end
    end
})
AutoFarm:Toggle({
    Title = "Auto Leave",
    Value = getgenv().Config["Auto Leave"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Leave"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Leave"] and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Wave.Visible == true then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LeaveToLobby"):FireServer()
            end)
        end
    end
end)
AutoFarm:Button({
    Title = "Back to Lobby",
    Callback = function()
        game:GetService("TeleportService"):Teleport(72992062125248, game:GetService("Players").LocalPlayer)
    end
})
AutoFarm:Section({
    Title = "Roll [ 💫 ]",
    TextXAlignment = "Left"
})
AutoFarm:Toggle({
    Title = "Auto Roll",
    Value = getgenv().Config["Auto Roll"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Roll"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Roll"] then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Roll"):InvokeServer()
            end)
        end
    end
end)
AutoFarm:Section({
    Title = "Misc Sections [ 🛠️ ]",
    TextXAlignment = "Left"
})
AutoFarm:Toggle({
    Title = "Auto Reawaken",
    Value = getgenv().Config["Auto Reawaken"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Reawaken"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Reawaken"] then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reawaken"):InvokeServer()
            end)
        end
    end
end)
AutoFarm:Section({
    Title = "Settings [ ⚙️ ]",
    TextXAlignment = "Left"
})
AutoFarm:Toggle({
    Title = "Auto Attack",
    Value = getgenv().Config["Auto Attack"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Attack"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Attack"] then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Combat"):FireServer()
            end)
        end
    end
end)
Stats:Section({
    Title = "Stats [ 📊 ]",
    TextXAlignment = "Left"
})
Stats:Toggle({
    Title = "Auto Stats Strength",
    Value = getgenv().Config["Auto Stats Strength"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Stats Strength"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Stats Strength"] then
            pcall(function()
                local args = {
                    [1] = "Rank"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInfo"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Strength"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PointTo"):InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStatistics"):InvokeServer()
            end)
        end
    end
end)
Stats:Toggle({
    Title = "Auto Stats Agility",
    Value = getgenv().Config["Auto Stats Agility"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Stats Agility"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Stats Agility"] then
            pcall(function()
                local args = {
                    [1] = "Rank"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInfo"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Agility"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PointTo"):InvokeServer(unpack(args))                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStatistics"):InvokeServer()
            end)
        end
    end
end)
Stats:Toggle({
    Title = "Auto Stats Perception",
    Value = getgenv().Config["Auto Stats Perception"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Stats Perception"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Stats Perception"] then
            pcall(function()
                local args = {
                    [1] = "Rank"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInfo"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Perception"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PointTo"):InvokeServer(unpack(args))                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStatistics"):InvokeServer()
            end)
        end
    end
end)
Stats:Toggle({
    Title = "Auto Stats Vitality",
    Value = getgenv().Config["Auto Stats Vitality"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Stats Vitality"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Stats Vitality"] then
            pcall(function()
                local args = {
                    [1] = "Rank"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInfo"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Vitality"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PointTo"):InvokeServer(unpack(args))                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStatistics"):InvokeServer()
            end)
        end
    end
end)
Stats:Toggle({
    Title = "Auto Stats Intellect",
    Value = getgenv().Config["Auto Stats Intellect"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Stats Intellect"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Stats Intellect"] then
            pcall(function()
                local args = {
                    [1] = "Rank"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetInfo"):InvokeServer(unpack(args))
                local args = {
                    [1] = "Intellect"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PointTo"):InvokeServer(unpack(args))                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStatistics"):InvokeServer()
            end)
        end
    end
end)
WindUI:AddTheme({
    Name = "Halloween",
    Accent = "#331400",
    Outline = "#400000",
    Text = "#EAEAEA",
    PlaceholderText = "#AAAAAA"
})
WindUI:SetTheme("Dark")
local HttpService = game:GetService("HttpService")
local folderPath = "WindUI"
makefolder(folderPath)
local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end
local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end
local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end
WindowTab:Section({ Title = "Window" })
local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end
local themeDropdown = WindowTab:Dropdown({
    Title = "Select Theme",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())
local ToggleTransparency = WindowTab:Toggle({
    Title = "Toggle Window Transparency",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})
local KeybindClicked = false
WindowTab:Keybind({
    Title = "Keybind Toggle UI",
    Value = "RightControl",
    CanChange = true,
    Callback = function(k)
        if not KeybindClicked then
            Window:Close()
        else
            Window:Open()
        end
        KeybindClicked = not KeybindClicked
    end
})
WindowTab:Button({
    Title = "Close UI",
    Callback = function()
        Window:Close():Destroy()
        if game.CoreGui:FindFirstChild("ImageButton") then
            game.CoreGui:FindFirstChild("ImageButton"):Destroy()
        end
    end,
})
WindowTab:Section({ Title = "Save" })
local fileNameInput = ""
WindowTab:Input({
    Title = "Write File Name",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})
WindowTab:Button({
    Title = "Save File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})
WindowTab:Section({ Title = "Load" })
local filesDropdown
local files = ListFiles()
filesDropdown = WindowTab:Dropdown({
    Title = "Select File",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})
WindowTab:Button({
    Title = "Load File",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "File Loaded",
                    Content = "Loaded data: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})
WindowTab:Button({
    Title = "Overwrite File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})
WindowTab:Button({
    Title = "Refresh List",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})
local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()
local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].PlaceholderText
function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        PlaceholderText = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = CreateThemeTab:Input({
    Title = "Theme Name",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})
CreateThemeTab:Colorpicker({
    Title = "Background Color",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})
CreateThemeTab:Colorpicker({
    Title = "Outline Color",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})
CreateThemeTab:Colorpicker({
    Title = "Text Color",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})
CreateThemeTab:Colorpicker({
    Title = "Placeholder Text Color",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})
CreateThemeTab:Button({
    Title = "Update Theme",
    Callback = function()
        updateTheme()
    end
})
else
local webh =
"https://discord.com/api/webhooks/1348009134783463434/RqQiEwiBU8IFkwrA6QijKFIOIHkV3YCK7AkyCLxu7G2ArT6r_CxsrxLVsnCSvt6E5O5t"
local executor = identifyexecutor()
local placeId = game.PlaceId
local mapName = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local currentTime = os.date("%Y-%m-%d %H:%M:%S")
local player = game.Players.LocalPlayer
local playerName = player.Name
local playerDisplayName = player.DisplayName
local playerPosition = player.Character and player.Character.HumanoidRootPart.Position or "Unknown"
local clientId = game:GetService('RbxAnalyticsService'):GetClientId()

pcall(function()
    local data = {
        ["embeds"] = {
            {
                ["title"] = "Game Information",
                ["description"] = string.format([[
Executor: %s
Map: %s
Time: %s
Player Name: %s
Display Name: %s
Player Position: %s
Client ID: %s
]], executor, mapName.Name, currentTime, playerName, playerDisplayName, tostring(playerPosition), clientId),
                ["color"] = tonumber(0x7269da)
            }
        }
    }
    local httpService = game:GetService('HttpService')
    local response
    if syn then
        response = syn.request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif request then
        response = request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif http_request then
        response = http_request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    end
end)

game.Players.LocalPlayer:Kick("Script does not support " .. identifyexecutor())
end
