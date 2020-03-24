component {
    property name="print"          inject="PrintBuffer";

    void function printme(text,funcName="line"){
        print[funcName](text).toConsole();
    }

    boolean function doesFileExist(envFileName){
        return fileExists(envFileName);
    }

    boolean function createEnv(required string envFileName,required string envFile){
        var createFile= ask(message="The file #envFileName# does not appear to exist. Do you want to create it? Y/N :");
        if(createFile eq 'Y'){
                command("touch #envFile#").run();
        }
    }
}
