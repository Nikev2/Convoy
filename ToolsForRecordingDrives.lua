------------------recordcardata.lua

local plr = game.Players.LocalPlayer
local Char=plr.Character
local Http = game:GetService("HttpService")
local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local Char=plr.Character
local Car = plr.Values.References.CarSeat.Value.Parent
local IsRecording = false
local filename = "DriveData.JSON"
local RecKey = Enum.KeyCode.BackSlash
local lib=loadstring(game:HttpGet("https://pastebin.com/raw/S023gV5f"))()
function Looping()
    
    local data = {}
    while IsRecording do
        wait(0.1)
        if IsRecording == false then 
        lib:SendNotif("Recording Has Ended","",3)
        _G.TableData = data 
       
        lib:SendNotif("Saved Data","",3)
        break end
        table.insert(data,Car.PrimaryPart.CFrame)
    end    
end    

function onInputBegan(Input, ischat) --------------
if Input.KeyCode==RecKey and ischat==false then 
    if IsRecording == true then
    
    IsRecording=false
     
    
    elseif IsRecording==false then
        
      IsRecording=true
      lib:SendNotif("Recording Has Started","",3)
      Looping()
     
   end
end    
end

if getgenv().kc == nil then
    getgenv().kc = UIS.InputBegan:Connect(onInputBegan)
    
  else
        print("Reconnecting")
    getgenv().kc:Disconnect()
    getgenv().kc = UIS.InputBegan:Connect(onInputBegan)
end    


-------convert drive data.lua

local data = _G.TableData
local http = game:GetService("HttpService")
function CFrameToTable(cf)
    return {cf:GetComponents()}
end 
function TableToCFrame(t)
    return CFrame.new(table.unpack(t))
end    
local CompleteData = {}
local CFrameData = {}
for i,v in pairs(data) do
    table.insert(CFrameData,CFrameToTable(v))
end    
CompleteData = {DriveData = CFrameData}
local JSON = http:JSONEncode(CompleteData)
local filename = "DriveData.JSON"
writefile(filename,JSON)


