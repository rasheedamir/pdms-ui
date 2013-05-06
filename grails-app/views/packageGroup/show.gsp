
<%@ page import="com.mm.pdms.PackageGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'packageGroup.label', default: 'PackageGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-packageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-packageGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list packageGroup">
			
				<g:if test="${packageGroupInstance?.packageVersion}">
				<li class="fieldcontain">
					<span id="packageVersion-label" class="property-label"><g:message code="packageGroup.packageVersion.label" default="Package Version" /></span>
					
						<span class="property-value" aria-labelledby="packageVersion-label"><g:link controller="packageVersion" action="show" id="${packageGroupInstance?.packageVersion?.id}">${packageGroupInstance?.packageVersion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageGroupInstance?.kfGroup}">
				<li class="fieldcontain">
					<span id="kfGroup-label" class="property-label"><g:message code="packageGroup.kfGroup.label" default="Kf Group" /></span>
					
						<span class="property-value" aria-labelledby="kfGroup-label"><g:link controller="kfGroup" action="show" id="${packageGroupInstance?.kfGroup?.id}">${packageGroupInstance?.kfGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageGroupInstance?.dateActivation}">
				<li class="fieldcontain">
					<span id="dateActivation-label" class="property-label"><g:message code="packageGroup.dateActivation.label" default="Date Activation" /></span>
					
						<span class="property-value" aria-labelledby="dateActivation-label"><g:formatDate date="${packageGroupInstance?.dateActivation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="packageGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${packageGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${packageGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${packageGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
