﻿/*
 * Author: Psycho
 
 * Broadcast everything across the network which is needed if a unit fall in agony
 
 * Arguments:
	0: Unit (Object)
	1: Unconcsious state of the Unit (Bool)
 
 * Return value:
	Nothing
 */

params [
	["_unit", objNull, [player]],
	["_is_unoncsious", false, [false]]
];

if (isNull _unit) exitWith {diag_log format ["Non existing unit or wrong data type passed. AIS_System_fnc_unconcsiousRemote.sqf"];};


if (_is_unoncsious) then {
	[_unit, "agonyStart"] remoteExec ["playActionNow", 0, false];
	//_unit playActionNow "agonyStart";
	
	if (local player) then {
		_condition = false;

        _condition = call {
        	if (LRG_AIS_SHOW_UNC_MESSAGE_TO IsEqualTo 0) exitwith {false};
        	if (LRG_AIS_SHOW_UNC_MESSAGE_TO IsEqualTo 1) exitwith {_unit in units group player};
        	if (LRG_AIS_SHOW_UNC_MESSAGE_TO IsEqualTo 2) exitwith {side _unit isEqualTo playerSide};
        	false;
        };
		
		if (_condition) then {
			[side _unit,"HQ"] sideChat format ["%1 is down and needs help at %2!",name _unit, mapGridPosition _unit];
		};
		
		if (LRG_AIS_SHOW_UNC_MARKERS) then {
			_unit call LRG_AIS_Effects_fnc_injuredMarker;
		};
	};
	
} else {

	[_unit, "agonyStop"] remoteExec ["playActionNow", 0, false];
	//_unit playActionNow "agonyStop";
	
	[_unit, 50] call LRG_AIS_system_fnc_reveal;
	
	addSwitchableUnit _unit;
	if (ais_reenable_teamswitch) then {
		enableTeamswitch true;
	};
	
	if (isPlayer _unit) then {
		if (local player) then {
			showHud true;
			if (LRG_AIS_TOGGLE_RADIO) then {
				[true] call LRG_AIS_Effects_fnc_toggleRadio;
			};
		};
	};
	
	if (LRG_AIS_SHOW_UNC_MARKERS && {local player}) then {
		_unit call LRG_AIS_Effects_fnc_removeinjuredMarker;
	};
};


true