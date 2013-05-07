
<%@ page import="com.mm.pdms.PosCallLog" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posCallLog.label', default: 'PosCallLog')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-posCallLog" class="first">

	<table class="table table-bordered">
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
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
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
		<bs:paginate total="${posCallLogInstanceTotal}" />
	</div>
</section>

</body>

</html>
