/*
	LRG MISSION TEMPLATE
	fn_Confirmation.sqf
	Author: MitchJC
	Description: Displays a message on joining if LRG_Setup is not configured.
*/
if (not LR_start) exitWith{};
If ((Confirmation) || {(!isserver)}) exitwith {};

 [{["<t color='#F52222' size = '0.8'>CONFIGURATION!<br />You need to configure LRG_Setup.sqf</t>",0.5,.8,10,2,0,789] remoteExec ["BIS_fnc_dynamicText",0,false];}, [], 5] call CBAP_fnc_waitAndExecute;
 