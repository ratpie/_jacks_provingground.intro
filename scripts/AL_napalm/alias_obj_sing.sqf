// null = [blowup] execVM "scripts\AL_napalm\alias_obj_sing.sqf";

private ["_nap_obj_b","_dir_xx","_dir_yy"];

if (!isServer) exitWith {};

_nap_obj_b = _this select 0;

[_nap_obj_b,300,60,10,0.5,true,10] execVM "scripts\AL_fire\al_fire_deco.sqf";
[[_nap_obj_b,0,0],"scripts\AL_napalm\alias_napalm_effect.sqf"] remoteExec ["execVM"];
_nr_bat = floor (3+random 7);
[[_nap_obj_b,_nr_bat],"scripts\AL_napalm\alias_buc_nap.sqf"] remoteExec ["execVM"];