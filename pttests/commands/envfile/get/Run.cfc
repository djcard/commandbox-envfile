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
	
		describe( "The get comamand", function(){
			beforeEach(function(){
				testobj=createMock("commands.envfile.get");
				mockPropertyFile=createEmptyMock("models.common");
				mockPropertyFile.$(method="load",returns=mockPropertyFile);
				mockPropertyFile.$(method="getsyncedNames",returns=["fred","tim"]);
				mockPropertyFile.$(method="get",returns="YO");
				mockCommon=createmock("models.common");
				mockCommon.$(method="printme",returns=true);
				testobj.$(method="getcwd",returns='');
			});
			it( "If the file does not exist, print a message and exit", function(){
				mockCommon.$(method="doesFileExist",returns=false);
				testobj.setCommon(mockCommon);
				testobj.setpropertyFile(mockPropertyFile);
				var testme=testobj.run("myFile");
				expect( mockCommon.$count("printme") ).toBe(1);
			});

			it( "If the file does exist, load and get property", function(){
				mockCommon.$(method="doesFileExist",returns=true);
				testobj.setCommon(mockCommon);
				testobj.setpropertyFile(mockPropertyFile);
				var testme=testobj.run("myFile");
				expect( mockCommon.$count("printme") ).toBe(0);
				//expect( mockPropertyFile.$count("load") ).toBe(1);
				//expect( mockPropertyFile.$count("get") ).toBe(1);
			});
			
		});
		
	}
	
}
