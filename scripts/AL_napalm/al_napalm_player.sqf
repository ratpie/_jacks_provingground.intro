//this addEventHandler ["Fired",{private ["_bomb_type","_plane_player","_custom_napalm_bomb"]; _plane_player = _this select 0; _bomb_type = _this select 6; _custom_napalm_bomb = "Bomb_04_F"; [[_bomb_type,_plane_player,_custom_napalm_bomb],"scripts\AL_napalm\al_napalm_player.sqf"] remoteExec ["execVM"]}];

if (!isServer) exitWith {};

_bomb_type_al			= _this select 0;
_plane_player_al 		= _this select 1;
_custom_napalm_bomb_al	= _this select 2;

if (typeOf _bomb_type_al == _custom_napalm_bomb_al) then 
{

	waitUntil {(getposATL _bomb_type_al select 2)<15};
	_poz_blow = [getPos _bomb_type_al select 0, getPos _bomb_type_al select 1];
	deletevehicle _bomb_type_al;
	_nap_obj_b = "Land_HelipadEmpty_F" createVehicle [_poz_blow select 0,_poz_blow select 1,1];
	_flow = (getposasl _nap_obj_b vectorFromTo getposasl _plane_player_al) vectorMultiply 5;
	_dir_x = 5*(_flow select 0);
	_dir_y = 5*(_flow select 1);	
	[[_nap_obj_b,_dir_x,_dir_y],"scripts\AL_napalm\alias_napalm_effect.sqf"] remoteExec ["execVM"];
	[_nap_obj_b,300,60,10,0.5,true,10] execVM "scripts\AL_fire\al_fire_deco.sqf";
	[[_nap_obj_b,_dir_x,_dir_y],"scripts\AL_napalm\alias_napalm_effect.sqf"] remoteExec ["execVM"];
	_nr_bat = floor (3+random 7);
	[[_nap_obj_b,_nr_bat],"scripts\AL_napalm\alias_buc_nap.sqf"] remoteExec ["execVM"];
	[_nap_obj_b] spawn {_de_sters = _this select 0;	sleep 300+random 60;deletevehicle _de_sters};
};