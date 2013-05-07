<%@ page import="com.mm.pdms.PackageVersion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'versionNumber', 'error')} required">
				<label for="versionNumber" class="control-label"><g:message code="packageVersion.versionNumber.label" default="Version Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="versionNumber" required="" value="${packageVersionInstance?.versionNumber}"/>
					<span class="help-inline">${hasErrors(bean: packageVersionInstance, field: 'versionNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'packagePath', 'error')} required">
				<label for="packagePath" class="control-label"><g:message code="packageVersion.packagePath.label" default="Package Path" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="packagePath" required="" value="${packageVersionInstance?.packagePath}"/>
					<span class="help-inline">${hasErrors(bean: packageVersionInstance, field: 'packagePath', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'comment', 'error')} ">
				<label for="comment" class="control-label"><g:message code="packageVersion.comment.label" default="Comment" /></label>
				<div class="controls">
					<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${packageVersionInstance?.comment}"/>
					<span class="help-inline">${hasErrors(bean: packageVersionInstance, field: 'comment', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'packageGroups', 'error')} ">
				<label for="packageGroups" class="control-label"><g:message code="packageVersion.packageGroups.label" default="Package Groups" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${packageVersionInstance?.packageGroups?}" var="p">
    <li><g:link controller="packageGroup" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="packageGroup" action="create" params="['packageVersion.id': packageVersionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'packageGroup.label', default: 'PackageGroup')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: packageVersionInstance, field: 'packageGroups', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: packageVersionInstance, field: 'posCallLogs', 'error')} ">
				<label for="posCallLogs" class="control-label"><g:message code="packageVersion.posCallLogs.label" default="Pos Call Logs" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${packageVersionInstance?.posCallLogs?}" var="p">
    <li><g:link controller="posCallLog" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="posCallLog" action="create" params="['packageVersion.id': packageVersionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posCallLog.label', default: 'PosCallLog')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: packageVersionInstance, field: 'posCallLogs', 'error')}</span>
				</div>
			</div>

