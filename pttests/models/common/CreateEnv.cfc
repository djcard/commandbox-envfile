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
        describe('CreateEnv function should', function() {
            beforeEach(function() {
                testobj = createmock('models.common');
                mockBase=createEmptyMock("models.common");

            });
            it('run confirm 1x if force is false', function() {
                mockBase.$(method = 'confirm', returns = true);
                mockBase.$(
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
                testobj.setBase(mockBase);
                testObj.createEnv('a', 'b', false);
                expect(mockBase.$count('confirm')).toBe(1);
            });
            it('run confirm 0x if force is true', function() {
                testobj.$(method = 'confirm', returns = true);
                mockBase.$(
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
                testobj.setBase(mockBase);
                testObj.createEnv('a', 'b', true);
                expect(testobj.$count('confirm')).toBe(0);
            });

            it('run confirm 1x if force is false and ', function() {
                mockBase.$(method = 'confirm', returns = false);
                mockBase.$(
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
                testobj.setBase(mockBase);
                testObj.createEnv('a', 'b', false);
                expect(mockBase.$count('confirm')).toBe(1);
            });
        });
    }

}
