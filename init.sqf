call compile preprocessFileLineNumbers "scripts\code34\oo_hashmap.sqf";

globalCaptures = ["new",[]] call OO_HASHMAP;
publicVariable "globCaptures";
