/*
 * Adds a key value pair to the .env file in the current folder (or submitted file)
 */
component {
    property name="common" inject="Common@cbengvar";
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
        string folder = getcwd()
        
    ) {
        //folder = isnull(folder) ? getcwd() : folder;
        var envFile = expandPath('#folder##envFileName#');
        if(!doesFileExist(envFile)){
            common.createEnv(envFileName,envFile);
        }
        var allprops = propertyFile.load(envFile);
        allprops.set(name, value);
        allprops.store();
    }



}
