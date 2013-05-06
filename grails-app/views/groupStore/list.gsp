
<%@ page import="com.mm.pdms.GroupStore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupStore.label', default: 'GroupStore')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-groupStore" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-groupStore" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="kfStoreId" title="${message(code: 'groupStore.kfStoreId.label', default: 'Kf Store Id')}" />
					
						<th><g:message code="groupStore.kfGroup.label" default="Kf Group" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'groupStore.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupStoreInstanceList}" status="i" var="groupStoreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupStoreInstance.id}">${fieldValue(bean: groupStoreInstance, field: "kfStoreId")}</g:link></td>
					
						<td>${fieldValue(bean: groupStoreInstance, field: "kfGroup")}</td>
					
						<td><g:formatDate date="${groupStoreInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupStoreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
