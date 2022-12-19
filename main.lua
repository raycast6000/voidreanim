xpcall(function()
local Player = game.Players.LocalPlayer
local Character = workspace[Player.Name]

local RunService = game["Run Service"]
local PhysicsStepped = RunService.Stepped

Character.Archivable = true

local voidChar = Character:Clone()
voidChar.Parent = workspace
voidChar.Name = "raycast is god fr"

voidChar.Humanoid:Destroy()

for _,v in pairs(voidChar:GetDescendants()) do
   if v:isA("BasePart") and not v.Anchored then
       v.Anchored = true
   end
end

local fakeChar = Instance.new("Model", workspace)

Instance.new("Part", fakeChar).Name = "Head"
Instance.new("Part", fakeChar).Name = "Torso"
Instance.new("Part", fakeChar).Name = "HumanoidRootPart"

local firstH = Instance.new("Humanoid", fakeChar)
local secondH = Instance.new("Humanoid", fakeChar)
secondH.Health = 0

Player.Character = fakeChar
wait(2)
firstH:Destroy()
Player.Character = Character
wait(3)
Character.Humanoid.Health = 0

VOIDCHARLOOP = PhysicsStepped:Connect(function()
   for _,v in pairs(voidChar:GetDescendants()) do
       if v:isA("BasePart") then
          v.CanCollide = false
          v.Transparency = 1
       end
   end
end)

function reanimate(part1, part2)
   local attachment0 = Instance.new("Attachment", part1);attachment0.Name = "Connect0"
   local attachment1 = Instance.new("Attachment", part2);attachment1.Name = "Connect1"
   
   attachment1.Orientation = Vector3.new(0,0,0)
   attachment1.Position = Vector3.new(0,0,0)
   
   local alignPos = Instance.new("AlignPosition", part1)
   alignPos.Name = part1.Name .. "_POS"
   alignPos.ApplyAtCenterOfMass = true
   alignPos.MaxVelocity = 125069
   alignPos.Responsiveness = 255
   alignPos.Attachment0 = attachment0
   alignPos.Attachment1 = attachment1
   
   local alignOri = Instance.new("AlignOrientation", part1)
   alignOri.Name = part1.Name .. "_ORI"
   alignOri.MaxTorque = 125069
   alignOri.Responsiveness = 255
   alignOri.Attachment0 = attachment0
   alignOri.Attachment1 = attachment1
end

wait(3)

Player.Character = voidChar

wait(1)

Instance.new("Humanoid", voidChar)

for _,v in pairs(voidChar:GetDescendants()) do
   if v:isA("BasePart") and v.Anchored then
      v.Anchored = false 
   end
end

for _,v in pairs(Character:GetDescendants()) do
   if v:isA("BasePart") and v.Parent:isA("Accessory") then
      reanimate(v, voidChar[v.Parent.Name].Handle)
   elseif v:isA("BasePart") and not v.Parent:isA("Accessory") then
      reanimate(v, voidChar[v.Name])
   end
end


CHARLOOP = PhysicsStepped:Connect(function()
    for _,v in pairs(Character:GetDescendants()) do
       if v:isA("BasePart") then
          v.CanCollide = false
       end
   end 
end)
end, function(e)
    print(e)
end)