
<%@ page import="com.mm.pdms.KfGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kfGroup.label', default: 'KfGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-kfGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-kfGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list kfGroup">
			
				<g:if test="${kfGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="kfGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${kfGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kfGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="kfGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${kfGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${kfGroupInstance?.groupStores}">
				<li class="fieldcontain">
					<span id="groupStores-label" class="property-label"><g:message code="kfGroup.groupStores.label" default="Group Stores" /></span>
					
						<g:each in="${kfGroupInstance.groupStores}" var="g">
						<span class="property-value" aria-labelledby="groupStores-label"><g:link controller="groupStore" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${kfGroupInstance?.packageGroups}">
				<li class="fieldcontain">
					<span id="packageGroups-label" class="property-label"><g:message code="kfGroup.packageGroups.label" default="Package Groups" /></span>
					
						<g:each in="${kfGroupInstance.packageGroups}" var="p">
						<span class="property-value" aria-labelledby="packageGroups-label"><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${kfGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${kfGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
