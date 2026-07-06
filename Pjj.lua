-- ========================================================
-- BERI'S FINAL FARM V12.12 - BỔ SUNG ANTI FOCUS CAMERA
-- ========================================================
local P, RS, WS, CG, RService = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Workspace"), game:GetService("CoreGui"), game:GetService("RunService")
local LP, Logic = P.LocalPlayer, RS:WaitForChild("Logic", 5)
local Specials = RS:WaitForChild("Specials", 5)
local OldFx = RS:FindFirstChild("oldEffects")

-- GOM REMOTES GỌN LẠI
local R = {
    hb = Logic and Logic:FindFirstChild("hitbox", 5), misc = Logic and Logic:FindFirstChild("misc", 5),
    give = Logic and Logic:FindFirstChild("giveitem", 5), hbStuff = Logic and Logic:FindFirstChild("hitboxstuffidk", 5),
    skin = Specials and (Specials:FindFirstChild("hardenedskin") or Specials:FindFirstChild("HardenedSkin")),
    quest = RS:FindFirstChild("QuestRemote")
}

-- PHÂN LOẠI CÁC LOẠI KHÁNG ĐỂ TÁCH MENU
local RAnti = {
    ts = {RS:FindFirstChild("localtimestop", true), Logic and Logic:FindFirstChild("instanttimestop")},
    -- Đã thêm focuscamera vào nhóm kháng hiệu ứng màn hình/góc nhìn
    blind = {Logic and Logic:FindFirstChild("wouscreen"), Logic and Logic:FindFirstChild("asbestosblind"), Logic and Logic:FindFirstChild("oxygenblind"), Logic and Logic:FindFirstChild("goblind"), Logic and Logic:FindFirstChild("focuscamera"), RS:FindFirstChild("LightingStorage") and RS.LightingStorage:FindFirstChild("LightingRemote")},
    stun = {Logic and Logic:FindFirstChild("controldisable"), Logic and Logic:FindFirstChild("slowdown"), Logic and Logic:FindFirstChild("echoes"), Logic and Logic:FindFirstChild("moveplayer"), Logic and Logic:FindFirstChild("crazytrain"), OldFx and OldFx:FindFirstChild("Basic") and OldFx.Basic:FindFirstChild("stunMelee")},
    misc = {Specials and Specials:FindFirstChild("newrtz"), Specials and Specials:FindFirstChild("illusioncreation"), Logic and Logic:FindFirstChild("timerewind"), Logic and Logic:FindFirstChild("epitaph"), Logic and Logic:FindFirstChild("attackyourself"), Specials and Specials:FindFirstChild("receiveheartattack")}
}

-- KHỞI TẠO UI
local win = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))():Window("Beri's Farm V12.12")
task.spawn(function()
    task.wait(1)
    local frame = (CG:FindFirstChild("Discord") or LP.PlayerGui:FindFirstChild("Discord")):FindFirstChild("MainFrame")
    if frame then
        Instance.new("UIScale", frame).Scale = 0.65 
        frame.Position, frame.AnchorPoint = UDim2.new(0, 15, 0.5, 0), Vector2.new(0, 0.5)
        local sg = Instance.new("ScreenGui", CG) sg.Name = "BeriUI"
        local btn = Instance.new("TextButton", sg)
        btn.Size, btn.Position, btn.Text, btn.BackgroundColor3, btn.TextColor3 = UDim2.new(0,45,0,45), UDim2.new(0,0,0.4,0), "UI", Color3.fromRGB(30,30,30), Color3.new(1,1,1)
        btn.BorderColor3, btn.BorderSizePixel = Color3.fromRGB(0,255,255), 2
        btn.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)
    end
end)

local serv = win:Server("Menu", "")
local flags = { afm=false, mfi=false, mfm=false, boss=nil, customBoss="", target="", farmPlr=false, killAll=false, kite=false, shield=false, antiGrab=false, esp=false, clear=false, aimTarget=false, aimClosest=false, quest=false, bring=false }

-- HACK CHỈ SỐ GỐC
local st = serv:Channel("Chỉ Số")
for _, s in pairs({"Power", "Endurance", "Speed"}) do
    st:Textbox(s, "Nhập số...", true, function(t) if LP:FindFirstChild(s) then LP[s].Value = t end if LP:FindFirstChild(s.."Stat") then LP[s.."Stat"].Value = t end end)
end
st:Button("Bơm Max Chỉ Số", function()
    if R.misc then
        for _, s in ipairs({'S/Level','Level','Speed','S/Speed','Power','S/Power','Points','S/Points','Special','S/Special'}) do R.misc:FireServer(10, LP[s], 2e8, "zxck0d929easjdkadasdji29e9u2es21") end
        R.misc:FireServer(10, LP['Stand'], 'UI', "zxck0d929easjdkadasdji29e9u2es21"); R.misc:FireServer(10, LP['S/Stand'], 'UI', "zxck0d929easjdkadasdji29e9u2es21")
    end
end)

