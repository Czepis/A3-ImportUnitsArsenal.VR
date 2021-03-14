private _loadouts = profilenamespace getvariable ["bis_fnc_saveInventory_data",[]];
private _i = 0;

for[{_i=0},{_i<count _loadouts},{_i=_i+2}]do
{
	[player,[profileNamespace,_loadouts select _i],[],true] call BIS_fnc_saveInventory; //BIS_fnc_deleteInventory is fucked
};