
local http=game:GetService("HttpService")
local autofarminit=game:HttpGetAsync("https://raw.githubusercontent.com/Nikev2/Convoy/main/ConvoyMain.lua")



function SendNotif(title, text)
    game.StarterGui:SetCore("SendNotification", {Title = title,Text = text,Duration = 5})
end

local NeedsUpdate=false
local GitVer=game:HttpGetAsync("https://raw.githubusercontent.com/Nikev2/Convoy/main/.VER")
local RegularVer
if not isfile(".VER") or not isfile("VER.txt") then 
    NeedsUpdate=true 
else
    RegularVer=readfile(".VER")
    if RegularVer==GitVer then
        NeedsUpdate=false
    else
        NeedsUpdate=true
    end  
end




if NeedsUpdate then
    local ConvoyLoader = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local UICorner_2 = Instance.new("UICorner")
    local Info = Instance.new("TextLabel")
    local CurrentFile = Instance.new("TextLabel")

    local function formatBytes(bytes)
        local units = {"B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"}
        local base = 1000

        if bytes == 0 then
            return "0 B"
        end

        local i = 1
        while bytes >= base and i < #units do
            bytes = bytes / base
            i = i + 1
        end

        return string.format("%.2f %s", bytes, units[i])
    end

    local function rstr(len)
        local str = ""
        for i = 1, len do
            local rand = string.char(math.random(0x21, 0x7E))
            str = str .. rand
        end
        return str
    end

    ConvoyLoader.Name = rstr(30)
    ConvoyLoader.Parent = game.CoreGui
    ConvoyLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ConvoyLoader
    Frame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.377589464, 0, 0.385779113, 0)
    Frame.Size = UDim2.new(0.243879467, 0, 0.22692889, 0)

    UICorner.Parent = Frame

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(126, 126, 126)
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.142857149, 0, 0, 0)
    Title.Size = UDim2.new(0, 185, 0, 35)
    Title.Font = Enum.Font.SciFi
    Title.Text = "Convoy"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true

    UICorner_2.Parent = Title

    Info.Name = "Info"
    Info.Parent = Frame
    Info.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
    Info.BackgroundTransparency = 1.000
    Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Info.BorderSizePixel = 0
    Info.Position = UDim2.new(0.142857149, 0, 0.379999995, 0)
    Info.Size = UDim2.new(0, 185, 0, 35)
    Info.Font = Enum.Font.SciFi
    Info.Text = "Loading"
    Info.TextColor3 = Color3.fromRGB(255, 255, 255)
    Info.TextScaled = true
    Info.TextSize = 14.000
    Info.TextWrapped = true

    CurrentFile.Name = "CurrentFile"
    CurrentFile.Parent = Frame
    CurrentFile.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
    CurrentFile.BackgroundTransparency = 1.000
    CurrentFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CurrentFile.BorderSizePixel = 0
    CurrentFile.Position = UDim2.new(0.142857149, 0, 0.706666648, 0)
    CurrentFile.Size = UDim2.new(0, 185, 0, 35)
    CurrentFile.Font = Enum.Font.SciFi
    CurrentFile.Text = "CurrentFile"
    CurrentFile.TextColor3 = Color3.fromRGB(255, 255, 255)
    CurrentFile.TextScaled = true
    CurrentFile.TextSize = 14.000
    CurrentFile.TextWrapped = true
    if not isfolder("UD_Main") then makefolder("UD_Main") end
    
    local RoutePath = "UD_Main/"
    local f1 = http:JSONDecode(game:HttpGetAsync("https://api.github.com/repos/Nikev2/Convoy/contents/CW_McCall"))
    local f2 = http:JSONDecode(game:HttpGetAsync("https://api.github.com/repos/Nikev2/Convoy/contents"))
    local t = ConvoyLoader.Frame:FindFirstChild("Info")
    local Size = 0
    local TotalFiles=0
    t.Text = "Checking Files"
    CurrentFile.Text=""
    for i, v in pairs(f1) do
        local l = game:HttpGetAsync(v.download_url)
        if not isfile(RoutePath .. v.name) then
            Size = Size + v.size
            t.Text = formatBytes(Size)
            CurrentFile.Text = v.name
            writefile(RoutePath .. v.name, l)
        else
            if l~=readfile(RoutePath .. v.name) then
                
                delfile(v.name)
                Size = Size + v.size
                t.Text = formatBytes(Size)
                CurrentFile.Text = v.name
                writefile(RoutePath .. v.name, l)
            end
        end
    end
    for i, v in pairs(f2) do
        
        if not string.find(v.name, ".lua") and v['type'] ~= "dir" and not string.find(v.name, ".md") then
            
            local l = game:HttpGetAsync(v.download_url)
            if not isfile(v.name) then
                Size = Size + v.size
                t.Text = formatBytes(Size)
                CurrentFile.Text = v.name
                writefile(v.name, l)
            else
                if l~=readfile(v.name) then
                    delfile(v.name)
                    Size = Size + v.size
                    t.Text = formatBytes(Size)
                    CurrentFile.Text = v.name
                    writefile(v.name, l)
                end
            end
        end
    end

    t.Text = "Done Loading"
    CurrentFile.Text = ""
    wait(2)
    ConvoyLoader:Destroy()
