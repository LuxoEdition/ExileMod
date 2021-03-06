/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_delay","_function","_params","_persistance","_threadId"];
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_threadId = ExileSystemThreadID;
ExileSystemSpawnThread pushBack [_delay, diag_tickTime, _function,_params, _threadId, _persistance];
ExileSystemThreadDelays pushBack _delay;
[] call ExileServer_system_thread_threadAdjust;
ExileSystemSpawnThread = [ExileSystemSpawnThread, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
	format ["Job with handle %1 added.", _threadId] call ExileServer_util_log;
ExileSystemThreadID = ExileSystemThreadID + 1;
_threadId