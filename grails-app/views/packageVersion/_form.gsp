<%@ page import="com.mm.pdms.PackageVersion" %>



<div class="fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'versionNumber', 'error')} required">
	<label for="versionNumber">
		<g:message code="packageVersion.versionNumber.label" default="Version Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="versionNumber" required="" value="${packageVersionInstance?.versionNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'packagePath', 'error')} required">
	<label for="packagePath">
		<g:message code="packageVersion.packagePath.label" default="Package Path" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="packagePath" required="" value="${packageVersionInstance?.packagePath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="packageVersion.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${packageVersionInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'packageGroups', 'error')} ">
	<label for="packageGroups">
		<g:message code="packageVersion.packageGroups.label" default="Package Groups" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${packageVersionInstance?.packageGroups?}" var="p">
    <li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="packageGroup" action="create" params="['packageVersion.id': packageVersionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'packageGroup.label', default: 'PackageGroup')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'posCallLogs', 'error')} ">
	<label for="posCallLogs">
		<g:message code="packageVersion.posCallLogs.label" default="Pos Call Logs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${packageVersionInstance?.posCallLogs?}" var="p">
    <li><g:link controller="posCallLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="posCallLog" action="create" params="['packageVersion.id': packageVersionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posCallLog.label', default: 'PosCallLog')])}</g:link>
</li>
</ul>

</div>

