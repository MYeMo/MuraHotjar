<plugin>
	<name>Mura Hotjar</name>
	<package>MuraHotjar</package>
	<directoryFormat>packageOnly</directoryFormat>
	<version>1.0</version>
	<provider>eMotions media solutions</provider>
	<providerURL>http://www.emotions.ch</providerURL>
	<category>Application</category>
	<settings>
		<setting>
			<name>hotjarIDs</name>
			<label>Hotjar IDs</label>
			<hint>FORMAT: SiteId={Hotjar ID} separated by a new line</hint>
			<type>textarea</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
	</settings>

	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="eventHandlers.manager" persist="false" /> 
	</eventHandlers>

	<displayobjects location="global"/>
</plugin>
