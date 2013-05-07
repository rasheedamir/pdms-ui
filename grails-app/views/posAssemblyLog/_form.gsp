<%@ page import="com.mm.pdms.PosAssemblyLog" %>



			<div class="control-group fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyName', 'error')} required">
				<label for="assemblyName" class="control-label"><g:message code="posAssemblyLog.assemblyName.label" default="Assembly Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="assemblyName" required="" value="${posAssemblyLogInstance?.assemblyName}"/>
					<span class="help-inline">${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyVersion', 'error')} required">
				<label for="assemblyVersion" class="control-label"><g:message code="posAssemblyLog.assemblyVersion.label" default="Assembly Version" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="assemblyVersion" required="" value="${posAssemblyLogInstance?.assemblyVersion}"/>
					<span class="help-inline">${hasErrors(bean: posAssemblyLogInstance, field: 'assemblyVersion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: posAssemblyLogInstance, field: 'posCallLog', 'error')} required">
				<label for="posCallLog" class="control-label"><g:message code="posAssemblyLog.posCallLog.label" default="Pos Call Log" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="posCallLog" name="posCallLog.id" from="${com.mm.pdms.PosCallLog.list()}" optionKey="id" required="" value="${posAssemblyLogInstance?.posCallLog?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: posAssemblyLogInstance, field: 'posCallLog', 'error')}</span>
				</div>
			</div>

