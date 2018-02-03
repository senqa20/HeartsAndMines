
private ["_vehicle","_marker"];

_vehicle = _this select 0;

_marker = createmarker [format ["m_%1",_vehicle],getPos _vehicle];
_marker setMarkerType "mil_box";
_marker setMarkerColor "ColorRed";
_marker setMarkerText format ["%1 wreck",getText (configFile >> "cfgVehicles" >> typeof _vehicle >> "displayName")];

_vehicle setVariable ["marker",_marker];

if (isServer) then {btc_rep_malus_veh_killed spawn btc_fnc_rep_change} else {btc_rep_malus_veh_killed remoteExec ["btc_fnc_rep_change", 2];};