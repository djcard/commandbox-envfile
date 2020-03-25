/*
 * Accepts a path to an example env file (defaults to .env.example) and a target .env and walks the user through populating the "real" one from the example
 */
component accessors="true" {

    property name="propertyFile" inject="provider:PropertyFile@propertyFile";
    property name="exampleFile" inject="provider:PropertyFile@propertyFile";
    property name="common" inject="Common@cbeditenv";

    /*
     * The entry point of the command
     * @envFileName The path and name of the .env file
     * @exampleFileName The path to the example .envfile
     */
    void function run(string envFileName = '.env', string exampleFileName = '.env.example', ) {
        var sourceFile = '#getcwd()##exampleFileName#';
        if (!common.doesFileExist(sourceFile)) {
            common.printme('The example file, #sourceFile# given does not exist');
            return;
        }
        var source = exampleFile.load(sourceFile);
        var targetFile = '#getcwd()##envFileName#';
        var continuer = common.doesFileExist(targetFile) ? true : common.createEnv(targetFile, envFileName);

        if (continuer) {
            var target = propertyFile.load(targetFile);

            source
                .getSyncedNames()
                .map(function(name, value) {
			var existingValue = '';
try{
	var existingValue = target.get(name)
}
catch(any err){};
                    var newVal = ask(message = 'New Value for - #name#: ',defaultResponse='#existingValue#');
                    target.set(name, newVal);
                });
            target.store();
            common.printme('All values saved');
        }
    }

}
