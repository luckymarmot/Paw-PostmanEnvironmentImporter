var PostmanEnvironmentImporter = function() {
	
	this.importString = function(context, string) {
		
		// Parse JSON collection
		var postmanCollection = JSON.parse(string);
		
		// Check Postman data
		if (!postmanCollection || !postmanCollection["values"] || !postmanCollection["name"]) {
			console.log("Invalid Postman data");
			return false;
		}
		
		var pawEnvironmentDomain = context.createEnvironmentDomain("Imported (Postman)");
		var pawEnvironment = pawEnvironmentDomain.createEnvironment(postmanCollection["name"]);
		
		var variablesDict = new Object;
		for (var i in postmanCollection["values"]) {
			var postmanValue = postmanCollection["values"][i];
			variablesDict[postmanValue["key"]] = postmanValue["value"];
		}
		
		pawEnvironment.setVariablesValues(variablesDict);
		
		return true;
	};
}

PostmanEnvironmentImporter.identifier = "com.luckymarmot.PawExtensions.PostmanEnvironmentImporter";
PostmanEnvironmentImporter.title = "Postman (Environment)";

registerImporter(PostmanEnvironmentImporter);
