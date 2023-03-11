public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    RegPluginLibrary("xf_sample");

    CreateNative("XFSample.XFSample",   Native_XFSample_XFSample);

    CreateNative("XFSample.Delete",     Native_XFSample_Delete);

    return APLRes_Success;
}

any Native_XFSample_XFSample(Handle plugin, int num_params)
{
    return new XFSample(plugin);
}

any Native_XFSample_Delete(Handle plugin, int num_params)
{
    XFSample sample = XFSample_ById(GetNativeCell(1), plugin);

    sample.Delete();

    return 0;
}