
<%@ page import="com.mm.pdms.PackageVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'packageVersion.label', default: 'PackageVersion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-packageVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-packageVersion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="versionNumber" title="${message(code: 'packageVersion.versionNumber.label', default: 'Version Number')}" />
					
						<g:sortableColumn property="packagePath" title="${message(code: 'packageVersion.packagePath.label', default: 'Package Path')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'packageVersion.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'packageVersion.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${packageVersionInstanceList}" status="i" var="packageVersionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${packageVersionInstance.id}">${fieldValue(bean: packageVersionInstance, field: "versionNumber")}</g:link></td>
					
						<td>${fieldValue(bean: packageVersionInstance, field: "packagePath")}</td>
					
						<td>${fieldValue(bean: packageVersionInstance, field: "comment")}</td>
					
						<td><g:formatDate date="${packageVersionInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${packageVersionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
