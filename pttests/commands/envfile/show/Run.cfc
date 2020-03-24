/**
* My BDD Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

/*********************************** BDD SUITES ***********************************/

	function run(){
	
		describe( "My test Suite", function(){
			beforeEach(function(){
				testobj=createObject("commands.envfile.Show");
				mockPropertyFile=createEmptyMock();
				mockPropertyFile.$(method="load",returns=true);
				mockPropertyFile.$(method="getsyncedNames",returns=[]);
				mockCommon=createmock(models.common);

			});
			it( "If the file doesn't exist, print a message and exit", function(){
				mockCommon.$(method="doesFileExist",returns=true);
				mockCommon.$(method="printme",returns=true);
				testobj.setCommon(mockCommon);
				testobj.setpropertyFile(mockPropertyFile);

                expect( testObj.$count("printme") ).toBe(7);
			});
			
			it( "should do something else", function(){
                expect( false ).toBeTrue();
			});
			
		});
		
	}
	
}
