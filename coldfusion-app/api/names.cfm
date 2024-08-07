<cfif structKeyExists(url, "action")>
    <cfset action = url.action>
<cfelseif structKeyExists(form, "action")>
    <cfset action = form.action>
<cfelse>
    <cfset action = "">
</cfif>

<cfif action EQ "get">
    <cfquery name="getNames" datasource="Project">
        SELECT ID, Name FROM Names;
    </cfquery>
    <cfoutput>
    {
        "status": "success",
        "names": [
        <cfloop query="getNames">
            {"id": #ID#, "name": "#Name#"}#chr(13)##chr(10)#
            <cfif currentRow LT getNames.recordCount>,</cfif>
        </cfloop>
        ]
    }
    </cfoutput>
<cfelseif action EQ "add">
    <cfif structKeyExists(form, "name")>
        <cfquery datasource="Project">
            INSERT INTO Names (Name) VALUES (<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">);
        </cfquery>
        <cfoutput>
        {
            "status": "success",
            "message": "Name added successfully."
        }
        </cfoutput>
    <cfelse>
        <cfoutput>
        {
            "status": "error",
            "message": "Name is required."
        }
        </cfoutput>
    </cfif>
<cfelseif action EQ "delete">
    <cfif structKeyExists(form, "id")>
        <cfquery datasource="Project">
            DELETE FROM Names WHERE ID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">;
        </cfquery>
        <cfoutput>
        {
            "status": "success",
            "message": "Name deleted successfully."
        }
        </cfoutput>
    <cfelse>
        <cfoutput>
        {
            "status": "error",
            "message": "ID is required."
        }
        </cfoutput>
    </cfif>
<cfelse>
    <cfoutput>
    {
        "status": "error",
        "message": "Invalid action."
    }
    </cfoutput>
</cfif>
