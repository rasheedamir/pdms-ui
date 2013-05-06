
<%@ page import="com.mm.pdms.GroupStore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupStore.label', default: 'GroupStore')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-groupStore" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-groupStore" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupStore">
			
				<g:if test="${groupStoreInstance?.kfStoreId}">
				<li class="fieldcontain">
					<span id="kfStoreId-label" class="property-label"><g:message code="groupStore.kfStoreId.label" default="Kf Store Id" /></span>
					
						<span class="property-value" aria-labelledby="kfStoreId-label"><g:fieldValue bean="${groupStoreInstance}" field="kfStoreId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupStoreInstance?.kfGroup}">
				<li class="fieldcontain">
					<span id="kfGroup-label" class="property-label"><g:message code="groupStore.kfGroup.label" default="Kf Group" /></span>
					
						<span class="property-value" aria-labelledby="kfGroup-label"><g:link controller="kfGroup" action="show" id="${groupStoreInstance?.kfGroup?.id}">${groupStoreInstance?.kfGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupStoreInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="groupStore.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${groupStoreInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${groupStoreInstance?.id}" />
					<g:link class="edit" action="edit" id="${groupStoreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
