int __xfsample_increment = 0;
ArrayList __XFSampleList;


XFSample XFSample_ById(int id, Handle plugin)
{
    int pos;
    if (!__XFSampleList || (pos = __XFSampleList.FindValue(id)) == -1 || __XFSampleList.Get(pos, 1) != plugin)
    {
        ThrowNativeError(SP_ERROR_INDEX, "Invalid Object(XFSample) (%i)", id);
    }

    return view_as<XFSample>(id);
}

void XFSample_OnOwnerUnloaded(Handle owner)
{
    if (__XFSampleList)
    {
        int pos;
        while ((pos = __XFSampleList.FindValue(owner, 1)) != -1)
        {
            view_as<XFSample>(__XFSampleList.Get(pos)).Delete();
        }
    }
}

enum struct XFSampleData
{
    int index;
    Handle owner;

    void free()
    {
        //...
    }
}

methodmap XFSample __nullable__
{
    public XFSample(Handle owner = INVALID_HANDLE)
    {
        XFSampleData data;

        if (__xfsample_increment == 0)
        {
            __XFSampleList = new ArrayList(sizeof data);
        }

        __xfsample_increment++;

        data.index = __xfsample_increment;
        data.owner = owner;

        __XFSampleList.PushArray(data);

        return view_as<XFSample>(__xfsample_increment);
    }

    /**
     * Propeties
     */
    property int index
    {
        public get()
        {
            return view_as<int>(this);
        }
    }

    /**
     * Functions
     */
    public void GetData(XFSampleData data)
    {
        __XFSampleList.GetArray(__XFSampleList.FindValue(this.index), data);
    }

    public void SetData(XFSampleData data)
    {
        __XFSampleList.SetArray(__XFSampleList.FindValue(this.index), data);
    }

    public void Delete()
    {
        XFSampleData data;
        this.GetData(data);

        data.free();

        __XFSampleList.Erase(__XFSampleList.FindValue(this.index));
    }
}