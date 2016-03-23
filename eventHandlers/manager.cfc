<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad">
		<cfargument name="$" />
		
		<cfset var hotjarIDs = structNew() />
		
		<!--- get all settings --->
		<cfset hotjarIDs[ "singleDomain" ] = pluginConfig.getSetting( "hotjarIDs" ) />
		
		<!--- store them into the plugins application scope --->
		<cfset pluginConfig.getApplication().setValue( "hotjarIDs", hotjarIDs ) />
		<cfset variables.pluginConfig.addEventHandler(this)>

	</cffunction>

	<cffunction name="onRenderEnd">
		<cfargument name="$" />
		
		<cfset var regexFindArray = "" />
		<cfset var newContent = "" />
		<cfset var hotjarJS = "" />
		<cfset var hotjarKey = "" />
		<cfset var hotjarKeyType = "" />
		<cfset var hotjarKeyCollection = "" />
		<cfset var hotjarKeyCollections = pluginConfig.getApplication().getValue( "hotjarIDs" ) />

		<!--- loop over the key collection to find the one for this site --->
		<cfloop collection="#hotjarKeyCollections#" item="hotjarKeyCollection">
			
			<!--- get regex array results --->
			<cfset regexFindArray = ReFindNoCase( "(?m)^#trim( $.event( "siteId" ) )#=([\w\W]+?)$", hotjarKeyCollections[ hotjarKeyCollection ], 1, true ) />
			<!--- if the pos array is gte than 2 then continue  --->
			<cfif arrayLen( regexFindArray.pos ) GTE 2>
				<!--- get type --->
				<cfset hotjarKeyType = hotjarKeyCollection />
				<!--- get key from collection --->
				<cfset hotjarKey = mid( hotjarKeyCollections[ hotjarKeyCollection ], regexFindArray.pos[2], regexFindArray.len[2] ) />
				<cfbreak />
			</cfif>
		</cfloop>
		
		<!--- if a key was found  --->
		<cfif len( hotjarKey ) >
			
			<!--- create hotjar script --->
			<cfsavecontent variable="hotjarJS">
				<cfoutput>
<script type="text/javascript">
	(function(h,o,t,j,a,r){
		h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
		h._hjSettings={hjid:#trim( listFirst( hotjarKey ) )#,hjsv:5};
		a=o.getElementsByTagName('head')[0];
		r=o.createElement('script');r.async=1;
		r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
		a.appendChild(r);
	})(window,document,'//static.hotjar.com/c/hotjar-','.js?sv=');
</script>
				</cfoutput>
			</cfsavecontent>
			
			<!--- append script to body --->
			<cfset newContent = replaceNoCase( $.event( "__MuraResponse__" ), "</head>", trim(hotjarJS) & "</head>" ) />
			
			<!--- reset the muraresponse with the script --->
			<cfset $.event( "__MuraResponse__", newContent ) />
		</cfif>
	</cffunction>

</cfcomponent>