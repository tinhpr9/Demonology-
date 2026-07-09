local v_u_1 = script.Parent.Parent
v_u_1:GetMouse()
repeat
	wait()
until v_u_1.Character
local v_u_2 = v_u_1.Character
local _ = workspace.CurrentCamera
local v_u_3 = v_u_1:WaitForChild("PlayerGui")
local v_u_4 = 1
local v_u_5 = v_u_2:WaitForChild("Humanoid")
table.foreach(v_u_5:GetPlayingAnimationTracks(), function(_, p6)
	p6:Stop()
end)
if v_u_2:FindFirstChild("Animate") then
	v_u_2:FindFirstChild("Animate"):Destroy()
end
local v7 = v_u_2.Head:WaitForChild("Container")
local v_u_8 = v_u_2:WaitForChild("silenced")
local v_u_9 = v_u_2.Torso:WaitForChild("woosh")
local v_u_10 = v_u_2.Torso:WaitForChild("voiceline")
local v_u_11 = v_u_2.Torso:WaitForChild("Menacing")
local v_u_12 = v_u_2.Torso:WaitForChild("summonstand")
local v13 = game:GetService("UserInputService")
local v_u_14 = game:GetService("ReplicatedStorage").Logic.sendjoints
local _ = game:GetService("ReplicatedStorage").Logic.receivejoints
local v_u_15 = game:GetService("ReplicatedStorage").Logic.hitbox
local v_u_16 = game:GetService("ReplicatedStorage").Logic.misc
local v_u_17 = game:GetService("ReplicatedStorage").Specials.timeerasure
local v18 = v_u_1:WaitForChild("Blessing").Value == "Holy" and 0.7 or 1
local v_u_19 = v_u_1:HasTag("nocd") and 0 or v18
local v_u_20 = true
local v_u_21 = false
local v_u_22 = false
v_u_16:FireServer(5, v_u_5, 16)
local v_u_23 = v7:WaitForChild("Stand")
local v_u_24 = {
	v_u_2.HumanoidRootPart.RootJoint,
	v_u_2.Torso.Neck,
	v_u_2.Torso["Left Shoulder"],
	v_u_2.Torso["Right Shoulder"],
	v_u_2.Torso["Left Hip"],
	v_u_2.Torso["Right Hip"]
}
local v_u_25 = v_u_23.Torso:WaitForChild("ora")
local v_u_26 = v_u_23.Torso:WaitForChild("singleora")
v_u_2.Torso:WaitForChild("specialsound")
v_u_2.Torso:WaitForChild("specialsound2")
v_u_23.Torso:WaitForChild("punch")
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = {
	v_u_23:WaitForChild("Torso").Neck,
	v_u_23:WaitForChild("Torso")["Left Shoulder"],
	v_u_23:WaitForChild("Torso")["Right Shoulder"],
	v_u_23:WaitForChild("Torso")["Left Hip"],
	v_u_23:WaitForChild("Torso")["Right Hip"]
}
local v_u_30 = v_u_23:WaitForChild("Torso")
local v_u_31 = v_u_29[1].C0
local v_u_32 = v_u_29[2].C0
local v_u_33 = v_u_29[3].C0
local v_u_34 = v_u_29[4].C0
local v_u_35 = v_u_29[5].C0
local v_u_36 = {
	v_u_31,
	v_u_32,
	v_u_33,
	v_u_34,
	v_u_35,
	v_u_30
}
local v_u_37 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local v_u_38 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local v_u_39 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
local v_u_40 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
local v_u_41 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
local v_u_42 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
local v_u_43 = 0
local v_u_44 = 0
local v_u_45 = 0.02
local v_u_46 = 0
local v_u_47 = false
local v_u_48 = 0
local v_u_49 = 0
local v_u_50 = false
local v_u_51 = false
local v_u_52 = false
local v_u_53 = 1
local v_u_54 = v_u_5.Health
local v_u_55 = true
local v_u_56 = 0
local v_u_57 = false
local v_u_58 = false
local v_u_59 = 0
local v_u_60 = 0
local v_u_61 = v_u_2:WaitForChild("isdodge")
local v_u_62 = 0
local v_u_63 = 0
local v_u_64 = false
local v_u_65 = v_u_2:GetAttribute("Running")
local v_u_66 = v_u_1:WaitForChild("IsHamon").Value
local v_u_67 = true
local v_u_68 = true
local v_u_69 = false
coroutine.wrap(function()
	_G.indicatecooldown("Time Erase", v_u_19 * 15)
	wait(v_u_19 * 15)
	v_u_69 = true
end)()
local v_u_70 = true
local v_u_71 = true
local v_u_72 = true
local v_u_73 = true
local v_u_74 = true
local v_u_75 = true
local v_u_76 = false
function randomangle(p77)
	if not p77 then
		return math.random(-6.283185307179586, 6.283185307179586)
	end
	local v78 = math.random
	local v79 = -p77
	return v78(math.rad(v79), (math.rad(p77)))
