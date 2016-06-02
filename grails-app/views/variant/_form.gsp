<%@ page import="org.broadinstitute.vlad.Variant" %>



<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'chromosome', 'error')} ">
	<label for="chromosome">
		<g:message code="variant.chromosome.label" default="Chromosome" />
		
	</label>
	<g:textField name="chromosome" value="${variantInstance?.chromosome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="variant.position.label" default="Position" />
		
	</label>
	<g:field name="position" type="number" value="${variantInstance.position}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'reference', 'error')} ">
	<label for="reference">
		<g:message code="variant.reference.label" default="Reference" />
		
	</label>
	<g:textField name="reference" value="${variantInstance?.reference}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'alternate', 'error')} ">
	<label for="alternate">
		<g:message code="variant.alternate.label" default="Alternate" />
		
	</label>
	<g:textField name="alternate" value="${variantInstance?.alternate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="variant.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${variantInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: variantInstance, field: 'dbSnpId', 'error')} required">
	<label for="dbSnpId">
		<g:message code="variant.dbSnpId.label" default="Db Snp Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dbSnpId" required="" value="${variantInstance?.dbSnpId}"/>

</div>