-- ==========================================
-- BỘ TÁCH MENU KHÁNG ĐỘC LẬP
-- ==========================================
local anti = serv:Channel("Kháng & Giảm Lag")
local storedConns = {ts={}, blind={}, stun={}, misc={}}

local function tAnti(list, conns, v)
    if v and getconnections then
        for _, r in ipairs(list) do if r then for _, c in pairs(getconnections(r.OnClientEvent)) do c:Disable() table.insert(conns, c) end end end
    else
        for _, c in pairs(conns) do if c then c:Enable() end end; table.clear(conns)
    end
end

anti:Label("🛡️ BỘ TÙY CHỈNH KHÁNG")
anti:Toggle("1. Kháng Time Stop", false, function(v) tAnti(RAnti.ts, storedConns.ts, v) end)
anti:Toggle("2. Kháng Mù/Khóa Camera", false, function(v) tAnti(RAnti.blind, storedConns.blind, v) end)
anti:Toggle("3. Kháng Stun & Làm Chậm", false, function(v) tAnti(RAnti.stun, storedConns.stun, v) end)
anti:Toggle("4. Kháng Skill Ảo/Đặc Biệt", false, function(v) tAnti(RAnti.misc, storedConns.misc, v) end)
anti:Toggle("5. Chống Túm Cổ (Anti Grab)", false, function(v) flags.antiGrab = v end)

anti:Button("🚑 Gỡ Kẹt Phím/Kẹt Tướng", function()
    local cEv = Logic and Logic:FindFirstChild("controldisable")
    if cEv and firesignal then pcall(firesignal, cEv.OnClientEvent, false) end
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then
        local h = LP.Character.Humanoid; h.WalkSpeed, h.JumpPower, h.PlatformStand = 16, 50, false 
    end
end)

anti:Seperator()
anti:Toggle("Xóa Rác (Giảm Lag)", false, function(v) flags.clear = v end)
anti:Toggle("ESP Tàng Hình", false, function(v) flags.esp = v if not v then for _, o in pairs(WS:GetDescendants()) do if o.Name == "BESP" then o:Destroy() end end end end)

-- ==========================================
-- TÍNH NĂNG FARM
-- ==========================================
local f = serv:Channel("Auto Farm & PVP")
f:Textbox("Tên Mục Tiêu", "", true, function(t) flags.target = t:lower() end)
f:Toggle("1. Khóa Cam Mục Tiêu", false, function(v) flags.aimTarget = v end)
f:Toggle("2. Auto Đấm Mục Tiêu", false, function(v) flags.farmPlr = v end)
f:Toggle("3. Lùi Né (Kite)", false, function(v) flags.kite = v end) 
f:Toggle("4. Khiên Thông Minh", false, function(v) flags.shield = v end)
f:Seperator()
f:Toggle("Khóa Cam Gần Nhất", false, function(v) flags.aimClosest = v end)
f:Toggle("Kill ALL", false, function(v) flags.killAll = v end)
f:Textbox("Boss Tùy Chọn", "", true, function(t) flags.customBoss = t:lower() end)
for _, b in ipairs({"DIO", "Kira", "Diavolo"}) do f:Toggle("Farm "..b, false, function(v) flags.boss = v and b or nil end) end
f:Seperator()
f:Toggle("Auto Nhiệm Vụ", false, function(v) flags.quest = v end)
f:Toggle("Farm Quái", false, function(v) flags.afm = v end)
f:Toggle("Cày Tiền (Italy)", false, function(v) flags.mfi = v end)
f:Toggle("Cày Tiền (Morioh)", false, function(v) flags.mfm = v end)

-- TỐI ƯU CÁC VÒNG LẶP NỀN
local camTarget, kiteTarget = nil, nil
task.spawn(function()
    local tick = 0
    while task.wait(0.2) do
        tick = tick + 1
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if flags.bring and hrp then for _, i in pairs(WS:GetChildren()) do if i:IsA("Tool") and i:FindFirstChildWhichIsA("BasePart") then i:FindFirstChildWhichIsA("BasePart").CFrame = hrp.CFrame end end end
        
        if hrp then
            local bestAim, bestKite, minCam, minKite = nil, nil, 500, 25
            for _, v in pairs(WS:GetChildren()) do
                local eHum, eHrp = v:FindFirstChild("Humanoid"), v:FindFirstChild("HumanoidRootPart")
                if eHum and eHrp and eHum.Health > 0 and v ~= char then
                    local dist = (eHrp.Position - hrp.Position).Magnitude
                    if P:GetPlayerFromCharacter(v) then
                        if flags.aimTarget and flags.target ~= "" and v.Name:lower():match(flags.target) then bestAim = eHrp end
                        if flags.aimClosest and dist < minCam then minCam, bestAim = dist, eHrp end
                    elseif not v.Name:match("Dummy") and dist < minKite then minKite, bestKite = dist, eHrp end
                end
            end
            camTarget, kiteTarget = bestAim, bestKite
        end

        if tick % 10 == 0 then
            if flags.quest and R.quest then pcall(function() R.quest:FireServer() end) end
            if flags.clear then pcall(function() for _, v in pairs(WS:GetChildren()) do if v:IsA("Model") and v.Name ~= LP.Name and v:FindFirstChild("Humanoid") and v.Humanoid.Health <= 0 then v:Destroy() end end end) end
            if flags.esp and getnilinstances then
                pcall(function() for _, o in pairs(getnilinstances()) do if o:IsA("Model") and o.Name ~= LP.Name and o:FindFirstChild("Humanoid") and o.Humanoid.Health > 0 and o:FindFirstChild("HumanoidRootPart") then o.Parent = WS if not o:FindFirstChild("BESP") then local hl = Instance.new("Highlight", o) hl.Name, hl.FillColor, hl.FillTransparency = "BESP", Color3.new(1,0,0), 0.5 end end end end)
            end
        end
    end
end)

