PostmanEnvironmentImporter = () ->

    @importString = (context, string) ->

        # Parse JSON
        try
            postmanEnvironments = JSON.parse string
        catch error
            throw new Error "Invalid Postman file (not a valid JSON)"

        # Check Postman data
        if not postmanEnvironments or not postmanEnvironments["values"] or not postmanEnvironments["name"]
            throw new Error "Invalid Postman file (missing data)"

        pawEnvironmentDomain = context.createEnvironmentDomain "Imported (Postman)"
        pawEnvironment = pawEnvironmentDomain.createEnvironment postmanCollection["name"]

        variablesDict = {}
        for postmanValue in postmanCollection["values"]
            variablesDict[postmanValue["key"]] = postmanValue["value"]

        pawEnvironment.setVariablesValues variablesDict

        return true;

    return

PostmanEnvironmentImporter.identifier = "com.luckymarmot.PawExtensions.PostmanEnvironmentImporter";
PostmanEnvironmentImporter.title = "Postman Environment Importer";

registerImporter PostmanEnvironmentImporter
