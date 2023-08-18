function SendNotif(title, text, delay)
    game.StarterGui:SetCore("SendNotification", {Title = title,Text = text,Duration = delay})
end;
function containsKey(table, key)
    return table[key] ~= nil
end

local PartTargets={
CementMixer="Fill_Rough"
}
function containsValue(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end
function TableToCFrame(t)
    return CFrame.new(table.unpack(t))
end  
function splitString(inputString)
    local parts = {}
    for part in inputString:gmatch("([^_]+)") do
        table.insert(parts, part)
    end
    return parts
end

local plr=game.Players.LocalPlayer
function RemoveNumbers(str)
    str=str:gsub("%d+", "")
    return str
end
print('done')
local ValidTrucks
local Car = plr.Values.References.CarSeat.Value.Parent
local BoxTruckJobs={}
local pos=Car
local Char=plr.Character
local prompt=Char.HumanoidRootPart.CharacterPrompt
--21
function cframeToTable(cf)
	return {cf:GetComponents()};
end
local Jobs=plr.Tasks.Trucker.Available:GetChildren()
local TruckPosConfigs={
    BoxTruck={
        KensCargoGeneral3={CFrame.new(-12728.4287109375,8.126981735229493,456.4320983886719,-0.24505941569805146,0.0073822662234306339,-0.9694799780845642,-0.00006777226371923462,0.9999708533287048,0.007631575223058462,0.9695080518722534,0.0019358932040631772,-0.2450517863035202):GetComponents()},
        KensCargoGeneral2={CFrame.new(-12741.013671875,8.127436637878418,471.239990234375,-0.21189428865909577,0.007516026962548494,-0.9772636890411377,-0.0000726924990885891,0.9999703168869019,0.007706422358751297,0.9772925972938538,0.0017039865488186479,-0.2118874490261078):GetComponents()},
        KensCargoGeneral1={CFrame.new(-12727.037109375,8.131674766540528,496.8291931152344,-0.12001226842403412,0.008035905659198761,-0.9927398562431336,-0.0012360593536868692,0.999965250492096,0.008243819698691368,0.9927716255187988,0.0022164450492709877,-0.11999816447496414):GetComponents()},
        WestoverWarehouse1={CFrame.new(-1642.2393798828126,29.678251266479493,7552.6962890625,0.7607551217079163,0.005302357487380505,-0.6490173935890198,-0.0003269125008955598,0.9999696612358093,0.007786380127072334,0.6490389704704285,-0.005711356643587351,0.7607337236404419):GetComponents()},
        WestoverWarehouse2={CFrame.new(-952.8877563476563,58.57747268676758,7739.734375,-0.8270548582077026,0.004378186073154211,-0.5621041655540466,0.000012271480954950676,0.9999697804450989,0.007770632393658161,0.5621212124824524,0.006419841665774584,-0.8270299434661865):GetComponents()},
        WestoverWarehouse3={CFrame.new(-1959.745849609375,29.677370071411134,7206.3505859375,0.6538671851158142,0.0058888886123895649,-0.7565864324569702,-0.00008273780986201018,0.9999702572822571,0.0077117616310715679,0.756609320640564,-0.0049798693507909779,0.6538482308387756):GetComponents()},
        KensYeetberry={CFrame.new(-4973.22900390625,12.89314079284668,604.4898071289063,0.12408115714788437,-0.0017965389415621758,0.9922704696655273,-0.05209983140230179,0.9986072182655335,0.00832297746092081,-0.990903377532959,-0.05272984877228737,0.12381473928689957):GetComponents()},
        SouthBeachAirStrip={CFrame.new(-14819.568359375,9.849380493164063,-5204.9365234375,0.35680171847343447,0.0076073287054896359,-0.9341491460800171,0.0002881915424950421,0.9999659061431885,0.008253389038145543,0.9341800808906555,-0.0032140372786670925,0.3567873537540436):GetComponents()},
        KensBullseye1={CFrame.new(-3653.59130859375,12.376916885375977,1669.1546630859376,-0.9577875137329102,-0.0016300134593620897,0.28747254610061648,0.0010107444832101465,0.9999586343765259,0.009037469513714314,-0.2874753773212433,0.008946537040174008,-0.9577462673187256):GetComponents()},
        Hospital={CFrame.new(-4569.111328125,12.981162071228028,2025.9447021484376,0.9925415515899658,0.0009978767484426499,-0.12190265953540802,-0.00006766869046259671,0.9999708533287048,0.007634645793586969,0.12190672755241394,-0.0075694541446864609,0.9925127029418945):GetComponents()},
        WestoverUDMerch={CFrame.new(1444.142822265625,61.58610153198242,5960.978515625,-0.17901283502578736,0.008282190188765526,-0.9838118553161621,-0.0017192686209455133,0.9999604225158691,0.00873097125440836,0.9838452339172363,0.003254392882809043,-0.17899151146411897):GetComponents()},
    },
    NukeTruck={
        SouthBeachAirStrip={(CFrame.new(-14924.8525, 11.0632858, -5167.38184, -0.334361166, -0.00279929535, 0.942440867, -0.00026064791, 0.999995828, 0.00287777558, -0.94244498, 0.000716571114, -0.33436048)*CFrame.new(0,8,0)):GetComponents()},
        WestoverVault={CFrame.new(-552.054993, 34.1276131, 7654.69434, 0.971614242, -0.00136908761, 0.236566812, 0.00125398836, 0.999998987, 0.000637001067, -0.236567453, -0.000322267297, 0.971615016):GetComponents()}
    }
}
--local CurrentJob=plr.Tasks.Trucker.Active:FindFirstChild("Trucker")
--local Dest=CurrentJob.Destination.Value
--local Origin=CurrentJob.Origin.Value

local http = game:GetService("HttpService")
local PosConfigFile=readfile("TruckPosConfigs.UDCF")
local PosConfig=http:JSONDecode(PosConfigFile)
local Goods={
    NukeTruck={"Missile"},
    BoxTruck={
    "Jeans",
    "Candy",
    "TShirts",
    "Toilets",
    "CellPhones",
    "Medicine",
    "GraphicsCards",
    "Bread","Shorts",
    "Milk",
    "TVs",
    "Sinks",
    "Jeans",
    "Flour",
    "WashingMachines",
    "Lawnmowers",
    "Bread",
    "ToiletPaper",
    "ComputerMonitors"
    },
    DumpTruck={
        "IronOre",
        "RoadSalt",
        "Soil",
        "Coal",
        "Soil",
    },
    CementMixer={
        "Cement",
    }
}
function GetJob()
    
    local function start(Task)
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("TruckShipping",{"StartTask",Task})
    end
    local Jobs=plr.Tasks.Trucker.Available:GetChildren()
    local ValidGoods
    if containsKey(Goods,Car.Name) then
        ValidGoods=Goods[Car.Name]
    else return false
    end
    local JobsGreatestToLeast = {}

    for i, Job in pairs(Jobs) do
        local val = Job.RewardCash.Value
        table.insert(JobsGreatestToLeast, { Job = Job, Value = val })
    end
        table.sort(JobsGreatestToLeast, function(a, b)
        return a.Value > b.Value
    end)
    local ChosenJob
    for i,v in pairs(JobsGreatestToLeast) do
        local Job=v.Job
        local Good=v.Job.Good.Type.Value
        if containsValue(ValidGoods,Good) then
            ChosenJob=Job
            break
        end
    end
    if ChosenJob==nil then return false end
    local files={}
    local RouteFile
    local EndLoop=false
    for i,fname in pairs(listfiles("UD_Main")) do
        local filename=string.gsub(fname, "[^/]+\\", "")
        local s=splitString(filename)
        local Truck,Origin,Dest=s[1],s[2],s[3]:gsub("%..*", "")
        if EndLoop then break end
        Origin=RemoveNumbers(s[2])
        Dest=RemoveNumbers(s[3]:gsub("%..*", ""))
        
        if Truck==Car.Name then
            local CurrentJob=ChosenJob
            for _,j in pairs(JobsGreatestToLeast) do
                job=j.Job
                if RemoveNumbers(job.Origin.Value)==Origin then
                    
                    if RemoveNumbers(job.Destination.Value)==Dest then
                        ChosenJob=job
                        RouteFile=http:JSONDecode(readfile(fname))
                        EndLoop=true
                        break
                    end
                end
            end
        end
    end
    if RouteFile==nil then return false end
    if not (PosConfig[Car.Name]~=nil) then return false end
    local Dest
    local Origin
    for i,v in pairs(PosConfig[Car.Name]) do
        if ChosenJob.Destination.Value==i then
            Dest=CFrame.new(table.unpack(v))
        end
        if ChosenJob.Origin.Value==i then
            Origin=CFrame.new(table.unpack(v))
        end
    end
    if Dest==nil or Origin==nil then return false end
    start(ChosenJob)
    return {Route=RouteFile,Dest=Dest,Origin=Origin}
end
if GetJob()==false then SendNotif("Error","Could not get job that job or vehicle isnt fully devloped try getting another vechicle", 5) return end

local Cargo=Car.Core:FindFirstChild("Cargo")
local Core=Car.Core
local TikTime=0.0001
local DoesNotUseCargo=false
if not Cargo then DoesNotUseCargo=true end
while task.wait() do
    local Job=GetJob()
    if not Job==nil then SendNotif("Error","") break end
    if not Job then  SendNotif("Error","Could not find anymore jobs for this truck", 5)   break   end
    Car:SetPrimaryPartCFrame(Job.Origin)
    while task.wait() do --- To make sure the cargo loads and doesn't bug
     local p =Char.HumanoidRootPart.CharacterPrompt
        
        if DoesNotUseCargo then 
            local Part=Core[PartTargets[Car.Name]]

             if Part.Transparency==1 then
                if p.Enabled==true then
                    fireproximityprompt(p)
                end 
            else break
            end
        else 
            if p.Enabled==true then
                if #Cargo:GetChildren()==0 then
                fireproximityprompt(p)
                elseif #Cargo:GetChildren()>=1 then
                break 
            end
            elseif p.Enabled==false then
                if #Cargo:GetChildren()>=1 then --- Double checks cargo is in
                     break
                 end
            end
        end
    
    end

    for i,v in pairs(Job.Route.DriveData) do
    Car:SetPrimaryPartCFrame(TableToCFrame(v)) 
    wait(TickTime)
    end 

    Car:SetPrimaryPartCFrame(Job.Dest)
    while task.wait() do --- To make sure the cargo loads and doesn't bug
    local ActiveJob=plr.Tasks.Trucker.Active:GetChildren()

     local p =Char.HumanoidRootPart.CharacterPrompt
        
        if DoesNotUseCargo then 
            local Part=Core[PartTargets[Car.Name]]
             if Part.Transparency==0 then
                if p.Enabled==true then
                    fireproximityprompt(p)
                end 
            else break
            end
        else 
            if p.Enabled==true then
                if #Cargo:GetChildren()>=1 then
                fireproximityprompt(p)
                elseif #Cargo:GetChildren()==0 then
                break 
            end
            elseif p.Enabled==false then
                if #Cargo:GetChildren()==0 then --- Double checks cargo is in
                     break
                 end
            end
        end
    
    end  
end
