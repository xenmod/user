/**
 * Just replace "User" and "user" with your entity name.
 */

#pragma semicolon 1

#include <sourcemod>
#include <xf_api>

#pragma newdecls required

#include "xf_user/entity/user.sp"

#include "xf_user/natives.sp"

public Plugin myinfo =
{
	name    = "[XM] User",
	author	= "github.com/xenmod",
	version = "1.0.0 b_"...SOURCEMOD_VERSION
};

public void OnNotifyPluginUnloaded(Handle plugin)
{
	XFUser_OnOwnerUnloaded(plugin);
}