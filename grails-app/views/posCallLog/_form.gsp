<%@ page import="com.mm.pdms.PosCallLog" %>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'kfStoreId', 'error')} required">
				<label for="kfStoreId" class="control-label"><g:message code="posCallLog.kfStoreId.label" default="Kf Store Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="kfStoreId" required="" value="${posCallLogInstance.kfStoreId}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'kfStoreId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'packageVersion', 'error')} required">
				<label for="packageVersion" class="control-label"><g:message code="posCallLog.packageVersion.label" default="Package Version" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="packageVersion" name="packageVersion.id" from="${com.mm.pdms.PackageVersion.list()}" optionKey="id" required="" value="${posCallLogInstance?.packageVersion?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'packageVersion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'terminalSerialNumber', 'error')} ">
				<label for="terminalSerialNumber" class="control-label"><g:message code="posCallLog.terminalSerialNumber.label" default="Terminal Serial Number" /></label>
				<div class="controls">
					<g:textField name="terminalSerialNumber" value="${posCallLogInstance?.terminalSerialNumber}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'terminalSerialNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posNumber', 'error')} ">
				<label for="posNumber" class="control-label"><g:message code="posCallLog.posNumber.label" default="Pos Number" /></label>
				<div class="controls">
					<g:textField name="posNumber" value="${posCallLogInstance?.posNumber}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'posNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posManufacturerName', 'error')} ">
				<label for="posManufacturerName" class="control-label"><g:message code="posCallLog.posManufacturerName.label" default="Pos Manufacturer Name" /></label>
				<div class="controls">
					<g:textField name="posManufacturerName" value="${posCallLogInstance?.posManufacturerName}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'posManufacturerName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posVersion', 'error')} ">
				<label for="posVersion" class="control-label"><g:message code="posCallLog.posVersion.label" default="Pos Version" /></label>
				<div class="controls">
					<g:textField name="posVersion" value="${posCallLogInstance?.posVersion}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'posVersion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'ipAddress', 'error')} ">
				<label for="ipAddress" class="control-label"><g:message code="posCallLog.ipAddress.label" default="Ip Address" /></label>
				<div class="controls">
					<g:textField name="ipAddress" value="${posCallLogInstance?.ipAddress}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'ipAddress', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'hostName', 'error')} ">
				<label for="hostName" class="control-label"><g:message code="posCallLog.hostName.label" default="Host Name" /></label>
				<div class="controls">
					<g:textField name="hostName" value="${posCallLogInstance?.hostName}"/>
					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'hostName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posCallLogInstance, field: 'posAssemblyLogs', 'error')} ">
				<label for="posAssemblyLogs" class="control-label"><g:message code="posCallLog.posAssemblyLogs.label" default="Pos Assembly Logs" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${posCallLogInstance?.posAssemblyLogs?}" var="p">
    <li><g:link controller="posAssemblyLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="posAssemblyLog" action="create" params="['posCallLog.id': posCallLogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: posCallLogInstance, field: 'posAssemblyLogs', 'error')}</span>
				</div>
			</div>

