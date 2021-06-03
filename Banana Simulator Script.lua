local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/BananaSimulator/main/Banana%20Simulator.lua')))()
local w = library:CreateWindow("Banana Simulator")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoBuy")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")
local SelectedEgg = "CommonEgg"
Eggs = {}
for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    Eggs[i] = v.Name
end

b:Toggle("AutoClicker",function(bool)
    shared.toggle = bool
    AutoClicker = bool
end)
 
b:Toggle("AutoSell",function(bool)
    shared.toggle = bool
    AutoSell = bool
end)

b:Toggle("AutoTpCoins",function(bool)
    shared.toggle = bool
    AutoTpCoins = bool
end)

b:Toggle("AutoTpQuartzs",function(bool)
    shared.toggle = bool
    AutoTpQuartz = bool
end)

f:Toggle("Upgrade",function(bool)
    shared.toggle = bool
    AutoUpgrade = bool
end)

f:Toggle("Eggs",function(bool)
    shared.toggle = bool
    AutoEgg = bool
end)

f:Dropdown("Select Egg",Eggs,true,function(mob)
    SelectedEgg = mob
end)

e:Toggle("AntiAfk",function(boosl)
    shared.toggle = bool
    AntiAfk = bool
end)

e:Button("Gusse The Code",function()
    local text = 0
    function add()
        text = text + 1
    end
    for i=1,10000 do
        add()
        game:GetService("Players").LocalPlayer.PlayerGui.VaultGame.Frame.Search.Text = text
        firesignal(game:GetService("Players").LocalPlayer.PlayerGui.VaultGame.Frame.Click.MouseButton1Click)
    end
end)
--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)
 
u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)
 
while wait() do
    pcall(function()
        spawn(function()
            if AutoClicker == true then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.knit.src.Knit.Services.ClickService.RE.Click:FireServer()
            end
        end)
        
        spawn(function()
            if AutoSell == true then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.knit.src.Knit.Services.ExchangeService.RE.Sell:FireServer()
            end
        end)
        
        if AutoTpCoins == true then
            for i,v in pairs(game:GetService("Workspace").Coins:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    if AutoTpCoins == true then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,100))
                        wait(.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                        wait(.1)
                    end
                end
            end
        end
        
        if AutoTpQuartz == true then
            for i,v in pairs(game:GetService("Workspace").Quartz:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    if AutoTpQuartz == true then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,100))
                        wait(.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                        wait(.1)
                    end
                end
            end
        end
        
        if AutoEgg == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Eggs[SelectedEgg].Anchor.CFrame.Position + Vector3.new(0,0,0))
            wait()
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.knit.src.Knit.Services.PetService.RE.BuyEgg:FireServer(SelectedEgg,1)
            wait()
        end
        
        spawn(function()
            if AutoUpgrade == true then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.RobuxShop.Upgrade.ScrollingFrame:GetDescendants()) do
                    if v.Name == "UpgradeName" then
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.knit.src.Knit.Services.ExchangeService.RE.Upgrade:FireServer(v.Text)
                    end
                end
            end
        end)
        
        spawn(function()
            if AntiAfk == true then
                local bb=game:service'VirtualUser'
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
            end
        end)
    end)
end