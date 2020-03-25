/*
 * The common functions for envfile
 */
component {

    property name="print" inject="PrintBuffer";

    /*
     *   Seperated out commandline printing for testing purposes
     * @text What text to display
     * @styleName The formatting for the output in the format of redLine
     */
    void function printme(string text = '', string styleName = 'line') {
        print[styleName](text).toConsole();
    }

    /*
     * Checks whether a file exists
     * @envFileName absolute path to a file on the drive
     */
    boolean function doesFileExist(required string envFileName) {
        return fileExists(envFileName);
    }

    /*
     * Confirms whether to create the .env file or not then creates it
     * @envFileName The full path and file to the file to create
     * @envFile The filename to create (typically .env)
     * @force whether to bypass confirmation about creating the file
     */
    boolean function createEnv(required string envFileName, required string envFile, boolean force = false) {
        var createFile = force ? true : confirm(
            message = 'The file #envFileName# does not appear to exist. Do you want to create it? [y/n]'
        );
        if (createFile) {
            command('touch #envFile#').run();
        }
        return createFile;
    }

}
