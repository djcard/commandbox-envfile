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
	
		describe( "CreateEnv function should", function(){
			beforeEach(function(){
				testobj=createmock("models.common");

			});
			it( "run confirm 1x if force is false", function(){
				testobj.$(method="confirm",returns=true);
				testobj.$(method="command", returns={run:function(){},params:function(){return {run:function(){}};}});

				testObj.createEnv("a","b",false);
				expect( testobj.$count("confirm") ).toBe(1);
			});
			it( "run confirm 0x if force is true", function(){
				testobj.$(method="confirm",returns=true);
				testobj.$(method="command", returns={run:function(){},params:function(){return {run:function(){}};}});

				testObj.createEnv("a","b",true);
					expect( testobj.$count("confirm") ).toBe(0);
			});

			it( "run confirm 1x if force is false and ", function(){
				testobj.$(method="confirm",returns=false);
				testobj.$(method="command", returns={run:function(){},params:function(){return {run:function(){}};}});

				testObj.createEnv("a","b",false);
					expect( testobj.$count("confirm") ).toBe(1);
			});
		});
		
	}
	
}
