/**
 * My BDD Test
 */
component extends="testbox.system.BaseSpec" {

    /*********************************** LIFE CYCLE Methods ***********************************/

    /*
     * executes before all suites+specs in the run() method
     */
    void function beforeAll() {
    }

    /*
     * executes after all suites+specs in the run() method
     */
    void function afterAll() {
    }

    /*********************************** BDD SUITES ***********************************/

    void function run() {
        describe('Does File Exist', function() {
            beforeEach(function() {
                testobj = createObject('models.Common');
            });
            it('Should return true if the file exists', function() {
                testme = testobj.doesFileExist(expandPath(cgi.script_name));
                expect(testme).toBeTrue();
            });

            it('should do something else', function() {
                testme = testobj.doesFileExist(expandPath('THISFILESHOULDNOTEXIST.FGH'));
                expect(testme).toBeFalse();
            });
        });
    }

}