RService.RenderStepped:Connect(function() if camTarget and WS.CurrentCamera then WS.CurrentCamera.CFrame = CFrame.lookAt(WS.CurrentCamera.CFrame.Position, camTarget.Position) end end)
RService.Stepped:Connect(function() if flags.kite and kiteTarget and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then pcall(function() local hrp = LP.Character.HumanoidRootPart hrp.CFrame = hrp.CFrame + Vector3.new((hrp.Position - kiteTarget.Position).Unit.X, 0, (hrp.Position - kiteTarget.Position).Unit.Z).Unit * 1.2 end) end end)

-- ANTI GRAB & SHIELD 
local function checkShield(n) if flags.shield and n:match("saber") or n:match("hitbox") or n:match("slash") or n:match("beam") or n:match("ice") or n:match("stun") or n:match("freeze") or n:match("trap") then if R.skin then pcall(function() R.skin:FireServer(true) end) end end end
WS.ChildAdded:Connect(function(c) checkShield(c.Name:lower()) end)
local function onChar(char)
    char.DescendantAdded:Connect(function(d)
        if flags.antiGrab and d.Name:lower():match("grab") and (d:IsA("JointInstance") or d:IsA("Weld") or d:IsA("WeldConstraint") or d:IsA("Motor6D")) then task.defer(function() pcall(function() d:Destroy() end) end) end
    end)
    char.ChildAdded:Connect(function(c) checkShield(c.Name:lower()) end)
end
if LP.Character then onChar(LP.Character) end
LP.CharacterAdded:Connect(onChar)

-- VÒNG LẶP ĐẤM
local function validTar(hum, v)
    if not hum or hum.Health <= 0 or v.Name == LP.Name then return false end
    local n = v.Name:lower()
    if P:FindFirstChild(v.Name) then return not v:FindFirstChildOfClass("ForceField") and (flags.killAll or (flags.farmPlr and flags.target ~= "" and n:match(flags.target))) end
    if flags.customBoss ~= "" and n:match(flags.customBoss) then return true end
    if flags.boss == v.Name or (flags.afm and not v:FindFirstChildOfClass("ForceField")) then return true end
    if flags.mfi and n:match("dummy") and (n:match("space") or n:match("holy")) then return true end
    if flags.mfm and n:match("dummy") and (n:match("metal") or n:match("wood") or n:match("ice") or n:match("rock")) then return true end
    return false
end
task.spawn(function()
    while task.wait(0.05) do
        local c = LP.Character
        if c and c:FindFirstChild("Right Arm") then
            if R.hbStuff then pcall(function() R.hbStuff:InvokeServer(false, 1) end) end
            for _, v in pairs(WS:GetChildren()) do
                local hum = v:FindFirstChildOfClass("Humanoid")
                if validTar(hum, v) and R.hb then task.spawn(function() pcall(function() R.hb:InvokeServer(0, c["Right Arm"], CFrame.new(), 10, c:FindFirstChild("Torso") and c.Torso:FindFirstChild("voiceline"), hum) end) end) end
            end
        end
    end
end)

-- SHOP & DỊCH CHUYỂN
local tp = serv:Channel("Shop & Teleport")
local npcs = {Rohan = CFrame.new(1621.5,875,-969.7), Jotaro = CFrame.new(1905.4,875,-1295.2), Stroheim = CFrame.new(1657.6,875.1,-919.4)}
for n, c in pairs(npcs) do tp:Button(n, function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame = c end end) end
for _, n in ipairs({"Zeppeli", "Caesar"}) do tp:Button(n, function() local n = WS:FindFirstChild(n) if n and n:FindFirstChild("Head") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame = n.Head.CFrame end end) end
tp:Seperator()
for _, i in ipairs({"StandArrow","RokakakaFruit","LuckyStandArrow","Hamon","Rock Human","Vampire","Spin"}) do tp:Button("Mua "..i, function() if R.give then R.give:FireServer(i) end end) end
tp:Seperator()
tp:Toggle("Bật Hút Đồ", false, function(v) flags.bring = v end)
