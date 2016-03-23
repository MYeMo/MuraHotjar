<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
	<cfoutput>
		<h2>Hotjar Mura Plugin</h2>
		<p></p>
		<dl>
			<dt class="first">
				<p>This plugin is for hooking into Hotjar.</p> 

				<p>
					<i>
						"Hotjar is a new and easy way to truly understand your web and mobile site visitors. Identify your hottest opportunities for improvement using: Heatmaps, Recordings, Funnels, Forms, Polls, Surveys, Recruiters"
					</i><br />- www.hotjar.com
				</p>
			</dt>
			<dt>
				<strong>You must have the following information at hand:</strong><br />
				- Your Hotjar ID provided by Hotjar<br />
				- Your site ID<br />
				- Your domain<br />
				<br /><br />
			</dt>
			<dt>
				<h3>Here is how you use the plugin.</h3> 
				<p>There are 3 fields available. Each field dictates how the Hotjar js code renders. Each field is setup to accept multiple entries which must be new line delimited.</p>
				
				<p>As a page renders for a given site the plugin will take that site's ID and check it against the fields. The first field that has the site ID assigned to it wins.</p>
				
				<h4>Single Domain - Hotjar IDs</h4>
				<p>
					<strong>FORMAT:</strong> <i>{site ID}={Hotjar ID}</i><br />
					<strong>FINISHED FORMAT:</strong> <i>siteA=123456</i>
				</p>
				Place your site ID and Hotjar ID here if you have your Hotjar account setup for a Single Domain. 
				<p></p>

				<h4>One domain with multiple subdomain - Hotjar IDs</h4>
				<p>
					<strong>FORMAT:</strong> <i>{site ID}={Hotjar ID},{domain}</i><br />
					<strong>FINISHED FORMAT:</strong> <i>siteA=123456,.domain.com</i>
				</p>
				Place your site ID and Web Property ID here if you have your Hotjar account setup for a One domain with multiple subdomains. 
				<p></p>

				<p>
					<h4>Multiple top-level domain - Hotjar IDs</h4>
					<p>
						<strong>FORMAT:</strong> <i>{site ID}={Hotjar ID}</i><br />
						<strong>FINISHED FORMAT:</strong> <i>siteA=123456</i>
					</p>
					Place your site ID and Web Property ID here if you have your Hotjar account setup for Multiple top-level domains. 
				</p>
			</dt>
		</dl>
		<p>This Plugin is based on Steve Withington's <a href="https://github.com/blueriver/MuraGoogleAnalytics">MuraGoogleAnalytics Plugin</a>. Check it out, if you're using Google Analytics too.</p>

	</cfoutput>
</cfsavecontent>
<cfoutput>
	#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>

