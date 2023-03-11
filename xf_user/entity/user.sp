int __xfuser_increment = 0;
ArrayList __XFUserList;


XFUser XFUser_ById(int id, Handle plugin)
{
    int pos;
    if (!__XFUserList || (pos = __XFUserList.FindValue(id)) == -1 || __XFUserList.Get(pos, 1) != plugin)
    {
        ThrowNativeError(SP_ERROR_INDEX, "Invalid Object(XFUser) (%i)", id);
    }

    return view_as<XFUser>(id);
}

void XFUser_OnOwnerUnloaded(Handle owner)
{
    if (__XFUserList)
    {
        int pos;
        while ((pos = __XFUserList.FindValue(owner, 1)) != -1)
        {
            view_as<XFUser>(__XFUserList.Get(pos)).Delete();
        }
    }
}

enum struct XFUserData
{
    int index;
    Handle owner;

    void free()
    {
        //...
    }
}

methodmap XFUser __nullable__
{
    public XFUser(Handle owner = INVALID_HANDLE)
    {
        XFUserData data;

        if (__xfuser_increment == 0)
        {
            __XFUserList = new ArrayList(sizeof data);
        }

        __xfuser_increment++;

        data.index = __xfuser_increment;
        data.owner = owner;

        __XFUserList.PushArray(data);

        return view_as<XFUser>(__xfuser_increment);
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
    public void GetData(XFUserData data)
    {
        __XFUserList.GetArray(__XFUserList.FindValue(this.index), data);
    }

    public void SetData(XFUserData data)
    {
        __XFUserList.SetArray(__XFUserList.FindValue(this.index), data);
    }

    public void Delete()
    {
        XFUserData data;
        this.GetData(data);

        data.free();

        __XFUserList.Erase(__XFUserList.FindValue(this.index));
    }
}