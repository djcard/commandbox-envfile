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
        describe('Config should', function() {
            beforeEach(function() {
                testobj = createObject('moduleconfig');
            });
            it('not do much. No config', function() {
                var testme = testObj.configure();
                expect(true).toBeTrue();
            });
        });
    }

}
