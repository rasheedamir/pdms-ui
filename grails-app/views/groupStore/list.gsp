
<%@ page import="com.mm.pdms.GroupStore" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'groupStore.label', default: 'GroupStore')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-groupStore" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'groupStore.id.label', default: 'Id')}" />

				<g:sortableColumn property="kfStoreId" title="${message(code: 'groupStore.kfStoreId.label', default: 'Kf Store Id')}" />
			
				<th><g:message code="groupStore.kfGroup.label" default="Kf Group" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'groupStore.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${groupStoreInstanceList}" status="i" var="groupStoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${groupStoreInstance.id}">${fieldValue(bean: groupStoreInstance, field: "id")}</g:link></td>

				<td>${fieldValue(bean: groupStoreInstance, field: "kfStoreId")}</td>
			
				<td>${fieldValue(bean: groupStoreInstance, field: "kfGroup")}</td>
			
				<td><g:formatDate date="${groupStoreInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${groupStoreInstanceTotal}" />
	</div>
</section>

</body>

</html>
