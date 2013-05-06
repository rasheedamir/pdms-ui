<%@ page import="com.mm.pdms.PosAssemblyLog" %>



<div class="fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyName', 'error')} required">
	<label for="assemblyName">
		<g:message code="posAssemblyLog.assemblyName.label" default="Assembly Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="assemblyName" required="" value="${posAssemblyLogInstance?.assemblyName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyVersion', 'error')} required">
	<label for="assemblyVersion">
		<g:message code="posAssemblyLog.assemblyVersion.label" default="Assembly Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="assemblyVersion" required="" value="${posAssemblyLogInstance?.assemblyVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'posCallLog', 'error')} required">
	<label for="posCallLog">
		<g:message code="posAssemblyLog.posCallLog.label" default="Pos Call Log" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="posCallLog" name="posCallLog.id" from="${com.mm.pdms.PosCallLog.list()}" optionKey="id" required="" value="${posAssemblyLogInstance?.posCallLog?.id}" class="many-to-one"/>
</div>

