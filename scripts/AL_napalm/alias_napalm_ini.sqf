// by ALIAS
if (!isServer) exitWith {};

_bombardier_x	= _this select 0;

ib=0;
while {ib < number_of_bombs} do 
{
	private ["_nap_obj_princ","_flow"];
	_nap_obj_princ = "Bomb_03_F" createvehicle ([getPosATL _bombardier_x select 0,getPosATL _bombardier_x select 1,(getPosATL _bombardier_x select 2)-5]);
	ib=ib+1;
	[_nap_obj_princ,_bombardier_x] spawn 
	{
		_nap_obj	= _this select 0;
		_bombardier = _this select 1;
		[_nap_obj, -125, 0] call BIS_fnc_setPitchBank;
		_alt_b = getposATL _nap_obj select 2;
		while {_alt_b>15} do {_alt_b = getposATL _nap_obj select 2;	sleep 0.1};
		
		_poz_blow = [getPos _nap_obj select 0, getPos _nap_obj select 1];
		private ["_objects","_object","_data"];
		_data = [
			["Particle_BigFire_F", [5749.61,6587.85,166.324], [[0,0.99984,0.0178933],[0.00343536,-0.0178932,0.999834]]]
		];
		_objects = [];
		{
			_object = (_x select 0) createVehicle (ASLToAGL(_x select 1));
			//_object setVectorDirAndUp (_x select 2);
			_object setPos _poz_blow;
			_object enableSimulationGlobal true;
			_objects pushBack _object;
		} forEach _data;
		_objects;

		deletevehicle _nap_obj;
		_nap_obj_b = "Land_HelipadEmpty_F" createVehicle [_poz_blow select 0,_poz_blow select 1,0];
		
		_flow = (getposasl _nap_obj_b vectorFromTo getposasl _bombardier) vectorMultiply 5;
		_dir_x = 5*(_flow select 0);
		_dir_y = 5*(_flow select 1);
		
		[_nap_obj_b,300,60,10,0.5,true,10] execVM "scripts\AL_fire\al_fire_deco.sqf";
		[[_nap_obj_b,_dir_x,_dir_y],"scripts\AL_napalm\alias_napalm_effect.sqf"] remoteExec ["execVM"];
		_nr_bat = floor (3+random 7);
		[[_nap_obj_b,_nr_bat],"scripts\AL_napalm\alias_buc_nap.sqf"] remoteExec ["execVM"];
		[_nap_obj_b] spawn {_de_sters = _this select 0;	sleep 300+(random 120);	deletevehicle _de_sters};
	};
	sleep 0.35+ random bomb_drop_interval;
};