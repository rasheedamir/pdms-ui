<%@ page import="com.mm.pdms.KfGroup" %>



<div class="fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="kfGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${kfGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'groupStores', 'error')} ">
	<label for="groupStores">
		<g:message code="kfGroup.groupStores.label" default="Group Stores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${kfGroupInstance?.groupStores?}" var="g">
    <li><g:link controller="groupStore" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="groupStore" action="create" params="['kfGroup.id': kfGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'groupStore.label', default: 'GroupStore')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: kfGroupInstance, field: 'packageGroups', 'error')} ">
	<label for="packageGroups">
		<g:message code="kfGroup.packageGroups.label" default="Package Groups" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${kfGroupInstance?.packageGroups?}" var="p">
    <li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="packageGroup" action="create" params="['kfGroup.id': kfGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'packageGroup.label', default: 'PackageGroup')])}</g:link>
</li>
</ul>

</div>

