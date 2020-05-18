if !eggHunt then eggHunt = {} end

include( "easteregghunt/egghunt_config.lua" )
include( "easteregghunt/egghunt_lang.lua" )

if eggHunt.resource then resource.AddWorkshop(eggHunt.WorkshopID) end
include( "easteregghunt/egghunt_core.lua" )