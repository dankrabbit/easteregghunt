--      ___           ___           ___           ___           ___           ___                 
--     /  /\         /  /\         /  /\         /__/\         /__/\         /__/\          ___   
--    /  /:/_       /  /:/_       /  /:/_        \  \:\        \  \:\        \  \:\        /  /\  
--   /  /:/ /\     /  /:/ /\     /  /:/ /\        \__\:\        \  \:\        \  \:\      /  /:/  
--  /  /:/ /:/_   /  /:/_/::\   /  /:/_/::\   ___ /  /::\   ___  \  \:\   _____\__\:\    /  /:/   
-- /__/:/ /:/ /\ /__/:/__\/\:\ /__/:/__\/\:\ /__/\  /:/\:\ /__/\  \__\:\ /__/::::::::\  /  /::\   
-- \  \:\/:/ /:/ \  \:\O/~~/:/ \  \:\ /~~/:/ \  \:\/:/__\/ \  \:\ /  /:/ \  \:\~~\~~\/ /__/:/\:\  
--  \  \::/ /:/   \  \:\  /:/   \  \:\  /:/   \  \::/       \  \:\  /:/   \  \:\  ~~~  \__\/  \:\ 
--   \  \:\/:/     \  \:\/:/     \  \:\/:/     \  \:\        \  \:\/:/     \  \:\           \  \:\
--    \  \::/       \  \::/       \  \::/       \  \:\        \  \::/       \  \:\           \__\/
--     \__\/         \__\/         \__\/         \__\/         \__\/         \__\/                
--
--	~ By Dank

//	gameType = 1 -- All eggs in eggHunt.pos are spawned at once and aren't removed on PlayerUse
//	gameType = 2 -- Uses entLimit for egg spawning and removes them on PlayerUse
eggHunt.gameType = 2

-- The sound played when an egg is found. Set to nil to disable
eggHunt.sound = "garrysmod/balloon_pop_cute.wav"

eggHunt.debug = false				-- Print easter egg location to server on spawn
eggHunt.ent	= "easteregghunt_egg"	-- The easter egg entity
eggHunt.entLimit	= 1				-- Amount of eggs that can exist at once
eggHunt.announce	= false			-- Announce when an egg spawns
eggHunt.spawnTimer	= 300			-- Egg respawn time after last found
eggHunt.rewardType	= 2				-- 1 = Vrondakis XP; 2 = DarkRP Money; 3 = eggHunt.rewardFunc
eggHunt.reward		= 100			-- Amount of rewardType
function eggHunt.rewardFunc(ply)	-- rewardType 3, do whatever you want with it
	ply:AddSkillXP(eggHunt.reward)
end

eggHunt.respawnCmd = "!respawneasteregg"	-- Command to force egg respawn. Set to nil to disable
eggHunt.ulx = {		-- ULX Ranks that can use chat commands. Set to nil to default to ply:IsSuperAdmin()					
	["superadmin"] = true,
	["admin"] = true,
}

eggHunt.WorkshopID = "1355735830"	-- WorkshopID for Roblox Easter Eggs
eggHunt.resource = true	-- AddWorkshop for WorkshopID
eggHunt.models = {		-- Randomized table of models for easter eggs
	"models/roblox_assets/basic_egg_2014.mdl",
	"models/roblox_assets/stationary_egg_of_boring.mdl",
	"models/roblox_assets/eggmin.mdl",
	"models/roblox_assets/extinct_egg_of_dino_on_ice.mdl",
	"models/roblox_assets/colored_dot_egg.mdl",
	"models/roblox_assets/starry_egg_of_the_wild_ride.mdl",
	"models/roblox_assets/the_easiest_egg.mdl",
	"models/roblox_assets/eggvertisement_egg.mdl",
	"models/roblox_assets/eggotrip.mdl",
	"models/roblox_assets/supercharged_striker_egg.mdl",
	"models/roblox_assets/fiery_egg_of_egg_testing.mdl",
	"models/roblox_assets/zenos_egg_of_paradox.mdl",
}

eggHunt.setSpawn	= "!seteggspawn"		-- Sets new spawn location for easter eggs
eggHunt.clearSpawns	= "!cleareggspawns"		-- Clears all spawn locations made with eggHunt.setSpawn
eggHunt.spawnTable	= 2	-- Type 1 uses eggHunt.pos; Type 2 uses chat commands in-game
-- Note: spawnTable 2 is currently not compatible with gameType 1

eggHunt.pos = {			-- Spawn positions for easter eggs if spawnTable 1
	"-10030.089844 3026.312744 -12477.450195",
	"-8771.564453 -2807.916260 -12391.983398",
	"-7300.437500 -2766.828613 -12276.887695",
	"-4510.326172 -2593.863770 -12008.885742",
	"-6995.001953 1556.304688 -12282.370117",
	"-7729.765137 1566.693115 -12282.370117",
	"-7332.234863 3088.720215 -12074.370117",
	"-7004.681641 2347.182373 -11666.370117",
	"9686.137695 -1412.857666 -12255.968750",
	"8794.491211 -1414.616699 -12255.968750",
	"9756.034180 3229.776611 -13745.968750",
	"9234.238281 -164.712662 -13831.968750",
	"11057.876953 3121.799561 -13674.968750",
	"10783.350586 533.322876 -11415.968750",
	"12205.717773 -1298.864868 -12325.968750",
	"10520.770508 -51.095470 -12325.979492",
	"-444.310760 9993.220703 -11711.968750",
	"-385.084930 9089.759766 -13695.968750",
	"-1673.367065 9954.986328 -11711.968750",
	"-1395.077148 13585.335938 -11199.968750",
}