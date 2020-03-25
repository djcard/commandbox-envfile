/*
 * Reads the .env file in the current folder (or submitted) and returns the value of the submitted key
 */
component accessors="true" {

    property name="common" inject="Common@cbeditenv";
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";

    /*
     * The entry point of the command
     * @name The name of the variable desired
     * @envFileName The .env file in the current folder to read. Defaults to .env
     * @folder The folder in which the .env file to use is located. Defaults to getcwd()
     */
    string function run(required string name, string envFileName = '.env', string folder = getcwd()) {
        // folder = isnull(folder) ? getcwd() : folder;
        var envFile = expandPath('#folder##envFileName#');
        if (!common.doesFileExist(envFile)) {
            common.printme('The file #envFile# does not exist');
            return;
        }
        var allprops = propertyFile.load(envFile);
        var returnValue='';
        try{
            returnValue= allprops.get(name);
        }
        catch(any err){
            //common.printme(err.keylist());
            common.printme('Error: #err.message#');
        }
        return returnValue;
    }

}
