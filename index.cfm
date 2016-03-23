<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
	<cfoutput>
		<h2>MuraHotjar</h2>
		<p>MuraHotjar is a Mura CMS Plugin to quickly integrate Hotjar into your Mura Websites.</p>
		<p>You must have the following information at hand:</p>
		<ul style="margin-top:0">
			<li>Your HotjarID provided by Hotjar</li>
			<li>Your Mura CMS SiteID</li>
		</ul>

		<hr>

		<h3>Installation</h3>
		<p>While installing the plugin, you're asked for your Hotjar IDs. One per SiteID, separated by line:</p>
		<pre>{SiteID}={HotjarID}</pre>
		<p>Example</p>
		<pre>SiteA=123123#chr(13)#SiteB=456456</pre>
		
		<hr>

		<h3>Usage</h3>
		<p>That's all. The Plugin does the rest for you.</p>

		<hr>

		<h3>Further Informations</h3>
		<p>This Plugin is based on Steve Withington's MuraGoogleAnalytics Plugin. Check it out, if you're using Google Analytics too: <a href="https://github.com/blueriver/MuraGoogleAnalytics">https://github.com/stevewithington/MuraGoogleAnalytics</a></p>
	</cfoutput>
</cfsavecontent>
<cfoutput>
	#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>

