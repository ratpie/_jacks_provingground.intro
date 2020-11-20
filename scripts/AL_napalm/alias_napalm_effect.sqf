// by ALIAS
// null = [] execvm "scripts\AL_napalm\alias_napalm_effect.sqf";

private ["_nap_bomb","_nap_bombix","_dir_xx","_dir_yy","_li_exp"];

if (!hasInterface) exitWith {};

_nap_bombix = _this select 0;
_dir_xx = _this select 1;
_dir_yy = _this select 2;

_nap_bomb = "Land_HelipadEmpty_F" createVehicleLocal getPosATL _nap_bombix;

[_nap_bomb] spawn {
	private ["_nap_bomb"];
	_nap_bomb = _this select 0;
	_delay_sound = linearConversion [0,2000,player distance _nap_bomb,0,1.5,false];
	_dist_pitch = linearConversion [0,2000,player distance _nap_bomb,1,0.01,true];
	//if (vehicle player != player) 
	sleep _delay_sound;
	if (isTouchingGround player) then {enableCamShake true;_power_sh = linearConversion [0,1000,player distance _nap_bomb,3,0,true];addCamShake [_power_sh,2,11]};
	_nap_bomb say3d ["napalm",4000,_dist_pitch];
	_eko=["eko_1","eko_2","eko_3"] call BIS_fnc_selectRandom;
	sleep 5+random 3;
	playsound _eko;
};

// scantei
_ini_flame = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_ini_flame setParticleCircle [0,[0,0,0]];
_ini_flame setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_ini_flame setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,0,32,0],"","Billboard",1,1,[0,0,2],[0,0,0],0,10,8,0,[80],[[1,1,1,1]],[3],0,0,"","",_nap_bomb];
_ini_flame setDropInterval 100;	

[_ini_flame] spawn {
	_de_sters = _this select 0;
	sleep 1;
	deleteVehicle _de_sters;
};

// scantei
_scantei = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_scantei setParticleCircle [20,[40,40,50]];
_scantei setParticleRandom [1,[5,5,5],[30,30,20],0,0.1,[0,0,0,0.1],1,0];
_scantei setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,3,[0,0,5],[_dir_xx,_dir_yy,0],0,300,10,15,[1.5,0.5],[[1,1,1,1],[1,1,1,1]],[1],1,0,"","",_nap_bomb,0,false,-1,[[1,0.1,0,1]]];
_scantei setDropInterval 0.005;	

[_scantei] spawn {
	_de_sters = _this select 0;
	sleep 0.5;
	deleteVehicle _de_sters;
};

// fum alb
_wave = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_wave setParticleCircle [30,[30,30,0]];
_wave setParticleRandom [0.1,[3,3,0],[-20,-20,0],0,0.1,[0,0,0,0.1],0,0];
_wave setParticleParams [["\A3\data_f\cl_basic.p3d",1,0,1],"","Billboard",1,2,[0,0,0],[0,0,0],0,17,13,0,[15,30],[[1,1,1,0.3],[0,0,0,0]],[1],0,0,"","",_nap_bomb];
_wave setDropInterval 0.005;

[_wave] spawn {
	_de_sters = _this select 0;
	sleep 0.5;
	deleteVehicle _de_sters;
};

// vapori
_vapori_nap = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_vapori_nap setParticleCircle [0,[0,0,0]];
_vapori_nap setParticleRandom [0,[0,0,0],[0,0,0],0,0,[0,0,0,0],0,0];
_vapori_nap setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,0.6,[0,0,0],[0,0,1],0,10,8,0,[50,100,200],[[1,1,1,0.5],[1,1,1,0.3],[1,1,1,0]],[0],0,0,"","",_nap_bomb];
_vapori_nap setDropInterval 0.3;

[_vapori_nap] spawn {
	_de_sters = _this select 0;
	sleep 0.6;
	deleteVehicle _de_sters;
};

// scantei
_foc = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_foc setParticleCircle [10,[1,1,0]];
_foc setParticleRandom [0.1,[5,5,2],[-1,-1,0],3,0.1,[0,0,0,0.1],1,0];
_foc setParticleParams [["\A3\data_f\cl_exp",1,0,1],"","Billboard",1,2,[0,0,1],[_dir_xx,_dir_yy,0],13,10.1,7,1,[20,25,30],[[1,1,1,1],[1,1,1,0.3],[1,1,1,0]],[1],1,0,"","",_nap_bomb];
_foc setDropInterval 0.1;	

[_foc] spawn {
	_de_sters = _this select 0;
	sleep 1;
	deleteVehicle _de_sters;
};

_fum_alb = "#particlesource" createVehicleLocal getPosATL _nap_bomb;
_fum_alb setParticleCircle [20,[0,0,0]];
_fum_alb setParticleRandom [0.2,[1,1,2],[0,0,1],2,0.1,[0,0,0,0.1],1,0];
_fum_alb setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,7,[0,0,0],[_dir_xx,_dir_yy,3],5,10,7.9,0.1,[10,60,80],[[1,1,1,0.3],[1,1,1,0.2],[1,1,1,0]],[0],1,0,"","",_nap_bomb];
_fum_alb setDropInterval 0.1;

[_fum_alb] spawn {
	_de_sters = _this select 0;
	sleep 2;
	deleteVehicle _de_sters;
};

//lumina
_li_exp = "#lightpoint" createVehicle getPosATL _nap_bomb;
_li_exp lightAttachObject [_nap_bomb, [0,0,3]];
_li_exp setLightAttenuation [0,0,0,0,40,600];  
_li_exp setLightIntensity 500;
_li_exp setLightBrightness 10;
_li_exp setLightDayLight true;	
_li_exp setLightUseFlare true;
_li_exp setLightFlareSize 100;
_li_exp setLightFlareMaxDistance 2000;	
_li_exp setLightAmbient[1,0.2,0.1];
_li_exp setLightColor[1,0.2,0.1];

[_li_exp] spawn 
{
	private ["_lum_sters"];
	_lum_sters = _this select 0;
	sleep 1;
	_u=5;
	while {_u>0} do 
	{
		_lum_sters setLightBrightness _u;
		_u=_u-0.2;
		sleep 0.1;
	};
	sleep 0.5;
	deleteVehicle _lum_sters;
};

sleep 400;
deleteVehicle _nap_bomb;