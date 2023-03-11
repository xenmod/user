/**
 * Just replace "Sample" and "sample" with your entity name.
 */

#pragma semicolon 1

#include <sourcemod>
#include <xf_api>

#pragma newdecls required

#include "xf_sample/entity/sample.sp"

#include "xf_sample/natives.sp"

public Plugin myinfo =
{
	name    = "",
	author	= "",
	version = "1.0.0 b_"...SOURCEMOD_VERSION
};

public void OnNotifyPluginUnloaded(Handle plugin)
{
	XFSample_OnOwnerUnloaded(plugin);
}