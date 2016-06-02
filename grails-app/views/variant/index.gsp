
<%@ page import="org.broadinstitute.vlad.Variant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variant.label', default: 'Variant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-variant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-variant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="alternate" title="${message(code: 'variant.alternate.label', default: 'Alternate')}" />
					
						<g:sortableColumn property="chromosome" title="${message(code: 'variant.chromosome.label', default: 'Chromosome')}" />
					
						<g:sortableColumn property="dbSnpId" title="${message(code: 'variant.dbSnpId.label', default: 'Db Snp Id')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'variant.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="position" title="${message(code: 'variant.position.label', default: 'Position')}" />
					
						<g:sortableColumn property="reference" title="${message(code: 'variant.reference.label', default: 'Reference')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${variantInstanceList}" status="i" var="variantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${variantInstance.id}">${fieldValue(bean: variantInstance, field: "alternate")}</g:link></td>
					
						<td>${fieldValue(bean: variantInstance, field: "chromosome")}</td>
					
						<td>${fieldValue(bean: variantInstance, field: "dbSnpId")}</td>
					
						<td>${fieldValue(bean: variantInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: variantInstance, field: "position")}</td>
					
						<td>${fieldValue(bean: variantInstance, field: "reference")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${variantInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
