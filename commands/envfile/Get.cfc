/*
 * Reads the .env file in the current folder (or submitted) and returns the value of the submitted key
 */
component accessors="true"{
    property name="common" inject="Common@cbeditenv";
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";

    /*
     * The entry point of the command
     * @name The name of the variable desired
     * @envFileName The .env file in the current folder to read. Defaults to .env
     */
    string function run(required string name, string envFileName = '.env',string folder = getcwd() ) {
        //folder = isnull(folder) ? getcwd() : folder;
        var envFile = expandPath('#folder##envFileName#');
        if(!common.doesFileExist(envFile)){
            common.printme("The file #envFile# does not exist");
            return;
        }
        var allprops = propertyFile.load(envFile);
        return allprops.get(name);
    }

}
