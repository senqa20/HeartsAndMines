openMap true;

onMapSingleClick {
onMapSingleClick {};
player setpos _pos;
_height = 1800;
this addBackpack "B_Parachute";
[player,_height] spawn BIS_fnc_halo;
hint '';
openMap false;
true
};