
<%@ page import="com.mm.pdms.PosCallLog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posCallLog.label', default: 'PosCallLog')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-posCallLog" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.kfStoreId.label" default="Kf Store Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "kfStoreId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.packageVersion.label" default="Package Version" /></td>
				
				<td valign="top" class="value"><g:link controller="packageVersion" action="show" id="${posCallLogInstance?.packageVersion?.id}">${posCallLogInstance?.packageVersion?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.terminalSerialNumber.label" default="Terminal Serial Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "terminalSerialNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.posNumber.label" default="Pos Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "posNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.posManufacturerName.label" default="Pos Manufacturer Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "posManufacturerName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.posVersion.label" default="Pos Version" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "posVersion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.ipAddress.label" default="Ip Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "ipAddress")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.hostName.label" default="Host Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posCallLogInstance, field: "hostName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${posCallLogInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posCallLog.posAssemblyLogs.label" default="Pos Assembly Logs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${posCallLogInstance.posAssemblyLogs}" var="p">
						<li><g:link controller="posAssemblyLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
