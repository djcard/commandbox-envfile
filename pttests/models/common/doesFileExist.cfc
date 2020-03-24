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
	
		describe( "Does File Exist", function(){
			beforeEach(function(){
				testobj=createObject("models.Common");
			});
			it( "Should return true if the file exists", function(){
				testme=testobj.doesFileExist(expandpath(cgi.script_name));
                expect( testme ).toBeTrue();
			});
			
			it( "should do something else", function(){
				testme=testobj.doesFileExist(expandpath("THISFILESHOULDNOTEXIST.FGH"));
                expect( testme ).toBeFalse();
			});
			
		});
		
	}
	
}
