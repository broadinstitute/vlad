
<%@ page import="org.broadinstitute.vlad.VariantPhenotypeAssociation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-variantPhenotypeAssociation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-variantPhenotypeAssociation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list variantPhenotypeAssociation">
			
				<g:if test="${variantPhenotypeAssociationInstance?.pubMedId}">
				<li class="fieldcontain">
					<span id="pubMedId-label" class="property-label"><g:message code="variantPhenotypeAssociation.pubMedId.label" default="Pub Med Id" /></span>
					
						<span class="property-value" aria-labelledby="pubMedId-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="pubMedId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.study}">
				<li class="fieldcontain">
					<span id="study-label" class="property-label"><g:message code="variantPhenotypeAssociation.study.label" default="Study" /></span>
					
						<span class="property-value" aria-labelledby="study-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="study"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.webLink}">
				<li class="fieldcontain">
					<span id="webLink-label" class="property-label"><g:message code="variantPhenotypeAssociation.webLink.label" default="Web Link" /></span>
					
						<span class="property-value" aria-labelledby="webLink-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="webLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.gene}">
				<li class="fieldcontain">
					<span id="gene-label" class="property-label"><g:message code="variantPhenotypeAssociation.gene.label" default="Gene" /></span>
					
						<span class="property-value" aria-labelledby="gene-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="gene"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.context}">
				<li class="fieldcontain">
					<span id="context-label" class="property-label"><g:message code="variantPhenotypeAssociation.context.label" default="Context" /></span>
					
						<span class="property-value" aria-labelledby="context-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="context"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.pValue}">
				<li class="fieldcontain">
					<span id="pValue-label" class="property-label"><g:message code="variantPhenotypeAssociation.pValue.label" default="P Value" /></span>
					
						<span class="property-value" aria-labelledby="pValue-label"><g:fieldValue bean="${variantPhenotypeAssociationInstance}" field="pValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.phenotype}">
				<li class="fieldcontain">
					<span id="phenotype-label" class="property-label"><g:message code="variantPhenotypeAssociation.phenotype.label" default="Phenotype" /></span>
					
						<span class="property-value" aria-labelledby="phenotype-label"><g:link controller="phenotype" action="show" id="${variantPhenotypeAssociationInstance?.phenotype?.id}">${variantPhenotypeAssociationInstance?.phenotype?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantPhenotypeAssociationInstance?.variant}">
				<li class="fieldcontain">
					<span id="variant-label" class="property-label"><g:message code="variantPhenotypeAssociation.variant.label" default="Variant" /></span>
					
						<span class="property-value" aria-labelledby="variant-label"><g:link controller="variant" action="show" id="${variantPhenotypeAssociationInstance?.variant?.id}">${variantPhenotypeAssociationInstance?.variant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:variantPhenotypeAssociationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${variantPhenotypeAssociationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