end




local Lib = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()
local UI = Lib:Create{
   Theme = "Dark",
   Size = UDim2.new(0, 555, 0, 400) 
}
local main = UI:Tab{
   Name = "Auto Farm"
}
local ValidTrucks=UI:Tab{
   Name = "Valid Truck List"
}
local ValidTrucksList=ValidTrucks:Divider{
    Name="List of valid trucks"
}
local Info=UI:Tab{
   Name = "READ ME"
}
local Rules=Info:Divider{
    Name="IMPORTANT RULES",
}
local Instructions=Info:Divider{
    Name="Instructions"
}
--"https://www.youtube.com/@nikolaievans2432/about"
Rules:Button{
    Name="SHARING THIS SCRIPT IS ALLOWED WITH SOME RULES...",
    Callback=function()

    end
}
Rules:Button{
    Name="You can share this on any social media page and script website",
    Callback=function()

    end
}
Rules:Button{
    Name="Link the github script directly in the descripion",
    Callback=function()

    end
}
Rules:Button{
    Name="You will NOT put this behind an adwall Like Work.Ink or Linkvertise",
    Callback=function()

    end
}
Rules:Button{
    Name="You will use this to gain followers/suscribers through stuff like boost me",
    Callback=function()

    end
}
Rules:Button{
    Name="And last you will credit me",
    Callback=function()

    end
}
Rules:Button{
    Name="I want this to be a free script that everyone can use without hassle",
    Callback=function()

    end
}
local Main=main:Divider{
    Name="Main"
}
Main:Button{
    Name="Start Auto Farming",
    Description="Must be in a valid truck check Valud Truck List",
    Callback=function()
        loadstring(autofarminit)()
    end
}
Main:Button{
    Name="Note that it will spam loading truck until the truck is loaded this is normal",
    Callback=function()
        
    end
}
Main:Button{
    Name="To quit autofarming destroy your car and reset character",
    Callback=function()
        
    end
}
Instructions:Button{
    Name="Join the Trucker team",
    Callback= function()

    end
}
Instructions:Button{
    Name="Join the Trucker team",
    Callback= function()
        
    end
}
Instructions:Button{
    Name="Pick and get in valid truck",
    Callback= function()
        
    end
}
Instructions:Button{
    Name="Press Auto Farm",
    Callback= function()
        
    end
}
Instructions:Button{
    Name="Profit :troll-face:",
    Callback= function()
        
    end
}
local Credits=UI:Tab{
    Name="Credits"
}
local ScriptCredits=Credits:Divider{
    Name="Auto Farm: Nikolai",
}
ScriptCredits:Button{
    Name="YouTube: https://www.youtube.com/@nikolaievans2432",
    Callback=function() end
}
ScriptCredits:Button{
    Name="Github: https://github.com/Nikev2",
    Callback=function() end
}
ScriptCredits:Button{
    Name="Reddit: u/PC_Defender",
    Callback=function() end
}
ScriptCredits:Button{
    Name="Discord Profile: pcdefender, and .pcdefender",
    Callback=function() end
}

local UIScriptCredits=Credits:Divider{
    Name="UI Script: 7yhx on GitHub"
}

UIScriptCredits:Button{
 Name=" Github: https://github.com/7yhx",
 Callback=function() end
}
local Quit=main:Divider{
    Name="Quit",
}
Quit:Button{
    Name="Quit (Destroy UI)",
    Callback=function()
        UI:Quit{Message="Destroyed",Length=2}
    end
}
local Supported={
    "Polk B8000-LD",
    "Worldwide Nuke Truck",
    "Polk Cement Mixer",
    "T75 Refridgerated Truck"
}
for i,v in pairs(Supported) do
    ValidTrucksList:Button{
        Name=v,
        Callback=function()

        end
    }
end
