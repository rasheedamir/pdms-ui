
<%@ page import="com.mm.pdms.PackageVersion" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'packageVersion.label', default: 'PackageVersion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-packageVersion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.versionNumber.label" default="Version Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: packageVersionInstance, field: "versionNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.packagePath.label" default="Package Path" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: packageVersionInstance, field: "packagePath")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.comment.label" default="Comment" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: packageVersionInstance, field: "comment")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${packageVersionInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.packageGroups.label" default="Package Groups" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${packageVersionInstance.packageGroups}" var="p">
						<li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageVersion.posCallLogs.label" default="Pos Call Logs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${packageVersionInstance.posCallLogs}" var="p">
						<li><g:link controller="posCallLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
