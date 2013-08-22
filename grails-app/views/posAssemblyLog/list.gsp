
<%@ page import="com.mm.pdms.PosAssemblyLog" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-posAssemblyLog" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'posAssemblyLog.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="assemblyName" title="${message(code: 'posAssemblyLog.assemblyName.label', default: 'Assembly Name')}" />
			
				<g:sortableColumn property="assemblyVersion" title="${message(code: 'posAssemblyLog.assemblyVersion.label', default: 'Assembly Version')}" />
			
				<th><g:message code="posAssemblyLog.posCallLog.label" default="Pos Call Log" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'posAssemblyLog.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${posAssemblyLogInstanceList}" status="i" var="posAssemblyLogInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: posAssemblyLogInstance, field: "id")}</td>

				<td><g:link action="show" id="${posAssemblyLogInstance.id}">${fieldValue(bean: posAssemblyLogInstance, field: "assemblyName")}</g:link></td>
			
				<td>${fieldValue(bean: posAssemblyLogInstance, field: "assemblyVersion")}</td>
			
				<td>${fieldValue(bean: posAssemblyLogInstance, field: "posCallLog")}</td>
			
				<td><g:formatDate date="${posAssemblyLogInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${posAssemblyLogInstanceTotal}" />
	</div>
</section>

</body>

</html>
