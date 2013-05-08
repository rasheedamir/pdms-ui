<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
	
<%--		<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each> --%>

		<li class="controller${params.controller == 'home' ? " active" : ""}">
			<g:link controller="home" action="index">
				<g:message code="default.home.label" default="default.home.label"/>
			</g:link>
		</li>

		<sec:ifNotLoggedIn>
			<li class="controller${params.controller == 'login' ? " active" : ""}">
				<g:link controller="login" action="index">
					<g:message code="login.label" default="login.label"/>
				</g:link>
			</li>
		</sec:ifNotLoggedIn>

		<sec:ifLoggedIn>
			<li class="controller${params.controller == 'packageVersion' ? " active" : ""}">
				<g:link controller="packageVersion" action="index">
					<g:message code="packageVersion.label" default="packageVersion.label"/>
				</g:link>
			</li>
					
			<li class="controller${params.controller == 'kfGroup' ? " active" : ""}">
				<g:link controller="kfGroup" action="index">
					<g:message code="kfGroup.label" default="kfGroup.label"/>
				</g:link>
			</li>
			
			<li class="controller${params.controller == 'groupStore' ? " active" : ""}">
				<g:link controller="groupStore" action="index">
					<g:message code="groupStore.label" default="groupStore.label"/>
				</g:link>
			</li>		
	
			<li class="controller${params.controller == 'packageGroup' ? " active" : ""}">
				<g:link controller="packageGroup" action="index">
					<g:message code="packageGroup.label" default="packageGroup.label"/>
				</g:link>
			</li>
				
			<li class="controller${params.controller == 'posCallLog' ? " active" : ""}">
				<g:link controller="posCallLog" action="index">
					<g:message code="posCallLog.label" default="posCallLog.label"/>
				</g:link>
			</li>			
	
			<li class="controller${params.controller == 'posAssemblyLog' ? " active" : ""}">
				<g:link controller="posAssemblyLog" action="index">
					<g:message code="posAssemblyLog.label" default="posAssemblyLog.label"/>
				</g:link>
			</li>
			
			<li class="controller${params.controller == 'logout' ? " active" : ""}">
				<g:link controller="logout" action="index">
					<g:message code="logout.label" default="logout.label"/>
				</g:link>
			</li>			
		</sec:ifLoggedIn>	
									
	</ul>
</div>
