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

	self:SetModel( table.Random(eggHunt.models) ); -- 
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);

	self.HasFound = {}
end