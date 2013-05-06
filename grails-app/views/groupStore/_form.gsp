<%@ page import="com.mm.pdms.GroupStore" %>



<div class="fieldcontain ${hasErrors(bean: groupStoreInstance, field: 'kfStoreId', 'error')} required">
	<label for="kfStoreId">
		<g:message code="groupStore.kfStoreId.label" default="Kf Store Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="kfStoreId" type="number" value="${groupStoreInstance.kfStoreId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupStoreInstance, field: 'kfGroup', 'error')} required">
	<label for="kfGroup">
		<g:message code="groupStore.kfGroup.label" default="Kf Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="kfGroup" name="kfGroup.id" from="${com.mm.pdms.KfGroup.list()}" optionKey="id" required="" value="${groupStoreInstance?.kfGroup?.id}" class="many-to-one"/>
</div>

