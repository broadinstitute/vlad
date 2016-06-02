
<%@ page import="org.broadinstitute.vlad.Variant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variant.label', default: 'Variant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-variant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-variant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list variant">
			
				<g:if test="${variantInstance?.alternate}">
				<li class="fieldcontain">
					<span id="alternate-label" class="property-label"><g:message code="variant.alternate.label" default="Alternate" /></span>
					
						<span class="property-value" aria-labelledby="alternate-label"><g:fieldValue bean="${variantInstance}" field="alternate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantInstance?.chromosome}">
				<li class="fieldcontain">
					<span id="chromosome-label" class="property-label"><g:message code="variant.chromosome.label" default="Chromosome" /></span>
					
						<span class="property-value" aria-labelledby="chromosome-label"><g:fieldValue bean="${variantInstance}" field="chromosome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantInstance?.dbSnpId}">
				<li class="fieldcontain">
					<span id="dbSnpId-label" class="property-label"><g:message code="variant.dbSnpId.label" default="Db Snp Id" /></span>
					
						<span class="property-value" aria-labelledby="dbSnpId-label"><g:fieldValue bean="${variantInstance}" field="dbSnpId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="variant.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${variantInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="variant.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${variantInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantInstance?.reference}">
				<li class="fieldcontain">
					<span id="reference-label" class="property-label"><g:message code="variant.reference.label" default="Reference" /></span>
					
						<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${variantInstance}" field="reference"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:variantInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${variantInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
