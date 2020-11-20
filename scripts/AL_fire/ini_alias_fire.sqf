// by ALIAS
// Tutorial: https://www.youtube.com/aliascartoons

==========================================================================================================================================
=========== UNIT ON_FIRE
==========================================================================================================================================
//You can use this to set a specific unit in fire.

null=[unit_source,life_time,kill_time] execVM "scripts\AL_fire\al_unit_fire.sqf";
/*
unit_source		- string, name of the unit you set on fire
life_time		- number, the duration of fire in seconds
kill_time		- number, seconds until the unit is killed, this value must be smaller than lifetime of the fire
*/

>>>>>>>>>>>>>> Example

///////////// Setting unit on fire using his init field
null=[this,60,10] execVM "scripts\AL_fire\al_unit_fire.sqf";

///////////// Setting unit on fire from another script executed in global space and using the name of the unit
null=[bob,60,10] execVM "scripts\AL_fire\al_unit_fire.sqf";


==========================================================================================================================================
=========== WILD_FIRE
==========================================================================================================================================
// You can use this to set big areas in fire

null=[source,diameter,life_time,damage_inflicted,spreading_diameter,craters,hide_destr_veg,building_damage] execVM "scripts\AL_fire\al_wild_fire.sqf";

/*
source				- string, name of the object which serves as source of fire
diameter			- number, diameter in meters of the fire
life_time			- number, fire life time in seconds
spreading_diameter	- number, if is higher then diameter the fire will spread during life time with the amount of meters you set,
						if smaller than diameter the fire will not spread.
craters				- boolean, if true craters will be geenrated inside the radius of the fire
hide_destr_veg		- boolean, if true destroyed vegetation will be hidden, when the fire is set to spread this will happen right away
						for non-spreading fire the vegetation will be hidden over time
building_damage		- number, amount of damage inflicted on buildings by fire
*/

>>>>>>>>>>>>>> Example

///////////// Setting unit on fire using its init field
null=[this,200,860,-1,true,false,0.5] execVM "scripts\AL_fire\al_wild_fire.sqf";

///////////// Setting an area on fire from another script executed in global space
null=[wildfire_1,200,860,-1,true,false,0.5] execVM "scripts\AL_fire\al_wild_fire.sqf";


==========================================================================================================================================
=========== SMALL_FIRE
==========================================================================================================================================
// Set up fire places

null=[fire_source,fire_pressure,life_time,inflict_damage,kill_source_end] execVM "scripts\AL_fire\al_small_fire.sqf";

/*
fire_source		- string, the object you use as source for fire
fire_pressure	- number, flames will be push in direction of the object based on this value
life_time		- number, time in seconds for how long the fire will exist
inflict_damage	- boolean, if true sets units on fire if in range 
kill_source_end	- boolean, if true the source of fire will be destroyed at the end of fire's life time
*/

>>>>>>>>>>>>>> Example

///////////// Create a fire place usind another script executed in global space
null=[car_3,3,30,false,true] execVM "scripts\AL_fire\al_small_fire.sqf";

///////////// Create a fire place using its init field
null=[this,3,30,true,true] execVM "scripts\AL_fire\al_small_fire.sqf";


==========================================================================================================================================
=========== DISABLED_VEHICLES ON_FIRE
==========================================================================================================================================
// Set disabled vehicles on fire

null=[vehicle_source,life_time,destroy_vehicle,crew_fire] execVM "scripts\AL_fire\al_vehicle_fire.sqf";

/*
vehicle_source	- string, the name of the vehicle you want to set on fire
life_time		- number, time in seconds until the fire will turn off
destroy_vehicle	- boolean, if true the vehicle will be destroyed when the fire goes off
crew_fire		- boolean, if true random crew members or all of them will be set on fire making them to lose weapons and run away,
					otherwise they will stay inside until the fire is gone or vehicle is destroyed
*/

>>>>>>>>>>>>>> Example

///////////// Set vehicle on fire via init field
null=[this,30,true,true] execVM "scripts\AL_fire\al_vehicle_fire.sqf";

///////////// Set vehicle on fire in another script executed in global space
null=[car_x,60,true,true] execVM "scripts\AL_fire\al_vehicle_fire.sqf";



==========================================================================================================================================
=========== DECORATIVE_FIRE
==========================================================================================================================================
// Fill up spaces with flames

null=[fire_source,life_time,diameter,flame_size,damage_on_buildings,smoke_on,brightness] execVM "scripts\AL_fire\al_fire_deco.sqf";

/*
fire_source			-string, object name used as source for fire
life_time			-number, fire lifetime in seconds
diameter			-number, the fire diameter in meters
flame_size			-number, bazed on this number the siza of particles will be scaled
damage_on_buildings	-number, damage inflicted on buildings
smoke_on			-boolean, if true a big column of smoke will be generated
brightness			-number, it sets the brightness of the fire
*/

>>>>>>>>>>>>>> Example

///////////// Create fire via init field
null=[this,600,10,5,0.5,true,0.5] execVM "scripts\AL_fire\al_fire_deco.sqf";

///////////// Create fire via another script executed in global space
null=[roof,600,5,3,0.5,true,0.5] execVM "scripts\AL_fire\al_fire_deco.sqf";