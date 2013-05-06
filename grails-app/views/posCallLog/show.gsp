
<%@ page import="com.mm.pdms.PosCallLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'posCallLog.label', default: 'PosCallLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-posCallLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-posCallLog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list posCallLog">
			
				<g:if test="${posCallLogInstance?.kfStoreId}">
				<li class="fieldcontain">
					<span id="kfStoreId-label" class="property-label"><g:message code="posCallLog.kfStoreId.label" default="Kf Store Id" /></span>
					
						<span class="property-value" aria-labelledby="kfStoreId-label"><g:fieldValue bean="${posCallLogInstance}" field="kfStoreId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.packageVersion}">
				<li class="fieldcontain">
					<span id="packageVersion-label" class="property-label"><g:message code="posCallLog.packageVersion.label" default="Package Version" /></span>
					
						<span class="property-value" aria-labelledby="packageVersion-label"><g:link controller="packageVersion" action="show" id="${posCallLogInstance?.packageVersion?.id}">${posCallLogInstance?.packageVersion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.terminalSerialNumber}">
				<li class="fieldcontain">
					<span id="terminalSerialNumber-label" class="property-label"><g:message code="posCallLog.terminalSerialNumber.label" default="Terminal Serial Number" /></span>
					
						<span class="property-value" aria-labelledby="terminalSerialNumber-label"><g:fieldValue bean="${posCallLogInstance}" field="terminalSerialNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.posNumber}">
				<li class="fieldcontain">
					<span id="posNumber-label" class="property-label"><g:message code="posCallLog.posNumber.label" default="Pos Number" /></span>
					
						<span class="property-value" aria-labelledby="posNumber-label"><g:fieldValue bean="${posCallLogInstance}" field="posNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.posManufacturerName}">
				<li class="fieldcontain">
					<span id="posManufacturerName-label" class="property-label"><g:message code="posCallLog.posManufacturerName.label" default="Pos Manufacturer Name" /></span>
					
						<span class="property-value" aria-labelledby="posManufacturerName-label"><g:fieldValue bean="${posCallLogInstance}" field="posManufacturerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.posVersion}">
				<li class="fieldcontain">
					<span id="posVersion-label" class="property-label"><g:message code="posCallLog.posVersion.label" default="Pos Version" /></span>
					
						<span class="property-value" aria-labelledby="posVersion-label"><g:fieldValue bean="${posCallLogInstance}" field="posVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.ipAddress}">
				<li class="fieldcontain">
					<span id="ipAddress-label" class="property-label"><g:message code="posCallLog.ipAddress.label" default="Ip Address" /></span>
					
						<span class="property-value" aria-labelledby="ipAddress-label"><g:fieldValue bean="${posCallLogInstance}" field="ipAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.hostName}">
				<li class="fieldcontain">
					<span id="hostName-label" class="property-label"><g:message code="posCallLog.hostName.label" default="Host Name" /></span>
					
						<span class="property-value" aria-labelledby="hostName-label"><g:fieldValue bean="${posCallLogInstance}" field="hostName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="posCallLog.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${posCallLogInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${posCallLogInstance?.posAssemblyLogs}">
				<li class="fieldcontain">
					<span id="posAssemblyLogs-label" class="property-label"><g:message code="posCallLog.posAssemblyLogs.label" default="Pos Assembly Logs" /></span>
					
						<g:each in="${posCallLogInstance.posAssemblyLogs}" var="p">
						<span class="property-value" aria-labelledby="posAssemblyLogs-label"><g:link controller="posAssemblyLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${posCallLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${posCallLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
