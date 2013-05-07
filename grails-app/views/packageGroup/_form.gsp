<%@ page import="com.mm.pdms.PackageGroup" %>



			<div class="control-group fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'packageVersion', 'error')} required">
				<label for="packageVersion" class="control-label"><g:message code="packageGroup.packageVersion.label" default="Package Version" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="packageVersion" name="packageVersion.id" from="${com.mm.pdms.PackageVersion.list()}" optionKey="id" required="" value="${packageGroupInstance?.packageVersion?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: packageGroupInstance, field: 'packageVersion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'kfGroup', 'error')} required">
				<label for="kfGroup" class="control-label"><g:message code="packageGroup.kfGroup.label" default="Kf Group" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="kfGroup" name="kfGroup.id" from="${com.mm.pdms.KfGroup.list()}" optionKey="id" required="" value="${packageGroupInstance?.kfGroup?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: packageGroupInstance, field: 'kfGroup', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'dateActivation', 'error')} required">
				<label for="dateActivation" class="control-label"><g:message code="packageGroup.dateActivation.label" default="Date Activation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dateActivation" precision="day"  value="${packageGroupInstance?.dateActivation}"  />
					<span class="help-inline">${hasErrors(bean: packageGroupInstance, field: 'dateActivation', 'error')}</span>
				</div>
			</div>

