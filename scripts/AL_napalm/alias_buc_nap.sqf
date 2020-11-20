// by ALIAS

fnc_nap_schija = {
	private ["_buc_nap"];
	_buc_nap = _this select 0;
	_fum_buc = "#particlesource" createVehicleLocal getpos _buc_nap;
	_fum_buc setParticleCircle [0,[0,0,0]];
	_fum_buc setParticleRandom [0.1,[0.3,0.3,0.3],[0,0,0],0.3,0.1,[0,0,0,0.1],0,0];
	_fum_buc setParticleParams [["\A3\data_f\cl_basic.p3d",1,0,1],"","Billboard",1, 2+random 3,[0,0,0],[0,0,0.5],0,10.1,7.9,0.01,[1,3,5],[[1,1,1,1],[1,1,1,0.3],[1,1,1,0]],[0],0,0, "", "", _buc_nap];
	_fum_buc setDropInterval 0.02;
};

if (!hasInterface) exitWith {};

_nap_poz	= _this select 0;
_nr_schija	= _this select 1;

while {_nr_schija>0} do 
{
	private ["_vit_z","_vit_x","_vit_y","_buc_nap","_li_exp"];
	_vit_z = 10+random 50;
	_vit_x = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);
	_vit_y = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);
	_buc_nap = "Land_Battery_F" createVehicleLocal [getPosATL _nap_poz select 0,getPosATL _nap_poz select 1,5];
	[_buc_nap] call fnc_nap_schija;
	_buc_nap setVelocity [_vit_x,_vit_y,_vit_z];
	[_buc_nap] spawn {_de_delete = _this select 0; sleep 4;	deleteVehicle _de_delete;};
	_nr_schija = _nr_schija-1;
};