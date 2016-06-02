
<%@ page import="org.broadinstitute.vlad.VariantPhenotypeAssociation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-variantPhenotypeAssociation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-variantPhenotypeAssociation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="context" title="${message(code: 'variantPhenotypeAssociation.context.label', default: 'Context')}" />
					
						<g:sortableColumn property="gene" title="${message(code: 'variantPhenotypeAssociation.gene.label', default: 'Gene')}" />
					
						<g:sortableColumn property="pValue" title="${message(code: 'variantPhenotypeAssociation.pValue.label', default: 'P Value')}" />
					
						<th><g:message code="variantPhenotypeAssociation.phenotype.label" default="Phenotype" /></th>
					
						<g:sortableColumn property="pubMedId" title="${message(code: 'variantPhenotypeAssociation.pubMedId.label', default: 'Pub Med Id')}" />
					
						<g:sortableColumn property="study" title="${message(code: 'variantPhenotypeAssociation.study.label', default: 'Study')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${variantPhenotypeAssociationInstanceList}" status="i" var="variantPhenotypeAssociationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${variantPhenotypeAssociationInstance.id}">${fieldValue(bean: variantPhenotypeAssociationInstance, field: "context")}</g:link></td>
					
						<td>${fieldValue(bean: variantPhenotypeAssociationInstance, field: "gene")}</td>
					
						<td>${fieldValue(bean: variantPhenotypeAssociationInstance, field: "pValue")}</td>
					
						<td>${fieldValue(bean: variantPhenotypeAssociationInstance, field: "phenotype")}</td>
					
						<td>${fieldValue(bean: variantPhenotypeAssociationInstance, field: "pubMedId")}</td>
					
						<td>${fieldValue(bean: variantPhenotypeAssociationInstance, field: "study")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${variantPhenotypeAssociationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
