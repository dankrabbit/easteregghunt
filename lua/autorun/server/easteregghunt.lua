eggHunt = {}

include( "easteregghunt/egghunt_config.lua" )
include( "easteregghunt/egghunt_lang.lua" )

if eggHunt.resource then resource.AddWorkshop("906357535") end
include( "easteregghunt/egghunt_core.lua" )

print("EasterEggHunt has loaded!")