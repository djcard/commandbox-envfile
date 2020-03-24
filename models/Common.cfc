component {
    property name="print"          inject="PrintBuffer";

    void function printme(text,funcName="line"){
        print[funcName](text).toConsole();
    }

    boolean function doesFileExist(envFileName){
        return fileExists(envFileName);
    }
}
