if !eggHunt then eggHunt = {} end
if !eggHunt.pos2 then eggHunt.pos2 = {} end

local function spawnEasterEgg(location)
	local egg = ents.Create(eggHunt.ent)
	if !IsValid(egg) then return end
	egg:SetPos( Vector(location) )
	egg:Spawn()
	egg:DropToFloor()

	if eggHunt.announce then PrintMessage(HUD_PRINTTALK, eggHunt.lang["eggSpawned"]) end
	if eggHunt.debug then print("An easter egg has spawned at " .. location) end
end

local function getNewEggSpawn()
	local location
	if eggHunt.spawnTable == 1 then
		location = table.Random(eggHunt.pos)
		if eggHunt.lastSpot and table.Count(eggHunt.pos) > 1 then
			while eggHunt.lastSpot == location do location = table.Random(eggHunt.pos) end
		end
	elseif eggHunt.spawnTable == 2 then
		location = table.Random(eggHunt.pos2)
		if eggHunt.lastSpot and table.Count(eggHunt.pos2) > 1 then
			while eggHunt.lastSpot == location do location = table.Random(eggHunt.pos2) end
		end
	end
	if eggHunt.gameType == 2 then eggHunt.lastSpot = location end
	return location
end

hook.Add("PlayerUse", "EasterEggHunt_FoundEgg", function(ply, ent)
	if ent:GetClass() != eggHunt.ent then return end
	if eggHunt.gameType == 1 then
		if ent.HasFound[ply] then
			if !ent.nextUse then ent.nextUse = 0 end
			if ent.nextUse > CurTime() then return end
			ent.nextUse = CurTime() + 2
			ply:PrintMessage(HUD_PRINTTALK, eggHunt.lang["foundB4"])
			return
		end
		ent.HasFound[ply] = true
	elseif eggHunt.gameType == 2 then
		ent:Remove()
		timer.Simple(eggHunt.spawnTimer, function()
			if #ents.FindByClass(eggHunt.ent) > eggHunt.entLimit then return end

			spawnEasterEgg(getNewEggSpawn())
		end)
	end

	ply:PrintMessage(HUD_PRINTTALK, eggHunt.lang["foundNew"])
	if eggHunt.sound then ent:EmitSound(eggHunt.sound, 420) end

	if eggHunt.rewardType == 1 then
		ply:addXP(eggHunt.reward)
		ply:PrintMessage(HUD_PRINTTALK, eggHunt.lang["got"] .. " " .. eggHunt.reward .. " XP " .. eggHunt.lang["reward"])
	elseif eggHunt.rewardType == 2 then
		ply:addMoney(eggHunt.reward)
		ply:PrintMessage(HUD_PRINTTALK, eggHunt.lang["got"] .. " $" .. eggHunt.reward .. " " .. eggHunt.lang["reward"])
	elseif eggHunt.rewardType == 3 then
		eggHunt.rewardFunc(ply)
	end
end)

-- Spawn some eggs!
if eggHunt.gameType == 1 then
	if timer.Exists("EasterEggHunt_Spawner1") then return end
	timer.Create("EasterEggHunt_Spawner1", eggHunt.spawnTimer, 0, function()
		if #ents.FindByClass(eggHunt.ent) == eggHunt.entLimit then return end

		local tbl = eggHunt.pos2
		if eggHunt.spawnTable == 1 then tbl = eggHunt.pos end
		for k,v in pairs(tbl) do
			if #ents.FindByClass(eggHunt.ent) >= eggHunt.entLimit then return end

			if eggHunt.debug then print("An easter egg has spawned at " .. v) end
			local location = Vector(v)
			spawnEasterEgg(location)
		end
	end)

elseif eggHunt.gameType == 2 and !eggHunt.spawnTimer then
	hook.Add("PlayerSpawn", "EasterEggHunt_Spawner2", function(ply)
		if #ents.FindByClass(eggHunt.ent) == eggHunt.entLimit then return end

		if #ents.FindByClass(eggHunt.ent) >= eggHunt.entLimit then
			for k, v in pairs( ents.FindByClass(eggHunt.ent) ) do
				if #ents.FindByClass(eggHunt.ent) <= eggHunt.entLimit then return end
				ent:Remove()
			end

		elseif #ents.FindByClass(eggHunt.ent) < eggHunt.entLimit then
			spawnEasterEgg(getNewEggSpawn())
		end
	end)
end

hook.Add("PlayerSay", "EasterEggHunt_respawnCMD", function( ply, text )
	if !IsValid(ply) then return end
	if eggHunt.ulx and type(eggHunt.ulx) == "table" then
		if !eggHunt.ulx[ply:GetNWString("usergroup")] then return end
	elseif !ply:IsSuperAdmin() then return end

	if (eggHunt.gameType == 2 and eggHunt.respawnCmd) and string.lower( text ) == eggHunt.respawnCmd then
		for k, v in pairs( ents.FindByClass(eggHunt.ent) ) do v:Remove() end

		spawnEasterEgg(getNewEggSpawn())
		if !eggHunt.announce then ply:PrintMessage(HUD_PRINTTALK, eggHunt.lang["eggSpawned"]) end

	elseif string.lower( text ) == eggHunt.clearSpawns then
		if eggHunt.pos2 then table.Empty(eggHunt.pos2) end
		for k, v in pairs( ents.FindByClass(eggHunt.ent) ) do
			if #ents.FindByClass(eggHunt.ent) <= eggHunt.entLimit then return end
			ent:Remove()
		end

	elseif  string.lower( text ) == eggHunt.setSpawn then
		if !eggHunt.pos2 then return end

		local location = ply:GetPos() + Vector(0, 0, 42)
		table.insert(eggHunt.pos2, tostring(location))
	end
end)
print("EasterEggHunt has loaded!")