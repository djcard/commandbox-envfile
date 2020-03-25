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
        describe('Populate Example', function() {
            beforeEach(function() {
                testobj = createMock('commands.envfile.populateFromExample');
                testobj.$(method = 'getcwd', returns = '');
                testobj.$(method = 'ask', returns = 'ff');

                mockSourcePropertyFile = createEmptyMock('models.common');
                mockTargetPropertyFile = createEmptyMock('models.common');

                mockSourcePropertyFile.$(method = 'load', returns = mockSourcePropertyFile);
                mockSourcePropertyFile.$(method = 'getsyncedNames', returns = ['fred', 'tim']);
                mockSourcePropertyFile.$(method = 'get', returns = 'YO');

                mockTargetPropertyFile.$(method = 'load', returns = mockTargetPropertyFile);
                mockTargetPropertyFile.$(method = 'getsyncedNames', returns = []);
                mockTargetPropertyFile.$(method = 'get', returns = 'YO');
                mockTargetPropertyFile.$(method = 'set', returns = 'YO');
                mockTargetPropertyFile.$(method = 'store', returns = 'YO');


                mockCommon = createmock('models.common');
                mockCommon.$(method = 'printme', returns = true);
                mockCommon.$(method = 'createEnv', returns = true);
                mockCommon.$(
                    method = 'command',
                    returns = {
                        run: function() {
                        },
                        params: function() {
                            return {
                                run: function() {
                                }
                            };
                        }
                    }
                );
                testobj.$(method = 'getcwd', returns = '');
            });

            it('If the sourceFile does not exist,print a line and exit', function() {
                mockCommon.$(method = 'doesFileExist', returns = false);
                testobj.setCommon(mockCommon);
                testobj.setpropertyFile(mockTargetPropertyFile);
                testobj.setexampleFile(mockSourcePropertyFile);

                var testme = testobj.run('envF', 'exampleF');
                expect(mockCommon.$count('printme')).toBe(1);
            });

            it('If the sourceFile exists,load the source file and check if the target file exists', function() {
                mockCommon.$(method = 'doesFileExist').$results(true, false);
                mockCommon.$(method = 'confirm').$results(true);
                testobj.setCommon(mockCommon);
                testobj.setpropertyFile(mockTargetPropertyFile);
                testobj.setexampleFile(mockSourcePropertyFile);

                var testme = testobj.run('envF', 'exampleF');
                expect(mockCommon.$count('doesFileExist')).toBe(2);
                expect(mockSourcePropertyFile.$count('load')).toBe(1);
                expect(mockCommon.$count('createEnv')).toBe(1);
                expect(mockCommon.$count('createEnv')).toBe(1);
            });
        });
    }

}
