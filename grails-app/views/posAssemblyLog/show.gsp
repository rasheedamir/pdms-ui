
<%@ page import="com.mm.pdms.PosAssemblyLog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-posAssemblyLog" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posAssemblyLog.assemblyName.label" default="Assembly Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posAssemblyLogInstance, field: "assemblyName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posAssemblyLog.assemblyVersion.label" default="Assembly Version" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: posAssemblyLogInstance, field: "assemblyVersion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posAssemblyLog.posCallLog.label" default="Pos Call Log" /></td>
				
				<td valign="top" class="value"><g:link controller="posCallLog" action="show" id="${posAssemblyLogInstance?.posCallLog?.id}">${posAssemblyLogInstance?.posCallLog?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posAssemblyLog.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${posAssemblyLogInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
