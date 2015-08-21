module mpi.util;

/**
 * Convert D's string[] args to a correct C char** argv.
 */
auto toArgv(string[] args)
{
    import std.string : toStringz;
    auto argv = new immutable(char)*[args.length + 1];
    foreach(i, arg; args)
        argv[i] = arg.toStringz;
    argv[args.length] = null;
    return argv.ptr;
}

///
unittest
{
    auto args = ["hello", "world"];
    auto argv = args.toArgv;
    
    foreach(i, arg; args)
    {
        assert(argv[i][0 .. args[i].length] == args[i]);
        assert(argv[i][args[i].length] == 0);
    }
    assert(argv[args.length] == null);
}
