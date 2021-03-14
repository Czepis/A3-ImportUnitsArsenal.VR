private _unit = cursorObject;

if(isNull _unit)exitWith{};
if!(_unit isKindOf "man")exitWith{};

onEachFrame {};
private _config = (configFile >> "CfgVehicles");
private _faction = ((configOf _unit) >> "faction") call BIS_fnc_getCfgData;
private _editorSubCat = ((configOf _unit) >> "editorSubcategory") call BIS_fnc_getCfgData;
private _factionName = (configFile >> "CfgFactionClasses" >> _faction >> "displayName") call BIS_fnc_getCfgData;
private _editorSubCatName = (configFile >> "CfgEditorSubcategories" >> _editorSubCat >> "displayName") call BIS_fnc_getCfgData;
hint(str([_factionName,_editorSubCatName]));
//if(true)exitWith{};
_config = format["getText (_x >> 'faction') == '%1'",_faction] configClasses _config;
_config = _config select {getText(_x >> "editorSubcategory") == _editorSubCat};
_config = _config select {getNumber(_x >> "scope") != 0};
private _pos = getPos _unit;
deleteVehicle _unit;
private _group = CreateGroup west;
{
	//sleep 1;
	_unit = _group CreateUnit [configName _x,_pos,[],0,"NONE"];
	sleep 0.01;
	[_unit,[profileNamespace,format["%1:%2: %3",_factionName,_editorSubCatName,getText (_x >> "displayName")]]] call BIS_fnc_SaveInventory;
	deleteVehicle _unit;
}
foreach _config;
oneachFrame{hintSilent(str(cursorObject))};