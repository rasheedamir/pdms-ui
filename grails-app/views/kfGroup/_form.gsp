<%@ page import="com.mm.pdms.KfGroup" %>



			<div class="control-group fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="kfGroup.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${kfGroupInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: kfGroupInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'groupStores', 'error')} ">
				<label for="groupStores" class="control-label"><g:message code="kfGroup.groupStores.label" default="Group Stores" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${kfGroupInstance?.groupStores?}" var="g">
    <li><g:link controller="groupStore" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="groupStore" action="create" params="['kfGroup.id': kfGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'groupStore.label', default: 'GroupStore')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: kfGroupInstance, field: 'groupStores', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'packageGroups', 'error')} ">
				<label for="packageGroups" class="control-label"><g:message code="kfGroup.packageGroups.label" default="Package Groups" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${kfGroupInstance?.packageGroups?}" var="p">
    <li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="packageGroup" action="create" params="['kfGroup.id': kfGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'packageGroup.label', default: 'PackageGroup')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: kfGroupInstance, field: 'packageGroups', 'error')}</span>
				</div>
			</div>

