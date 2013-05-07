
<%@ page import="com.mm.pdms.KfGroup" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'kfGroup.label', default: 'KfGroup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-kfGroup" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="kfGroup.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: kfGroupInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="kfGroup.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${kfGroupInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="kfGroup.groupStores.label" default="Group Stores" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${kfGroupInstance.groupStores}" var="g">
						<li><g:link controller="groupStore" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="kfGroup.packageGroups.label" default="Package Groups" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${kfGroupInstance.packageGroups}" var="p">
						<li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
