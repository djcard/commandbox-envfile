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
        describe('The Set Command should', function() {
            beforeEach(function() {
                testobj = createMock('commands.envfile.Set');
                mockPropertyFile = createEmptyMock('models.common');
                mockPropertyFile.$(method = 'load', returns = mockPropertyFile);
                mockPropertyFile.$(method = 'getsyncedNames', returns = ['fred', 'tim']);
                mockPropertyFile.$(method = 'get', returns = 'YO');
                mockPropertyFile.$(method = 'set', returns = 'YO');
                mockPropertyFile.$(method = 'store', returns = 'YO');
                mockCommon = createmock('models.common');
                mockCommon.$(method = 'confirm', returns = true);
                mockCommon.$(method = 'printme', returns = true);

                testobj.$(method = 'getcwd', returns = '');
            });
            it('If the file does not exist, it should prompt to create it. If yes load, set and save the property', function() {
                mockCommon.$(method = 'doesFileExist', returns = false);
                mockCommon.$(method = 'createEnv', returns = 'true');
                testobj.setCommon(mockCommon);
                testobj.setpropertyFile(mockPropertyFile);
                testme = testobj.run('blah');
                expect(mockCommon.$count('doesFileExist')).toBe(1);
                expect(mockCommon.$count('createEnv')).toBe(1);
                expect(mockPropertyFile.$count('load')).toBe(1);
                expect(mockPropertyFile.$count('set')).toBe(1);
                expect(mockPropertyFile.$count('store')).toBe(1);
            });

            it('If the file does not exist, it should prompt to create it. If not exit', function() {
                mockCommon.$(method = 'doesFileExist', returns = false);
                mockCommon.$(method = 'createEnv', returns = 'false');
                testobj.setCommon(mockCommon);
                testobj.setpropertyFile(mockPropertyFile);
                testme = testobj.run('blah');
                expect(mockCommon.$count('doesFileExist')).toBe(1);
                expect(mockCommon.$count('createEnv')).toBe(1);
                expect(mockPropertyFile.$count('load')).toBe(0);
                expect(mockPropertyFile.$count('set')).toBe(0);
                expect(mockPropertyFile.$count('store')).toBe(0);
            });
            it('If the file exists, load, set and save the property', function() {
                mockCommon.$(method = 'doesFileExist', returns = true);
                mockCommon.$(method = 'createEnv', returns = 'true');
                testobj.setCommon(mockCommon);
                testobj.setpropertyFile(mockPropertyFile);
                testme = testobj.run('blah');
                expect(mockCommon.$count('doesFileExist')).toBe(1);
                expect(mockCommon.$count('createEnv')).toBe(0);
                expect(mockPropertyFile.$count('load')).toBe(1);
                expect(mockPropertyFile.$count('set')).toBe(1);
                expect(mockPropertyFile.$count('store')).toBe(1);
            });
        });
    }

}
