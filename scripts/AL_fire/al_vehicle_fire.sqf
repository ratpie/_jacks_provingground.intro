// by ALIAS

private ["_unit_afect","_life_time","_kill_vik","_crew_fire"];

//if (!isServer) exitwith {};

_unit_afect = _this select 0;
_life_time	= _this select 1;
_kill_vik	= _this select 2;
_crew_fire	= _this select 3;

if (!isNil {_unit_afect getVariable "on_alias_fire"}) exitWith {};
_unit_afect setVariable ["on_alias_fire",true,true];
waitUntil {!isNil "allPlayers_on"};

[[_unit_afect,_life_time,_crew_fire],"scripts\AL_fire\al_vehicle_fire_sfx.sqf"] remoteExec ["execvm"];

[_unit_afect,_life_time,_kill_vik] spawn 
{
	_unit_afect = _this select 0;
	_life_time	= _this select 1;		
	_kill_vik	= _this select 2;		
	sleep _life_time;
	sleep 0.5;
	if (_kill_vik) then {_unit_afect setDamage [1,false]}
};

if ((_crew_fire)and(_kill_vik)) then 
{
	_pasageri = fullCrew _unit_afect;
	if (count _pasageri > 0) then 
	{
		{
			if (isPlayer (_x select 0)) then {(_x select 0) setVariable ["set_on_fire",true,true]} else {_life_time= 5+random 10;[_x select 0,_life_time,15,_unit_afect] execvm "scripts\AL_fire\al_unit_fire_car.sqf"}
		} forEach _pasageri
	};
};