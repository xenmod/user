#if defined _xf_user_included
    #endinput
#endif
#define _xf_user_included

#if !defined _xf_api_included
    #include <xf_api>
#endif

#include <xf_api/user>

public SharedPlugin __pl_xf_user= 
{
	name = "xf_user",
	file = "xf_user.smx",
#if defined REQUIRE_PLUGIN
	required = 1
#else
	required = 0
#endif
};

#if !defined REQUIRE_PLUGIN
public void __pl_xf_user_SetNTVOptional()
{
	MarkNativeAsOptional("XFUser.XFUser");

    MarkNativeAsOptional("XFUser.Delete");
}
#endif