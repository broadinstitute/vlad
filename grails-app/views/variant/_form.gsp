<%@ page import="org.broadinstitute.vlad.Variant" %>



<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'alternate', 'error')} required">
	<label for="alternate">
		<g:message code="variant.alternate.label" default="Alternate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="alternate" required="" value="${variantInstance?.alternate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'chromosome', 'error')} required">
	<label for="chromosome">
		<g:message code="variant.chromosome.label" default="Chromosome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="chromosome" required="" value="${variantInstance?.chromosome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'dbSnpId', 'error')} required">
	<label for="dbSnpId">
		<g:message code="variant.dbSnpId.label" default="Db Snp Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dbSnpId" required="" value="${variantInstance?.dbSnpId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="variant.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${variantInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'position', 'error')} required">
	<label for="position">
		<g:message code="variant.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="position" type="number" value="${variantInstance.position}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'reference', 'error')} required">
	<label for="reference">
		<g:message code="variant.reference.label" default="Reference" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reference" required="" value="${variantInstance?.reference}"/>

</div>