end
function GetAxis(p80, p81)
	local v82 = {
		(p80[2] - p80[1]).unit,
		(p80[3] - p80[1]).unit,
		(p80[5] - p80[1]).unit,
		(p81[2] - p81[1]).unit,
		(p81[3] - p81[1]).unit,
		(p81[5] - p81[1]).unit
	}
	v82[7] = v82[1]:Cross(v82[4]).unit
	v82[8] = v82[1]:Cross(v82[5]).unit
	v82[9] = v82[1]:Cross(v82[6]).unit
	v82[10] = v82[2]:Cross(v82[4]).unit
	v82[11] = v82[2]:Cross(v82[5]).unit
	v82[12] = v82[2]:Cross(v82[6]).unit
	v82[13] = v82[3]:Cross(v82[4]).unit
	v82[14] = v82[3]:Cross(v82[5]).unit
	v82[15] = v82[3]:Cross(v82[6]).unit
	return v82
end
function TestAxis(p83, p84, p85, p86)
	if p85.Magnitude == 0 or tostring(p85) == "NAN, NAN, NAN" then
		return true
	end
	local v87 = {}
	local v88 = {}
	for v89 = 1, 8 do
		local v90 = p83[v89]
		table.insert(v87, v90:Dot(p85))
		local v91 = p84[v89]
		table.insert(v88, v91:Dot(p85))
	end
	local v92 = unpack
	local v93 = math.max(v92(v87))
	local v94 = unpack
	local v95 = math.min(v94(v87))
	local v96 = unpack
	local v97 = math.max(v96(v88))
	local v98 = unpack
	local v99 = math.min(v98(v88))
	local v100 = math.max(v93, v97) - math.min(v95, v99)
	local v101 = v93 - v95 + v97 - v99
	local v102 = nil
	local v103
	if p86 then
		v103 = v100 <= v101
	else
		v103 = v100 < v101
	end
	if v103 then
		v102 = p85 * (v97 < v93 and -(v97 - v95) or v93 - v99)
	end
	return v103, v102
end
function GetCorners(p104, p105)
	local v106 = p105 / 2
	local v107 = {}
	for v108 = -1, 1, 2 do
		for v109 = -1, 1, 2 do
			local v110 = (p104 * CFrame.new(v106 * Vector3.new(v108, v109, -1))).p
			table.insert(v107, v110)
			local v111 = (p104 * CFrame.new(v106 * Vector3.new(v108, v109, 1))).p
			table.insert(v107, v111)
		end
	end
	return v107
end
function NewRegion(p112, p113)
	local v114 = setmetatable({}, {
		["__index"] = {}
	})
	v114.surfaceCountsAsCollision = true
	v114.cframe = p112
	v114.Size = p113
	v114.planes = {}
	v114.corners = GetCorners(v114.cframe, v114.Size)
	if _G.showhitboxes == true then
		local v115 = Instance.new("Part")
		v115.Size = v114.Size
		v115.CFrame = v114.cframe
		v115.Anchored = true
		v115.CanQuery = false
		v115.CanCollide = false
		v115.Transparency = 0.5
		v115.Color = Color3.fromRGB(255, 0, 0)
		v115.Material = Enum.Material.ForceField
		v115.Parent = workspace
		game.Debris:AddItem(v115, 5)
	end
	local v116 = next
	local v117, v118 = Enum.NormalId:GetEnumItems()
	for _, v119 in v116, v117, v118 do
		local v120 = Vector3.FromNormalId(v119)
		local v121 = v114.cframe:vectorToWorldSpace(v120)
		local v122 = (v120 * v114.Size / 2).magnitude
		local v123 = v114.cframe.p + v121 * v122
		local v124 = v114.planes
		table.insert(v124, {
			["normal"] = v121,
			["point"] = v123
		})
	end
	return v114
end
function ShallowCopy(p125)
	local v126 = {}
	for v127, v128 in next, p125 do
		v126[v127] = v128
	end
	return v126
