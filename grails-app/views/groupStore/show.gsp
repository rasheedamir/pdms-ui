
<%@ page import="com.mm.pdms.GroupStore" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'groupStore.label', default: 'GroupStore')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-groupStore" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="groupStore.kfStoreId.label" default="Kf Store Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: groupStoreInstance, field: "kfStoreId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="groupStore.kfGroup.label" default="Kf Group" /></td>
				
				<td valign="top" class="value"><g:link controller="kfGroup" action="show" id="${groupStoreInstance?.kfGroup?.id}">${groupStoreInstance?.kfGroup?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="groupStore.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${groupStoreInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
