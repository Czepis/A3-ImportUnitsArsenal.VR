private _unit = cursorObject;

if(isNull _unit)exitWith{};
if!(_unit isKindOf "man")exitWith{};

onEachFrame {};
private _ownedDLCs = getDLCs 1;
private _config = (configFile >> "CfgVehicles");
private _faction = ((configOf _unit) >> "faction") call BIS_fnc_getCfgData;
private _editorSubCat = ((configOf _unit) >> "editorSubcategory") call BIS_fnc_getCfgData;
private _factionName = (configFile >> "CfgFactionClasses" >> _faction >> "displayName") call BIS_fnc_getCfgData;
private _editorSubCatName = (configFile >> "CfgEditorSubcategories" >> _editorSubCat >> "displayName") call BIS_fnc_getCfgData;
hint(str([_factionName,_editorSubCatName]));
//if(true)exitWith{};
/*
_config = format["getText (_x >> 'faction') == '%1'",_faction] configClasses _config;
_config = _config select {getText(_x >> "editorSubcategory") == _editorSubCat};
_config = _config select {getNumber(_x >> "scope") != 0};
*/
_config = configOf _unit;
private _pos = getPos _unit;
private _group = CreateGroup west;
private _objectDLC = 0;
//sleep 1;
//deleteVehicle _unit;
//_unit = _group CreateUnit [configName _config,_pos,[],0,"NONE"];
_objectDLC = getObjectDLC _unit;
if!(isnil "_objectDLC")then//check if the unit is from a DLC
{
	sleep 0.01;
	hint(str(_objectDLC));
	if(_objectDLC in _ownedDLCs)then //player has the DLC
	{
		[_unit,[profileNamespace,format["%1:%2: %3",_factionName,_editorSubCatName,getText (_config >> "displayName")]]] call BIS_fnc_SaveInventory;
	}
	else //player does not have the DLC
	{
	
	}
}
else //unit is from vanilla Arma 3
{
	sleep 0.01;
	[_unit,[profileNamespace,format["%1:%2: %3",_factionName,_editorSubCatName,getText (_config >> "displayName")]]] call BIS_fnc_SaveInventory;
};
oneachFrame{hintSilent(str(cursorObject))};