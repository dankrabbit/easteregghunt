AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Easter Egg"
ENT.Category = "Easter Egg Hunt"
ENT.Spawnable = false
ENT.AdminSpawnable = false

if CLIENT then function ENT:Draw() self:DrawModel() end end

function ENT:Initialize()
	if CLIENT then return end

	local mdl = table.Random(eggHunt.models)
	if eggHunt.lastMdl and table.Count(eggHunt.models) > 1 then
		while eggHunt.lastMdl == mdl do mdl = table.Random(eggHunt.models) end
	end
	eggHunt.lastMdl = mdl
	self:SetModel(mdl);
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);

	self.HasFound = {}
end