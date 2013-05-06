
<%@ page import="com.mm.pdms.PosAssemblyLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-posAssemblyLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-posAssemblyLog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list posAssemblyLog">
			
				<g:if test="${posAssemblyLogInstance?.assemblyName}">
				<li class="fieldcontain">
					<span id="assemblyName-label" class="property-label"><g:message code="posAssemblyLog.assemblyName.label" default="Assembly Name" /></span>
					
						<span class="property-value" aria-labelledby="assemblyName-label"><g:fieldValue bean="${posAssemblyLogInstance}" field="assemblyName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posAssemblyLogInstance?.assemblyVersion}">
				<li class="fieldcontain">
					<span id="assemblyVersion-label" class="property-label"><g:message code="posAssemblyLog.assemblyVersion.label" default="Assembly Version" /></span>
					
						<span class="property-value" aria-labelledby="assemblyVersion-label"><g:fieldValue bean="${posAssemblyLogInstance}" field="assemblyVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posAssemblyLogInstance?.posCallLog}">
				<li class="fieldcontain">
					<span id="posCallLog-label" class="property-label"><g:message code="posAssemblyLog.posCallLog.label" default="Pos Call Log" /></span>
					
						<span class="property-value" aria-labelledby="posCallLog-label"><g:link controller="posCallLog" action="show" id="${posAssemblyLogInstance?.posCallLog?.id}">${posAssemblyLogInstance?.posCallLog?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${posAssemblyLogInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="posAssemblyLog.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${posAssemblyLogInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${posAssemblyLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${posAssemblyLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
