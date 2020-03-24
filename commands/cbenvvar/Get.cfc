/*
 * Reads the .env file in the current folder (or submitted) and returns the value of the submitted key
 */
component {
    property name="common" inject="Common@cbengvar";
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";

    /*
     * The entry point of the command
     * @name The name of the variable desired
     * @envFileName The .env file in the current folder to read. Defaults to .env
     */
    void function run(required string name, string envFileName = '.env',string folder = getcwd() ) {
        //folder = isnull(folder) ? getcwd() : folder;
        var envFile = expandPath('#folder##envFileName#');
        var allprops = propertyFile.load(envFile);
        return allprops.get(name);
    }

}
