#if defined _xf_sample_included
    #endinput
#endif
#define _xf_sample_included

#if !defined _xf_api_included
    #include <xf_api>
#endif

#include <xf_api/sample>

public SharedPlugin __pl_xf_sample= 
{
	name = "xf_sample",
	file = "xf_sample.smx",
#if defined REQUIRE_PLUGIN
	required = 1
#else
	required = 0
#endif
};

#if !defined REQUIRE_PLUGIN
public void __pl_xf_sample_SetNTVOptional()
{
	MarkNativeAsOptional("XFSample.XFSample");

    MarkNativeAsOptional("XFSample.Delete");
}
#endif