local Routes="https://raw.githubusercontent.com/Nikev2/Convoy/main/CW_McCall/"
function SendNotif(title, text)
    game.StarterGui:SetCore("SendNotification", {Title = title,Text = text,Duration = 5})
end
local FileNames={
    "BoxTruck_KensCargoGeneral_KensBullseye.UDCF",
    "BoxTruck_KensCargoGeneral_SouthBeachAirStrip.UDCF",
    "BoxTruck_WestoverWarehouse_Hospital.UDCF",
    "BoxTruck_WestoverWarehouse_KensBullseye.UDCF",
    "BoxTruck_WestoverWarehouse_SouthBeachAirStrip.UDCF",
    "BoxTruck_WestoverWarehouse_WestonOne.UDCF",
    "CementMixer_SouthBeachCement_CapeHenlopenWindFarm.UDCF",
    "NukeTruck_SouthBeachAirStrip_WestoverVault.UDCF",
}
local PosFile="TruckPosConfigs.UDCF"
local FileSize="2.4 MB"
if isfolder("UD_Main") then
    delfolder("UD_Main")
end
if isfile("TruckPosConfigs.UDCF") then
    delfile("TruckPosConfigs.UDCF")
end




local ConvoyLoader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Info = Instance.new("TextLabel")
local CurrentFile = Instance.new("TextLabel")

function rstr(len)
    local str=""
    for i=1,len do
        local rand=string.char(math.random(0x21,0x7E))
        str=str..rand
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

local Loading=true
spawn(function()
    repeat 
    
    local mt="Importing Route Files (Total 2.4 MB)"
    ConvoyLoader.Frame:FindFirstChild("Info").Text=tostring(mt..".")
    wait(0.3)
    ConvoyLoader.Frame:FindFirstChild("Info").Text=tostring(mt.."..")
    wait(0.3)
    ConvoyLoader.Frame:FindFirstChild("Info").Text=tostring(mt.."...")
    wait(0.3)
    
    until Loading==false
end)
makefolder("UD_Main")
local RoutePath="UD_Main/"
for i,file in pairs(FileNames) do
    CurrentFile.Text=file
    local f=game:HttpGetAsync(Routes..file)
    writefile(RoutePath..file,f)
end
writefile(PosFile,
game:HttpGetAsync("https://raw.githubusercontent.com/Nikev2/Convoy/main/TruckPosConfigs.UDCF")
)
SendNotif("Done Installing","")
Loading=false
ConvoyLoader:Destroy()