end
function CastPart(p129, p130)
	local v131 = p130.corners
	local v132 = GetCorners(p129.CFrame, p129.Size)
	local v133 = GetAxis(v131, v132)
	local v134 = {}
	for v135 = 1, #v133 do
		local v136, v137 = TestAxis(v131, v132, v133[v135], p130.surfaceCountsAsCollision)
		if not v136 then
			return false, Vector3.new()
		end
		if v137 then
			table.insert(v134, v137)
		end
	end
	table.sort(v134, function(p138, p139)
		return p138.magnitude < p139.magnitude
	end)
	return true, v134[1]
end
function CastRegion(p140, p141, p142)
	local v143 = type(p140) == "table" and p140 and p140 or { p140 }
	local v144 = ShallowCopy(p142.corners)
	local v145 = {}
	local v146 = {}
	local v147 = p141 or 20
	for _, v148 in next, { Enum.NormalId.Right, Enum.NormalId.Top, Enum.NormalId.Back } do
		local v_u_149 = Vector3.FromNormalId(v148)
		table.sort(v144, function(p150, p151)
			return p150:Dot(v_u_149) > p151:Dot(v_u_149)
		end)
		local v152 = v144[#v144]
		table.insert(v145, v152)
		local v153 = v144[1]
		table.insert(v146, v153)
	end
	local v154 = v145[1].x
	local v155 = v145[2].y
	local v156 = v145[3].z
	local v157 = Vector3.new(v154, v155, v156)
	local v158 = v146[1].x
	local v159 = v146[2].y
	local v160 = v146[3].z
	local v161 = Vector3.new(v158, v159, v160)
	local v162 = Region3.new(v157, v161)
	local v163 = game.Workspace:FindPartsInRegion3WithIgnoreList(v162, v143, v147)
	local v164 = {}
	for _, v165 in next, v163 do
		if CastPart(v165, p142) then
			table.insert(v164, v165)
		end
	end
	return v164
end
if workspace.timestopped.Value == true then
	v_u_2.Torso.Anchored = true
end
local v_u_166 = 0
game:GetService("ReplicatedStorage").Logic.stopgrab.OnClientEvent:connect(function()
	if v_u_48 == 9 then
		v_u_43 = 0
		v_u_50 = false
		v_u_48 = -1
		v_u_49 = 0
		coroutine.wrap(function()
			_G.indicatecooldown("Piercing Jab", v_u_19 * 10)
			wait(v_u_19 * 10)
			v_u_76 = false
			v_u_68 = true
		end)()
		v_u_16:FireServer(7, v_u_5, 50)
		v_u_45 = 0.02
	end
end)
local v_u_167 = v_u_64
local v_u_168 = require(game.ReplicatedStorage.replicatedModule)
v13.InputBegan:connect(function(p169)
	if v_u_1:GetAttribute("UsedSubAbilityTime") and (workspace.DistributedGameTime - v_u_1:GetAttribute("UsedSubAbilityTime") < 0.5 and (p169.KeyCode ~= Enum.KeyCode.C and (not _G.mobilebuttoncheck("c", p169.Position) and (p169.KeyCode ~= Enum.KeyCode.ButtonSelect and not v_u_168.isTyping())))) then
		task.wait(0.33)
	end
	if (workspace.timestopped.Value == false or (v_u_5.Name == "nope" or (workspace.timestopper.Value == v_u_1.Name or (p169.KeyCode == Enum.KeyCode.F or (p169.KeyCode == Enum.KeyCode.DPadRight or _G.mobilebuttoncheck("f", p169.Position)))))) and v_u_8.Value ~= true then
		if p169.UserInputType ~= Enum.UserInputType.MouseButton1 and (p169.UserInputType ~= Enum.UserInputType.Touch or not _G.mobilebuttoncheck("lmb", p169.Position)) and (p169.KeyCode ~= Enum.KeyCode.ButtonX and not v_u_168.isTyping()) then
			if p169.KeyCode == Enum.KeyCode.C or _G.mobilebuttoncheck("c", p169.Position) then
				cheld = true
			end
			if (p169.KeyCode == Enum.KeyCode.E or (_G.mobilebuttoncheck("e", p169.Position) or p169.KeyCode == Enum.KeyCode.ButtonR2)) and (v_u_5.Name ~= "nope" and (not v_u_50 or v_u_50 and (v_u_48 == 9 and v_u_49 == 2)) and (v_u_67 and (v_u_5.Health > 0 and v_u_61.Value == false))) then
				_G.attacktarget = nil
				if v_u_1:FindFirstChild("FusedStand").Value == "TheWorld(AlternateUniverse)" then
					local v170 = NewRegion(v_u_2:FindFirstChild("Torso").CFrame, Vector3.new(22, 7, 22))
					local v171 = nil
					for _, v172 in pairs(CastRegion(v_u_2, (1 / 0), v170)) do
						if not v171 and (v172.Parent and (v172.Parent ~= v_u_2 and (v172.Parent:FindFirstChildOfClass("Humanoid") and (v172.Parent:FindFirstChildOfClass("Humanoid").Health > 0 and v172.Parent:FindFirstChild("Torso"))))) then
							v171 = v172.Parent:FindFirstChildOfClass("Humanoid")
						end
					end
					if v171 then
						_G.attacktarget = v171.Parent
					end
				end
				if v_u_48 == 9 and v_u_49 == 2 then
					v_u_16:FireServer(36, true)
					v_u_43 = 0
					v_u_50 = false
					v_u_48 = -1
					v_u_49 = 0
					coroutine.wrap(function()
						_G.indicatecooldown("Piercing Jab", v_u_19 * 10)
						wait(v_u_19 * 10)
						v_u_76 = false
						v_u_68 = true
					end)()
					v_u_16:FireServer(7, v_u_5, 50)
					v_u_45 = 0.02
				end
				v_u_50 = true
				if not v_u_64 then
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_173 in pairs(v_u_23:GetChildren()) do
						if v_u_173:IsA("BasePart") and (v_u_173.Name ~= "RootPart" and (v_u_173.Name ~= "Torso" and (v_u_173.Name ~= "Head" and (v_u_173.Name ~= "Left Leg" and (v_u_173.Name ~= "Right Leg" and (v_u_173.Name ~= "Left Arm" and (v_u_173.Name ~= "Right Arm" and (v_u_173.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v174 = 1, 10 do
									v_u_16:FireServer(3, v_u_173, 1 - v174 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
				v_u_48 = 3
				v_u_67 = false
				v_u_49 = 0
				v_u_43 = 0
				v_u_60 = v_u_43
				v_u_46 = 0
				v_u_16:FireServer(7, v_u_5, 0)
				v_u_45 = 0.055 * v_u_1:WaitForChild("Speed").Value * v_u_4
				v_u_47 = false
			elseif (p169.KeyCode == Enum.KeyCode.R or (p169.KeyCode == Enum.KeyCode.ButtonR1 or _G.mobilebuttoncheck("r", p169.Position))) and (_G.ind4cdimension == false and (not v_u_50 and (v_u_68 and (v_u_5.Health > 0 and (v_u_61.Value == false and (v_u_52 or v_u_2:FindFirstChild("Humanoid"))))))) then
				v_u_50 = true
				if not v_u_64 then
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_175 in pairs(v_u_23:GetChildren()) do
						if v_u_175:IsA("BasePart") and (v_u_175.Name ~= "RootPart" and (v_u_175.Name ~= "Torso" and (v_u_175.Name ~= "Head" and (v_u_175.Name ~= "Left Leg" and (v_u_175.Name ~= "Right Leg" and (v_u_175.Name ~= "Left Arm" and (v_u_175.Name ~= "Right Arm" and (v_u_175.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v176 = 1, 10 do
									v_u_16:FireServer(3, v_u_175, 1 - v176 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
				v_u_16:FireServer(76, true)
				v_u_48 = 9
				v_u_68 = false
				v_u_49 = 0
				v_u_43 = 0
				v_u_60 = v_u_43
				v_u_16:FireServer(25, v_u_23["Left Arm"].CFrame * CFrame.new(0, -0.5, 0))
				v_u_46 = 0
				v_u_57 = false
				v_u_16:FireServer(7, v_u_5, 0)
				v_u_45 = 0.05 * v_u_1:WaitForChild("Speed").Value * v_u_4
				v_u_47 = false
			elseif (p169.KeyCode == Enum.KeyCode.H or _G.mobilebuttoncheck("h", p169.Position)) and (v_u_5.Name ~= "nope" and (not v_u_50 and (v_u_73 and (v_u_5.Health > 0 and v_u_61.Value == false)))) then
				v_u_50 = true
				if not v_u_64 then
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_177 in pairs(v_u_23:GetChildren()) do
						if v_u_177:IsA("BasePart") and (v_u_177.Name ~= "RootPart" and (v_u_177.Name ~= "Torso" and (v_u_177.Name ~= "Head" and (v_u_177.Name ~= "Left Leg" and (v_u_177.Name ~= "Right Leg" and (v_u_177.Name ~= "Left Arm" and (v_u_177.Name ~= "Right Arm" and (v_u_177.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v178 = 1, 10 do
									v_u_16:FireServer(3, v_u_177, 1 - v178 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
				v_u_73 = false
				v_u_48 = 12
				v_u_49 = 0
				v_u_43 = 0
				v_u_56 = v_u_56 + 1
				local v_u_179 = v_u_56
				coroutine.wrap(function()
					local v180 = v_u_1:FindFirstChild("FusedStand").Value == "Star-SpangledBanner" and 1.5 or 1
					task.wait(v180 * 3)
					if v_u_56 == v_u_179 and v_u_48 == 12 then
						v_u_43 = 0
						v_u_50 = false
						coroutine.wrap(function()
							_G.indicatecooldown("Punching Barrage", v_u_19 * 7)
							wait(v_u_19 * 7)
							v_u_73 = true
						end)()
						v_u_48 = -1
						v_u_49 = 0
						v_u_16:FireServer(7, v_u_5, 50)
						v_u_45 = 0.02
					end
				end)()
				v_u_60 = v_u_43
				v_u_46 = 0
				v_u_16:FireServer(7, v_u_5, 0)
				v_u_45 = 0.2 * v_u_1:WaitForChild("Speed").Value * v_u_4
				v_u_47 = false
			elseif (p169.KeyCode == Enum.KeyCode.T or (p169.KeyCode == Enum.KeyCode.ButtonL1 or _G.mobilebuttoncheck("t", p169.Position))) and (v_u_5.Name ~= "nope" and (not v_u_50 or v_u_50 and (v_u_48 == 9 and v_u_49 == 2)) and (v_u_72 and (v_u_5.Health > 0 and v_u_61.Value == false))) then
				if v_u_48 == 9 and v_u_49 == 2 then
					v_u_16:FireServer(36, true)
					v_u_43 = 0
					v_u_50 = false
					v_u_48 = -1
					v_u_49 = 0
					coroutine.wrap(function()
						_G.indicatecooldown("Piercing Jab", v_u_19 * 10)
						wait(v_u_19 * 10)
						v_u_76 = false
						v_u_68 = true
					end)()
					v_u_16:FireServer(7, v_u_5, 50)
					v_u_45 = 0.02
				end
				v_u_50 = true
				if not v_u_64 then
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_181 in pairs(v_u_23:GetChildren()) do
						if v_u_181:IsA("BasePart") and (v_u_181.Name ~= "RootPart" and (v_u_181.Name ~= "Torso" and (v_u_181.Name ~= "Head" and (v_u_181.Name ~= "Left Leg" and (v_u_181.Name ~= "Right Leg" and (v_u_181.Name ~= "Left Arm" and (v_u_181.Name ~= "Right Arm" and (v_u_181.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v182 = 1, 10 do
									v_u_16:FireServer(3, v_u_181, 1 - v182 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
				v_u_48 = 11
				v_u_72 = false
				v_u_49 = 0
				v_u_43 = 0
				v_u_60 = v_u_43
				v_u_46 = 0
				v_u_16:FireServer(7, v_u_5, 0)
				v_u_45 = 0.055 * v_u_1:WaitForChild("Speed").Value * v_u_4
				v_u_47 = false
				v_u_16:FireServer(2, v_u_9, math.random(90, 110) / 100)
				v_u_16:FireServer(1, v_u_9, 0)
			elseif (p169.KeyCode == Enum.KeyCode.F or (p169.KeyCode == Enum.KeyCode.DPadRight or _G.mobilebuttoncheck("f", p169.Position))) and (v_u_5.Name ~= "nope" and (not v_u_50 and (v_u_69 and v_u_5.Health > 0))) then
				v_u_2.Torso.Anchored = false
				if v_u_61.Value == true then
					v_u_16:FireServer(0, v_u_23.SecondHead.attach1.effect, false)
					v_u_16:FireServer(0, v_u_23.SecondHead.attach2.effect, false)
					v_u_16:FireServer(78, true)
					task.spawn(function()
						v_u_22 = false
						_G.indicatecooldown("Epitaph", v_u_19 * 10)
						wait(v_u_19 * 10)
						v_u_70 = true
					end)
				end
				v_u_69 = false
				v_u_52 = false
				v_u_17:FireServer(v_u_2, v_u_23, {
					v_u_2.HumanoidRootPart.RootJoint.C0,
					v_u_2.Torso.Neck.C0,
					v_u_2.Torso["Left Shoulder"].C0,
					v_u_2.Torso["Right Shoulder"].C0,
					v_u_2.Torso["Left Hip"].C0,
					v_u_2.Torso["Right Hip"].C0
				}, {
					v_u_30.Neck.C0,
					v_u_30["Left Shoulder"].C0,
					v_u_30["Right Shoulder"].C0,
					v_u_30["Left Hip"].C0,
					v_u_30["Right Hip"].C0,
					v_u_30.CFrame
				}, "21-0dsf0jh0065hj90hdshfhf8932f8ghdasf", false, v_u_36)
				local v_u_183 = Instance.new("Sound", game:GetService("Workspace"))
				v_u_183.Volume = 0.9
				v_u_183.PlaybackSpeed = 1
				v_u_183.SoundId = "rbxassetid://3431631978"
				v_u_183:Play()
				v_u_183.Ended:connect(function()
					v_u_183:Destroy()
				end)
				local v_u_184 = Instance.new("ReverbSoundEffect", workspace.Music)
				game:GetService("Debris"):AddItem(v_u_184, 15)
				if game:GetService("Lighting"):FindFirstChild("Bloom") then
					game:GetService("Lighting"):FindFirstChild("Bloom").Enabled = false
				end
				if game:GetService("Lighting"):FindFirstChild("SunRays") then
					game:GetService("Lighting"):FindFirstChild("SunRays").Enabled = false
				end
				local v_u_185 = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
				v_u_185.Name = "TimeEraseEffect"
				v_u_185.TintColor = Color3.fromRGB(255, 50, 50)
				local v_u_186 = game:GetService("ReplicatedStorage").NewStuff.kcblur:Clone()
				v_u_186.Parent = game:GetService("Lighting")
				local v_u_187 = game:GetService("ReplicatedStorage").NewStuff.kcsky:Clone()
				v_u_187.Parent = game:GetService("Lighting")
				game:GetService("Debris"):AddItem(v_u_185, 15)
				game:GetService("Debris"):AddItem(v_u_186, 15)
				game:GetService("Debris"):AddItem(v_u_187, 15)
				coroutine.wrap(function()
					for v188 = 1, 10 do
						if v_u_185 then
							v_u_185.Contrast = -1 - v188 / 10
						end
						v_u_30.CFrame = v_u_2.HumanoidRootPart.CFrame * CFrame.new(-3, 0, 3)
						wait()
					end
					for v189 = 1, 10 do
						if v_u_185 then
							v_u_185.Contrast = v189 / 10 + -1
						end
						v_u_30.CFrame = v_u_2.HumanoidRootPart.CFrame * CFrame.new(-3, 0, 3)
						wait()
					end
					if v_u_185 then
						v_u_185:Destroy()
					end
				end)()
				v_u_168.setSpeedChange(v_u_2, "teSpeed", 35)
				coroutine.wrap(function()
					wait(1)
					v_u_52 = true
					v_u_59 = v_u_1.Character:FindFirstChild("erasecount").Value
					repeat
						wait()
					until v_u_5.Name ~= "nope"
					if not v_u_50 then
						v_u_21 = true
					end
					if v_u_168.isTimestopped(v_u_1) then
						v_u_2.Torso.Anchored = true
					end
					if game:GetService("Lighting"):FindFirstChild("Bloom") then
						game:GetService("Lighting"):FindFirstChild("Bloom").Enabled = true
					end
					if game:GetService("Lighting"):FindFirstChild("SunRays") then
						game:GetService("Lighting"):FindFirstChild("SunRays").Enabled = true
					end
					if v_u_184 then
						v_u_184:Destroy()
					end
					if v_u_186 then
						v_u_186:Destroy()
					end
					if v_u_187 then
						v_u_187:Destroy()
					end
					v_u_52 = false
					v_u_168.setSpeedChange(v_u_2, "teSpeed", 0)
					task.wait(0.1)
					if v_u_59 == v_u_1.Character:FindFirstChild("erasecount").Value then
						_G.indicatecooldown("Time Erase", v_u_19 * 15)
						wait(v_u_19 * 15)
						v_u_69 = true
					else
						_G.indicatecooldown("Feint Time Erase", v_u_19 * 6)
						wait(v_u_19 * 6)
						v_u_69 = true
					end
				end)()
			elseif (p169.KeyCode == Enum.KeyCode.F or (_G.mobilebuttoncheck("f", p169.Position) or p169.KeyCode == Enum.KeyCode.DPadRight)) and (not v_u_50 and (v_u_5.Name == "nope" and (v_u_52 and (cheld and not workspace.timestopped.Value)))) then
				v_u_21 = true
				v_u_20 = false
				coroutine.wrap(function()
					task.wait(0.5)
					v_u_20 = true
				end)()
				if v_u_168.isTimestopped(v_u_1) then
					v_u_2.Torso.Anchored = true
				end
				v_u_17:FireServer(v_u_2, v_u_23, nil, nil, "21-0dsf0jh0065hj90hdshfhf8932f8ghdasf2", false, v_u_36)
			elseif (p169.KeyCode == Enum.KeyCode.F or (_G.mobilebuttoncheck("f", p169.Position) or p169.KeyCode == Enum.KeyCode.DPadRight)) and (not v_u_50 and (v_u_5.Name == "nope" and v_u_52)) then
				if v_u_168.isTimestopped(v_u_1) then
					v_u_2.Torso.Anchored = true
				end
				v_u_16:FireServer(34, true)
			elseif (p169.KeyCode == Enum.KeyCode.Y or (_G.mobilebuttoncheck("y", p169.Position) or p169.KeyCode == Enum.KeyCode.ButtonL2)) and (v_u_5.Name ~= "nope" and (not v_u_50 and (v_u_70 and (v_u_5.Health > 0 and v_u_168.isStunned(v_u_2) == false)))) then
				v_u_70 = false
				v_u_22 = true
				v_u_16:FireServer(77, true)
				v_u_16:FireServer(0, v_u_23.SecondHead.attach1.effect, true)
				v_u_16:FireServer(0, v_u_23.SecondHead.attach2.effect, true)
				local v_u_190 = Instance.new("Sound", v_u_1.PlayerGui)
				v_u_190.SoundId = "rbxassetid://3373991228"
				v_u_190.PlaybackSpeed = 1.5
				v_u_190.Volume = 1.25
				v_u_190:Play()
				v_u_190.Ended:connect(function()
					v_u_190:Destroy()
				end)
				local v_u_191 = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
				v_u_191.Name = "TimeEraseEffect"
				game:GetService("Debris"):AddItem(v_u_191, 5)
				v_u_191.TintColor = Color3.fromRGB(255, 0, 0)
				coroutine.wrap(function()
					for v192 = 1, 10 do
						if v_u_191 then
							v_u_191.Contrast = -1 - v192 / 10
						end
						wait()
					end
					if v_u_191 then
						v_u_191:Destroy()
					end
				end)()
				game:GetService("ReplicatedStorage").Specials.newepitaph:FireServer()
				task.spawn(function()
					wait(5)
					v_u_16:FireServer(0, v_u_23.SecondHead.attach1.effect, false)
					v_u_16:FireServer(0, v_u_23.SecondHead.attach2.effect, false)
					if v_u_61.Value == true then
						v_u_16:FireServer(78, true)
						coroutine.wrap(function()
							v_u_22 = false
							_G.indicatecooldown("Epitaph", v_u_19 * 10)
							wait(v_u_19 * 10)
							v_u_70 = true
						end)()
					end
				end)
			elseif (p169.KeyCode == Enum.KeyCode.Y or (_G.mobilebuttoncheck("y", p169.Position) or p169.KeyCode == Enum.KeyCode.ButtonL2)) and (v_u_5.Name ~= "nope" and (not v_u_50 and (v_u_61.Value == true and (v_u_5.Health > 0 and v_u_22)))) then
				v_u_16:FireServer(78, true)
				v_u_16:FireServer(0, v_u_23.SecondHead.attach1.effect, false)
				v_u_16:FireServer(0, v_u_23.SecondHead.attach2.effect, false)
				task.spawn(function()
					v_u_22 = false
					_G.indicatecooldown("Epitaph", v_u_19 * 10)
					wait(v_u_19 * 10)
					v_u_70 = true
				end)
			elseif (p169.KeyCode == Enum.KeyCode.Z or (_G.mobilebuttoncheck("z", p169.Position) or p169.KeyCode == Enum.KeyCode.ButtonB)) and (not v_u_50 and (v_u_74 and v_u_5.Health > 0)) then
				v_u_74 = false
				if not v_u_64 then
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_193 in pairs(v_u_23:GetChildren()) do
						if v_u_193:IsA("BasePart") and (v_u_193.Name ~= "RootPart" and (v_u_193.Name ~= "Torso" and (v_u_193.Name ~= "Head" and (v_u_193.Name ~= "Left Leg" and (v_u_193.Name ~= "Right Leg" and (v_u_193.Name ~= "Left Arm" and (v_u_193.Name ~= "Right Arm" and (v_u_193.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v194 = 1, 10 do
									v_u_16:FireServer(3, v_u_193, 1 - v194 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
				local v195 = v_u_2.HumanoidRootPart.CFrame.lookVector
				local v196 = 400 -- Đã anti: Tăng giá trị nhảy mạnh lên
				local v197 = v196 -- Đã anti: Xóa bỏ limit 200
				local v198 = v_u_16
				local v199 = v_u_2.HumanoidRootPart
				local v200 = v195.X * (v197 / 2 + 100) -- Đã anti: Tăng khoảng cách bay xa theo trục X
				local v201 = v197 / 2 + 80 -- Đã anti: Tăng độ cao bay lên một chút
				local v202 = v195.Z * (v197 / 2 + 100) -- Đã anti: Tăng khoảng cách bay xa theo trục Z
				v198:FireServer(16, v199, (Vector3.new(v200, v201, v202)))
				coroutine.wrap(function()
					_G.indicatecooldown("Stand Jump", v_u_19 * 8)
					wait(v_u_19 * 8)
					v_u_74 = true
				end)()
			elseif (p169.KeyCode == Enum.KeyCode.Q or (_G.mobilebuttoncheck("q", p169.Position) or p169.KeyCode == Enum.KeyCode.ButtonY)) and (v_u_5.Name ~= "nope" and (not v_u_50 or v_u_48 == 5) and (v_u_5.Health > 0 and (v_u_61.Value == false and v_u_75))) then
				v_u_75 = false
				task.spawn(function()
					wait(0.5)
					v_u_75 = true
				end)
				if v_u_64 then
					if v_u_64 then
						v_u_16:FireServer(3, v_u_23.FrontHead.face, 1)
						v_u_16:FireServer(3, v_u_23.SecondHead.face, 1)
						for _, v_u_203 in pairs(v_u_23:GetChildren()) do
							if v_u_203:IsA("BasePart") and (v_u_203.Name ~= "RootPart" and (v_u_203.Name ~= "Torso" and (v_u_203.Name ~= "Head" and (v_u_203.Name ~= "Left Leg" and (v_u_203.Name ~= "Right Leg" and (v_u_203.Name ~= "Left Arm" and (v_u_203.Name ~= "Right Arm" and (v_u_203.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
								coroutine.wrap(function()
									for v204 = 1, 10 do
										v_u_16:FireServer(3, v_u_203, v204 / 10)
										wait()
									end
								end)()
							end
						end
						v_u_64 = false
					end
				else
					v_u_16:FireServer(2, v_u_12, math.random(90, 110) / 100)
					v_u_16:FireServer(1, v_u_12, 0)
					v_u_16:FireServer(3, v_u_23.FrontHead.face, 0)
					v_u_16:FireServer(3, v_u_23.SecondHead.face, 0)
					for _, v_u_205 in pairs(v_u_23:GetChildren()) do
						if v_u_205:IsA("BasePart") and (v_u_205.Name ~= "RootPart" and (v_u_205.Name ~= "Torso" and (v_u_205.Name ~= "Head" and (v_u_205.Name ~= "Left Leg" and (v_u_205.Name ~= "Right Leg" and (v_u_205.Name ~= "Left Arm" and (v_u_205.Name ~= "Right Arm" and (v_u_205.Name ~= "FrontHead" or v_u_168.checkApril())))))))) then
							coroutine.wrap(function()
								for v206 = 1, 10 do
									v_u_16:FireServer(3, v_u_205, 1 - v206 / 10)
									wait()
								end
							end)()
						end
					end
					v_u_64 = true
				end
			elseif (p169.KeyCode == Enum.KeyCode.G or (_G.mobilebuttoncheck("g", p169.Position) or p169.KeyCode == Enum.KeyCode.DPadDown)) and (not v_u_50 and (v_u_5.Health > 0 and v_u_61.Value == false)) then
				v_u_50 = true
				v_u_43 = 0
				v_u_45 = 0.04
				v_u_16:FireServer(0, v_u_11, true)
				v_u_168.addSpeedChange(v_u_2, "pose", -99999)
				v_u_168.addJumpChange(v_u_2, "pose", -99999)
				v_u_16:FireServer(7, v_u_5, 0)
				v_u_48 = 5
				v_u_49 = math.random(0, 1)
			elseif (p169.KeyCode == Enum.KeyCode.G or (_G.mobilebuttoncheck("g", p169.Position) or p169.KeyCode == Enum.KeyCode.DPadDown)) and (v_u_48 == 5 and v_u_5.Health > 0) then
				v_u_48 = -1
				v_u_49 = 0
				v_u_50 = false
				v_u_16:FireServer(0, v_u_11, false)
				v_u_168.addSpeedChange(v_u_2, "pose", 0)
				v_u_168.addJumpChange(v_u_2, "pose", 0)
				v_u_16:FireServer(7, v_u_5, 50)
			end
		end
		
