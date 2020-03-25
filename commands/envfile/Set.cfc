/*
 * Adds a key value pair to the .env file in the current folder (or submitted file)
 */
component accessors="true"{
    property name="common" inject="Common@cbeditenv";
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";

    /*
     * The entry point of the command
     * @name The name of the variable desired
     * @value The value of the variable desired
     * @envFileName The .env file in the current folder to read. Defaults to .env
     */
    void function run(
        required string name,
        string value = '',
        string envFileName = '.env',
        string folder = getcwd(),
        boolean force=false
        
    ) {
        var envFile = expandPath('#folder##envFileName#');
        var continuer = common.doesFileExist(envFile) ? true : common.createEnv(envFileName,envFile,force);
        if(continuer) {
            var allprops = propertyFile.load(envFile);
            allprops.set(name, value);
            allprops.store();
        }
    }



}
