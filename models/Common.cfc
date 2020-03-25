component {
    property name="print"          inject="PrintBuffer";

    void function printme(text,funcName="line"){
        print[funcName](text).toConsole();
    }

    boolean function doesFileExist(envFileName){
        return fileExists(envFileName);
    }

    boolean function createEnv(required string envFileName,required string envFile,boolean force = false){
        var createFile= force ? true : confirm(message="The file #envFileName# does not appear to exist. Do you want to create it? [y/n]");
        if(createFile){
                command("touch #envFile#").run();
        }
        return createFile;
    }
}
