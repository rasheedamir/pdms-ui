
<%@ page import="com.mm.pdms.PackageVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'packageVersion.label', default: 'PackageVersion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-packageVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-packageVersion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list packageVersion">
			
				<g:if test="${packageVersionInstance?.versionNumber}">
				<li class="fieldcontain">
					<span id="versionNumber-label" class="property-label"><g:message code="packageVersion.versionNumber.label" default="Version Number" /></span>
					
						<span class="property-value" aria-labelledby="versionNumber-label"><g:fieldValue bean="${packageVersionInstance}" field="versionNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageVersionInstance?.packagePath}">
				<li class="fieldcontain">
					<span id="packagePath-label" class="property-label"><g:message code="packageVersion.packagePath.label" default="Package Path" /></span>
					
						<span class="property-value" aria-labelledby="packagePath-label"><g:fieldValue bean="${packageVersionInstance}" field="packagePath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageVersionInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="packageVersion.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${packageVersionInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageVersionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="packageVersion.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${packageVersionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageVersionInstance?.packageGroups}">
				<li class="fieldcontain">
					<span id="packageGroups-label" class="property-label"><g:message code="packageVersion.packageGroups.label" default="Package Groups" /></span>
					
						<g:each in="${packageVersionInstance.packageGroups}" var="p">
						<span class="property-value" aria-labelledby="packageGroups-label"><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageVersionInstance?.posCallLogs}">
				<li class="fieldcontain">
					<span id="posCallLogs-label" class="property-label"><g:message code="packageVersion.posCallLogs.label" default="Pos Call Logs" /></span>
					
						<g:each in="${packageVersionInstance.posCallLogs}" var="p">
						<span class="property-value" aria-labelledby="posCallLogs-label"><g:link controller="posCallLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${packageVersionInstance?.id}" />
					<g:link class="edit" action="edit" id="${packageVersionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
