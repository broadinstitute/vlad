<%@ page import="org.broadinstitute.vlad.Phenotype" %>



<div class="fieldcontain ${hasErrors(bean: phenotypeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="phenotype.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${phenotypeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: phenotypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="phenotype.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${phenotypeInstance?.name}"/>

</div>

