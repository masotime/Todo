
<%@ page import="todo.TaskGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taskGroup.label', default: 'TaskGroup')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'taskGroup.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'taskGroup.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'taskGroup.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'taskGroup.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'taskGroup.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskGroupInstanceList}" status="i" var="taskGroupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taskGroupInstance.id}">${fieldValue(bean: taskGroupInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: taskGroupInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${taskGroupInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: taskGroupInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${taskGroupInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taskGroupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
