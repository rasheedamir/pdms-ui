<%@ page import="com.mm.pdms.GroupStore" %>



			<div class="control-group fieldcontain ${hasErrors(bean: groupStoreInstance, field: 'kfStoreId', 'error')} required">
				<label for="kfStoreId" class="control-label"><g:message code="groupStore.kfStoreId.label" default="Kf Store Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="kfStoreId" required="" value="${groupStoreInstance.kfStoreId}"/>
					<span class="help-inline">${hasErrors(bean: groupStoreInstance, field: 'kfStoreId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: groupStoreInstance, field: 'kfGroup', 'error')} required">
				<label for="kfGroup" class="control-label"><g:message code="groupStore.kfGroup.label" default="Kf Group" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="kfGroup" name="kfGroup.id" from="${com.mm.pdms.KfGroup.list()}" optionKey="id" required="" value="${groupStoreInstance?.kfGroup?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: groupStoreInstance, field: 'kfGroup', 'error')}</span>
				</div>
			</div>

