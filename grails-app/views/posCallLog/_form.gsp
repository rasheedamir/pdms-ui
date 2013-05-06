<%@ page import="com.mm.pdms.PosCallLog" %>



<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'kfStoreId', 'error')} required">
	<label for="kfStoreId">
		<g:message code="posCallLog.kfStoreId.label" default="Kf Store Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="kfStoreId" type="number" value="${posCallLogInstance.kfStoreId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'packageVersion', 'error')} required">
	<label for="packageVersion">
		<g:message code="posCallLog.packageVersion.label" default="Package Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="packageVersion" name="packageVersion.id" from="${com.mm.pdms.PackageVersion.list()}" optionKey="id" required="" value="${posCallLogInstance?.packageVersion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'terminalSerialNumber', 'error')} ">
	<label for="terminalSerialNumber">
		<g:message code="posCallLog.terminalSerialNumber.label" default="Terminal Serial Number" />
		
	</label>
	<g:textField name="terminalSerialNumber" value="${posCallLogInstance?.terminalSerialNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posNumber', 'error')} ">
	<label for="posNumber">
		<g:message code="posCallLog.posNumber.label" default="Pos Number" />
		
	</label>
	<g:textField name="posNumber" value="${posCallLogInstance?.posNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posManufacturerName', 'error')} ">
	<label for="posManufacturerName">
		<g:message code="posCallLog.posManufacturerName.label" default="Pos Manufacturer Name" />
		
	</label>
	<g:textField name="posManufacturerName" value="${posCallLogInstance?.posManufacturerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posVersion', 'error')} ">
	<label for="posVersion">
		<g:message code="posCallLog.posVersion.label" default="Pos Version" />
		
	</label>
	<g:textField name="posVersion" value="${posCallLogInstance?.posVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'ipAddress', 'error')} ">
	<label for="ipAddress">
		<g:message code="posCallLog.ipAddress.label" default="Ip Address" />
		
	</label>
	<g:textField name="ipAddress" value="${posCallLogInstance?.ipAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'hostName', 'error')} ">
	<label for="hostName">
		<g:message code="posCallLog.hostName.label" default="Host Name" />
		
	</label>
	<g:textField name="hostName" value="${posCallLogInstance?.hostName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posAssemblyLogs', 'error')} ">
	<label for="posAssemblyLogs">
		<g:message code="posCallLog.posAssemblyLogs.label" default="Pos Assembly Logs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${posCallLogInstance?.posAssemblyLogs?}" var="p">
    <li><g:link controller="posAssemblyLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="posAssemblyLog" action="create" params="['posCallLog.id': posCallLogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')])}</g:link>
</li>
</ul>

</div>

