public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    RegPluginLibrary("xf_user");

    CreateNative("XFUser.XFUser",	Native_XFUser_XFUser);

    CreateNative("XFUser.Delete",	Native_XFUser_Delete);

    return APLRes_Success;
}

any Native_XFUser_XFUser(Handle plugin, int num_params)
{
    return new XFUser(plugin);
}

any Native_XFUser_Delete(Handle plugin, int num_params)
{
    XFUser user = XFUser_ById(GetNativeCell(1), plugin);

    user.Delete();

    return 0;
}