#define XFSAMPLE_VERSION   1000010 // abbccde = a.b.c d (alpha: 1, beta: 3, RC: 5, stable: 7, PL: 9) e

methodmap XFSample __nullable__
{
    /**
     * Creates an object.
     */
    public native XFSample();

    /**
     * Removes object from memory.
     */
    public native void Delete();
}