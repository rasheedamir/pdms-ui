
<%@ page import="com.mm.pdms.PosCallLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'posCallLog.label', default: 'PosCallLog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-posCallLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-posCallLog" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="kfStoreId" title="${message(code: 'posCallLog.kfStoreId.label', default: 'Kf Store Id')}" />
					
						<th><g:message code="posCallLog.packageVersion.label" default="Package Version" /></th>
					
						<g:sortableColumn property="terminalSerialNumber" title="${message(code: 'posCallLog.terminalSerialNumber.label', default: 'Terminal Serial Number')}" />
					
						<g:sortableColumn property="posNumber" title="${message(code: 'posCallLog.posNumber.label', default: 'Pos Number')}" />
					
						<g:sortableColumn property="posManufacturerName" title="${message(code: 'posCallLog.posManufacturerName.label', default: 'Pos Manufacturer Name')}" />
					
						<g:sortableColumn property="posVersion" title="${message(code: 'posCallLog.posVersion.label', default: 'Pos Version')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${posCallLogInstanceList}" status="i" var="posCallLogInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${posCallLogInstance.id}">${fieldValue(bean: posCallLogInstance, field: "kfStoreId")}</g:link></td>
					
						<td>${fieldValue(bean: posCallLogInstance, field: "packageVersion")}</td>
					
						<td>${fieldValue(bean: posCallLogInstance, field: "terminalSerialNumber")}</td>
					
						<td>${fieldValue(bean: posCallLogInstance, field: "posNumber")}</td>
					
						<td>${fieldValue(bean: posCallLogInstance, field: "posManufacturerName")}</td>
					
						<td>${fieldValue(bean: posCallLogInstance, field: "posVersion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${posCallLogInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
