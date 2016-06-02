<%@ page import="org.broadinstitute.vlad.VariantPhenotypeAssociation" %>



<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'pubMedId', 'error')} ">
	<label for="pubMedId">
		<g:message code="variantPhenotypeAssociation.pubMedId.label" default="Pub Med Id" />
		
	</label>
	<g:field name="pubMedId" type="number" value="${variantPhenotypeAssociationInstance.pubMedId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'study', 'error')} ">
	<label for="study">
		<g:message code="variantPhenotypeAssociation.study.label" default="Study" />
		
	</label>
	<g:textField name="study" value="${variantPhenotypeAssociationInstance?.study}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'webLink', 'error')} ">
	<label for="webLink">
		<g:message code="variantPhenotypeAssociation.webLink.label" default="Web Link" />
		
	</label>
	<g:textField name="webLink" value="${variantPhenotypeAssociationInstance?.webLink}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'gene', 'error')} ">
	<label for="gene">
		<g:message code="variantPhenotypeAssociation.gene.label" default="Gene" />
		
	</label>
	<g:textField name="gene" value="${variantPhenotypeAssociationInstance?.gene}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'context', 'error')} ">
	<label for="context">
		<g:message code="variantPhenotypeAssociation.context.label" default="Context" />
		
	</label>
	<g:textField name="context" value="${variantPhenotypeAssociationInstance?.context}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'pValue', 'error')} required">
	<label for="pValue">
		<g:message code="variantPhenotypeAssociation.pValue.label" default="P Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pValue" value="${fieldValue(bean: variantPhenotypeAssociationInstance, field: 'pValue')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'phenotype', 'error')} required">
	<label for="phenotype">
		<g:message code="variantPhenotypeAssociation.phenotype.label" default="Phenotype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="phenotype" name="phenotype.id" from="${org.broadinstitute.vlad.Phenotype.list()}" optionKey="id" required="" value="${variantPhenotypeAssociationInstance?.phenotype?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'variant', 'error')} required">
	<label for="variant">
		<g:message code="variantPhenotypeAssociation.variant.label" default="Variant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="variant" name="variant.id" from="${org.broadinstitute.vlad.Variant.list()}" optionKey="id" required="" value="${variantPhenotypeAssociationInstance?.variant?.id}" class="many-to-one"/>

</div>

