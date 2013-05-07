
<%@ page import="com.mm.pdms.PackageGroup" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'packageGroup.label', default: 'PackageGroup')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-packageGroup" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="packageGroup.packageVersion.label" default="Package Version" /></th>
			
				<th><g:message code="packageGroup.kfGroup.label" default="Kf Group" /></th>
			
				<g:sortableColumn property="dateActivation" title="${message(code: 'packageGroup.dateActivation.label', default: 'Date Activation')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'packageGroup.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${packageGroupInstanceList}" status="i" var="packageGroupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${packageGroupInstance.id}">${fieldValue(bean: packageGroupInstance, field: "packageVersion")}</g:link></td>
			
				<td>${fieldValue(bean: packageGroupInstance, field: "kfGroup")}</td>
			
				<td><g:formatDate date="${packageGroupInstance.dateActivation}" /></td>
			
				<td><g:formatDate date="${packageGroupInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${packageGroupInstanceTotal}" />
	</div>
</section>

</body>

</html>
