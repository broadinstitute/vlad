<%@ page import="org.broadinstitute.vlad.VariantPhenotypeAssociation" %>



<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'context', 'error')} required">
	<label for="context">
		<g:message code="variantPhenotypeAssociation.context.label" default="Context" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="context" required="" value="${variantPhenotypeAssociationInstance?.context}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'gene', 'error')} required">
	<label for="gene">
		<g:message code="variantPhenotypeAssociation.gene.label" default="Gene" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gene" required="" value="${variantPhenotypeAssociationInstance?.gene}"/>

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

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'pubMedId', 'error')} required">
	<label for="pubMedId">
		<g:message code="variantPhenotypeAssociation.pubMedId.label" default="Pub Med Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pubMedId" type="number" value="${variantPhenotypeAssociationInstance.pubMedId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'study', 'error')} required">
	<label for="study">
		<g:message code="variantPhenotypeAssociation.study.label" default="Study" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="study" required="" value="${variantPhenotypeAssociationInstance?.study}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'variant', 'error')} required">
	<label for="variant">
		<g:message code="variantPhenotypeAssociation.variant.label" default="Variant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="variant" name="variant.id" from="${org.broadinstitute.vlad.Variant.list()}" optionKey="id" required="" value="${variantPhenotypeAssociationInstance?.variant?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantPhenotypeAssociationInstance, field: 'webLink', 'error')} required">
	<label for="webLink">
		<g:message code="variantPhenotypeAssociation.webLink.label" default="Web Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="webLink" required="" value="${variantPhenotypeAssociationInstance?.webLink}"/>

</div>

