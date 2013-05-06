<%@ page import="com.mm.pdms.PackageGroup" %>



<div class="fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'packageVersion', 'error')} required">
	<label for="packageVersion">
		<g:message code="packageGroup.packageVersion.label" default="Package Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="packageVersion" name="packageVersion.id" from="${com.mm.pdms.PackageVersion.list()}" optionKey="id" required="" value="${packageGroupInstance?.packageVersion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'kfGroup', 'error')} required">
	<label for="kfGroup">
		<g:message code="packageGroup.kfGroup.label" default="Kf Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="kfGroup" name="kfGroup.id" from="${com.mm.pdms.KfGroup.list()}" optionKey="id" required="" value="${packageGroupInstance?.kfGroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageGroupInstance, field: 'dateActivation', 'error')} required">
	<label for="dateActivation">
		<g:message code="packageGroup.dateActivation.label" default="Date Activation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateActivation" precision="day"  value="${packageGroupInstance?.dateActivation}"  />
</div>

