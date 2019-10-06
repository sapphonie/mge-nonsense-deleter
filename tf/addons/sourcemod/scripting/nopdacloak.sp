#pragma semicolon 1

#include <sourcemod>
#include <tf2_stocks>

public Plugin myinfo = {
	name		= "PDA/Cloak/Disguise Kit Remover",
	author		= "timtam95, Sgt. Gremulock, stephanie",
	description = "Removes spy's disguise kit, cloak weapons, and removes engineer's pdas",
	version		= "1.0.1",
	url			= "sourcemod.net"
};

public void OnPluginStart()
{
	HookEvent("post_inventory_application", Event_PlayerSpawn);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));

	if (IsValidClient(client))
	{
		if (TF2_GetPlayerClass(client) == TFClass_Spy || TFClass_Engineer)
		{
			TF2_RemoveWeaponSlot(client, TFWeaponSlot_Grenade);
			TF2_RemoveWeaponSlot(client, TFWeaponSlot_Building);
		}
	}
}


bool IsValidClient(int client)
{
	if (client <= 0 || client > MaxClients || !IsClientConnected(client))
	{
		return false;
	}

	return IsClientInGame(client);
}
