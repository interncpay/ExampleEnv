<cfheader name="Access-Control-Allow-Origin" value="*">
<cfheader name="Access-Control-Allow-Methods" value="GET, POST, OPTIONS">
<cfheader name="Access-Control-Allow-Headers" value="Content-Type">

<cfsetting enablecfoutputonly="true">
<cfheader name="Content-Type" value="application/json">

<cfparam name="form.action" default="">
<cfparam name="form.name" default="">
<cfparam name="form.id" default="">

<cfoutput>
<cfif form.action EQ "add">
    <!--- Add a new name --->
    <cfif form.name neq "">
        <cfquery datasource="Project">
            INSERT INTO Names (Name)
            VALUES (<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">);
        </cfquery>
        {"status": "success", "message": "Name added successfully"}
    <cfelse>
        {"status": "error", "message": "Name is required"}
    </cfif>
<cfelseif form.action EQ "get">
    <!--- Get the list of names --->
    <cfquery name="getNames" datasource="Project">
        SELECT ID, Name FROM Names;
    </cfquery>
    {
        "status": "success",
        "names": [
        <cfloop query="getNames">
            {"id": "#getNames.ID#", "name": "#getNames.Name#"}#chr(13)##chr(10)#
            <cfif getNames.currentRow LT getNames.recordCount>,</cfif>
        </cfloop>
        ]
    }
<cfelseif form.action EQ "delete">
    <!--- Delete a name by ID --->
    <cfif form.id neq "">
        <cfquery datasource="Project">
            DELETE FROM Names WHERE ID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">;
        </cfquery>
        {"status": "success", "message": "Name deleted successfully"}
    <cfelse>
        {"status": "error", "message": "ID is required"}
    </cfif>
<cfelse>
    {"status": "error", "message": "Invalid action"}
</cfif>
</cfoutput>
