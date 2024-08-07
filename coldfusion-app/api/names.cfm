<cfprocessingdirective pageencoding="utf-8">
<cfheader name="Content-Type" value="application/json; charset=utf-8">

<cftry>
    <!--- Determine the action from URL or form parameters --->
    <cfif structKeyExists(url, "action")>
        <cfset action = url.action>
    <cfelseif structKeyExists(form, "action")>
        <cfset action = form.action>
    <cfelse>
        <cfset action = "">
    </cfif>

    <cfoutput>
    <cfif action EQ "get">
        <!--- Fetch all names from the database --->
        <cfquery name="getNames" datasource="Project">
            SELECT ID, Name FROM Names;
        </cfquery>
        <cfset response = {
            "status" = "success",
            "names" = []
        }>
        <cfloop query="getNames">
            <cfset arrayAppend(response.names, {
                "id" = getNames.ID,
                "name" = getNames.Name
            })>
        </cfloop>
        #serializeJSON(response)#

    <cfelseif action EQ "add">
        <!--- Add a new name to the database --->
        <cfif structKeyExists(form, "name")>
            <cfquery datasource="Project">
                INSERT INTO Names (Name)
                VALUES (<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">);
            </cfquery>
            <cfset response = {
                "status" = "success",
                "message" = "Name added successfully."
            }>
            #serializeJSON(response)#
        <cfelse>
            <cfset response = {
                "status" = "error",
                "message" = "Name is required."
            }>
            #serializeJSON(response)#
        </cfif>

    <cfelseif action EQ "delete">
        <!--- Delete a name from the database --->
        <cfif structKeyExists(form, "id")>
            <cfquery datasource="Project">
                DELETE FROM Names WHERE ID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">;
            </cfquery>
            <cfset response = {
                "status" = "success",
                "message" = "Name deleted successfully."
            }>
            #serializeJSON(response)#
        <cfelse>
            <cfset response = {
                "status" = "error",
                "message" = "ID is required."
            }>
            #serializeJSON(response)#
        </cfif>

    <cfelse>
        <!--- Invalid action --->
        <cfset response = {
            "status" = "error",
            "message" = "Invalid action."
        }>
        #serializeJSON(response)#
    </cfif>
    </cfoutput>

<cfcatch>
    <!--- Error handling --->
    <cfset response = {
        "status" = "error",
        "message" = cfcatch.message
    }>
    <cfoutput>#serializeJSON(response)#</cfoutput>
</cfcatch>
</cftry>
