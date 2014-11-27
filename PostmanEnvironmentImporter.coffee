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

        # Get or create the Environment Domain
        pawEnvironmentDomainName = "Imported (Postman)"
        pawEnvironmentDomain = context.getEnvironmentDomainByName pawEnvironmentDomainName
        if not pawEnvironmentDomain
            pawEnvironmentDomain = context.createEnvironmentDomain pawEnvironmentDomainName

        # Create the Environment
        pawEnvironment = pawEnvironmentDomain.createEnvironment postmanEnvironments["name"]

        variablesDict = {}
        for postmanValue in postmanEnvironments["values"]
            variablesDict[postmanValue["key"]] = postmanValue["value"]

        pawEnvironment.setVariablesValues variablesDict

        return true;

    return

PostmanEnvironmentImporter.identifier = "com.luckymarmot.PawExtensions.PostmanEnvironmentImporter";
PostmanEnvironmentImporter.title = "Postman Environment Importer";

registerImporter PostmanEnvironmentImporter
