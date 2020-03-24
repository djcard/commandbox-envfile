/*
 * Displays the contents of the .env (or submitted file)
 */
component {
    property name="common" inject="Common@cbengvar";
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";

    /*
     * The entry point of the command
     * @envFileName The .env file in the current folder to read. Defaults to .env
     */
    void function run(string envFileName = '.env', string folder = getcwd()) {
        var envFile = expandPath('#folder##envFileName#');
        if(!common.doesFileExist(envFile)){
            common.printme("The #envFileName# files does not exist. Use Set or PopulateExample to create one.");
            return;
        }
        var allprops = propertyFile.load(envFile);
        allprops
            .getsyncedNames()
            .map(function(item) {
                common.printme(item & ' = ' & allprops.get(item));
            });
    }

}
