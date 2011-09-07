
<%@ page import="todo.File" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'file.label', default: 'File')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'file.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'file.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="fileContent" title="${message(code: 'file.fileContent.label', default: 'File Content')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'file.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'file.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <th><g:message code="file.task.label" default="Task" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fileInstanceList}" status="i" var="fileInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fileInstance.id}">${fieldValue(bean: fileInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: fileInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: fileInstance, field: "fileContent")}</td>
                        
                            <td><g:formatDate date="${fileInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${fileInstance.lastUpdated}" /></td>
                        
                            <td>${fieldValue(bean: fileInstance, field: "task")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${fileInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
