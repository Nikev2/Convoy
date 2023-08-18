-----THE LYRICS TO CONVOY BY C.W. MCALL PLEASE ENJOY-----

--[[
Ah, breaker one-nine, this here's the Rubber Duck
You gotta copy on me, Pig Pen, c'mon?
Ah, yeah, 10-4, Pig Pen, fer sure, fer sure
By golly, it's clean clear to Flag Town, c'mon
Yeah, that's a big 10-4 there, Pig Pen
Yeah, we definitely got the front door, good buddy
Mercy sake's alive, looks like we got us a convoy
Was the dark of the moon on the sixth of June
In a Kenworth pullin' logs
Cab-over Pete with a reefer on
And a Jimmy haulin' hogs
We is headin' for bear on I-one-oh
'Bout a mile outta Shaky Town
I says, "Pig Pen, this here's the Rubber Duck"
"And I'm about to put the hammer down"
'Cause we got a little ol' convoy
Rockin' through the night
Yeah, we got a little ol' convoy
Ain't she a beautiful sight?
Come on and join our convoy
Ain't nothin' gonna get in our way
We gonna roll this truckin' convoy
'Cross the USA
Convoy (ah, breaker, Pig Pen, this here's the Duck)
And, you wanna back off them hogs? Convoy
Yeah, 10-4, 'bout five mile or so
Ten, roger, them hogs is gettin' intense up here
By the time we got into Tulsa Town
We had eighty-five trucks in all
But they's a roadblock up on the cloverleaf
And them bears was wall-to-wall
Yeah, them smokies is thick as bugs on a bumper
They even had a bear in the air
I says, "Callin' all trucks, this here's the Duck"
"We about to go a-huntin' bear"
'Cause we got a great big convoy
Rockin' through the night
Yeah, we got a great big convoy
Ain't she a beautiful sight?
Come on and join our convoy
Ain't nothin' gonna get in our way
We gonna roll this truckin' convoy
'Cross the USA
Convoy (ah, you wanna give me a 10-9 on that, Pig Pen?)
Convoy (negatory, Pig Pen, you're still too close)
Yeah, them hogs is startin' to close up my sinuses
Mercy sake's, you better back off another ten
Well, we rolled up Interstate 44
Like a rocket-sled on rails
We tore up all of our swindle sheets
And left 'em settin' on the scales
By the time we hit that Chi-town
Them bears was a-gettin' smart
They'd brought up some reinforcements
From the Illinois National Guard
There's armored cars, and tanks, and Jeeps
And rigs of every size
Yeah, them chicken coops was full o'bears
And choppers filled the skies
Well, we shot the line and we went for broke
With a thousand screamin' trucks
An' eleven long-haired Friends a' Jesus
In a chartreuse micra-bus
Ah, Rubber Duck to Sodbuster, come over
Yeah, 10-4, Sodbuster?
Listen, you wanna put that micra-bus in behind that suicide jockey?
Yeah, he's haulin' dynamite, and he needs all the help he can get
Well, we laid a strip for the Jersey shore
Prepared to cross the line
I could see the bridge was lined with bears
But I didn't have a doggoned dime
I says, "Pig Pen, this here's the Rubber Duck
"We just ain't a-gonna pay no toll"
So we crashed the gate doing ninety-eight
I says "Let them truckers roll, 10-4"
'Cause we got a mighty convoy
Rockin' through the night
Yeah, we got a mighty convoy
Ain't she a beautiful sight?
Come on and join our convoy
Ain't nothin' gonna get in our way
We gonna roll this truckin' convoy
'Cross the USA
Convoy (ah, 10-4, Pig Pen, what's your twenty?)
Convoy (Omaha? Well, they oughta know what to do with them hogs out there fer sure)
Convoy (well, mercy sake's, good buddy, we gonna back on outta here, so keep the bugs off your glass and the bears)
Convoy (off your tail, we'll catch you on the flip-flop, this here's the Rubber Duck on the side)
Convoy (we gone, 'bye, 'bye)
--]]

















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
