component {
    property name="propertyFile" inject="provider:PropertyFile@propertyFile";
    property name="exampleFile" inject="provider:PropertyFile@propertyFile";

    void function run(string envFileName = '.env',string exampleFileName = '.env.example',){
        var source = exampleFile.load('#getcwd()##exampleFileName#');
        var target=propertyFile.load('#getcwd()##envFileName#');
        source.getSyncedNames().map(function(name,value){
            var newVal=ask(message="New Value for: #name#");
            target.set(name, newVal);
        });
        target.store();
        print.line(target.getSyncedNames());
    }
}
