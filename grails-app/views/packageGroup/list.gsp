
<%@ page import="com.mm.pdms.PackageGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'packageGroup.label', default: 'PackageGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-packageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-packageGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
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
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${packageGroupInstance.id}">${fieldValue(bean: packageGroupInstance, field: "packageVersion")}</g:link></td>
					
						<td>${fieldValue(bean: packageGroupInstance, field: "kfGroup")}</td>
					
						<td><g:formatDate date="${packageGroupInstance.dateActivation}" /></td>
					
						<td><g:formatDate date="${packageGroupInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${packageGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
