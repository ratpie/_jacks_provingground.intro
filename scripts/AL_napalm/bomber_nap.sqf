// by ALIAS

if (!isServer) exitWith {};

_start_marker		= _this select 0;
_waypoint_marker	= _this select 1;
number_of_bombs		= _this select 2;
bomb_drop_interval	= _this select 3;
_plane_type			= _this select 4;
publicVariable "number_of_bombs";
publicVariable "bomb_drop_interval";

// pe baza marketului se stabileste vectorul de zbor pentru JET
_pos1 = getMarkerPos _start_marker; // markerul ce indica punctul din care incepe bombardamentul - trebuie plasat pe harta
_pos2 = getMarkerPos _waypoint_marker; // markerul ce indica punctul incotro zboara avaionul - trebuie plasat pe harta
_unghi = [_pos1,_pos2] call BIS_fnc_dirTo;
_unghiorig = _unghi - 180;

_origpos = [_pos1, 1500, _unghiorig] call BIS_fnc_relPos;
_finpos = [_pos2, 3000, _unghi] call BIS_fnc_relPos;

_avion_nap = [_origpos, _unghi,_plane_type, civilian] call bis_fnc_spawnvehicle;
_veh_avion = _avion_nap select 0;
_veh_avion allowdamage false;
_veh_avion setPosATL [getPosATL _veh_avion select 0, getPosATL _veh_avion select 1, 400];
_veh_avion setcombatmode "BLUE";
_veh_avion setBehaviour "AWARE";
_veh_avion disableAI "TARGET";
_veh_avion disableAI "AUTOTARGET";
_veh_avion flyInHeight 150;

_wp1 = group _veh_avion addWaypoint [_pos1, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWayPointBehaviour "AWARE";
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointStatements ["true", "[this] execvm 'scripts\AL_napalm\alias_napalm_ini.sqf'"];


_wp2 = group _veh_avion addWaypoint [_pos2, 1];
_wp2 setWaypointType "MOVE";
_wp2 setWayPointBehaviour "AWARE";
_wp2 setWaypointSpeed "NORMAL";

_wp3 = group _veh_avion addWaypoint [_finpos, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWayPointBehaviour "AWARE";
_wp3 setWaypointSpeed "NORMAL";

sleep 287;
{deleteVehicle _x} forEach (crew _veh_avion)+[_veh_avion];