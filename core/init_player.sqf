
[] execVM "core\doc.sqf";

[] spawn {
	waitUntil {!isNull player};

	player addRating 9999;
	btc_player_respawn = getPosASL player;
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

	player addEventHandler ["Respawn", btc_fnc_eh_player_respawn];
	player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
	["ace_treatmentSucceded", btc_fnc_eh_treatment] call CBA_fnc_addEventHandler;

	call btc_fnc_int_add_actions;

	if (player getVariable ["interpreter", false]) then {player createDiarySubject ["Diary log","Diary log"];};

	

	waitUntil {scriptDone btc_intro_done};
	{[_x] call btc_fnc_task_create} foreach ((player call BIS_fnc_tasksUnit) select {[_x] call BIS_fnc_taskState isEqualTo "ASSIGNED"});
};

if (btc_debug) then {

	private ["_eh"];

	onMapSingleClick "if (vehicle player == player) then {player setpos _pos} else {vehicle player setpos _pos}";
	player allowDamage false;

	waitUntil {!isNull (findDisplay 12)};
	_eh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_fnc_marker_debug];

	btc_marker_debug_cond = true;
	[_eh] spawn btc_fnc_systemchat_debug;
};