
<%@ page import="com.mm.pdms.PackageGroup" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'packageGroup.label', default: 'PackageGroup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-packageGroup" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageGroup.packageVersion.label" default="Package Version" /></td>
				
				<td valign="top" class="value"><g:link controller="packageVersion" action="show" id="${packageGroupInstance?.packageVersion?.id}">${packageGroupInstance?.packageVersion?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageGroup.kfGroup.label" default="Kf Group" /></td>
				
				<td valign="top" class="value"><g:link controller="kfGroup" action="show" id="${packageGroupInstance?.kfGroup?.id}">${packageGroupInstance?.kfGroup?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageGroup.dateActivation.label" default="Date Activation" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${packageGroupInstance?.dateActivation}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="packageGroup.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${packageGroupInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
