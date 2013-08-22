
<%@ page import="com.mm.pdms.PackageVersion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'packageVersion.label', default: 'PackageVersion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-packageVersion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>

				<g:sortableColumn property="id" title="${message(code: 'packageVersion.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="versionNumber" title="${message(code: 'packageVersion.versionNumber.label', default: 'Version Number')}" />
			
				<g:sortableColumn property="packagePath" title="${message(code: 'packageVersion.packagePath.label', default: 'Package Path')}" />
			
				<g:sortableColumn property="comment" title="${message(code: 'packageVersion.comment.label', default: 'Comment')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'packageVersion.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${packageVersionInstanceList}" status="i" var="packageVersionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${packageVersionInstance.id}">${fieldValue(bean: packageVersionInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: packageVersionInstance, field: "versionNumber")}</td>
			
				<td>${fieldValue(bean: packageVersionInstance, field: "packagePath")}</td>
			
				<td>${fieldValue(bean: packageVersionInstance, field: "comment")}</td>
			
				<td><g:formatDate date="${packageVersionInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${packageVersionInstanceTotal}" />
	</div>
</section>

</body>

</html>
