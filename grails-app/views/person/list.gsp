
<%@ page import="todo.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="telephone" title="${message(code: 'person.telephone.label', default: 'Telephone')}" />
                        
                        	<!-- action column -->
                        	<th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "telephone")}</td>
                        
                        	<!-- action column -->
                        	<td>
                        		<g:link action="show" id="${personInstance.id}"><img src="${createLink(uri: '/images/icons/Search.png')}" /></g:link>
                        		<g:link action="edit" id="${personInstance.id}"><img src="${createLink(uri: '/images/icons/Modify.png')}" /></g:link>
                        		<g:link action="delete" id="${personInstance.id}"><img src="${createLink(uri: '/images/icons/Delete.png')}" /></g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
