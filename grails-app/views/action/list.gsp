
<%@ page import="todo.Action" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'action.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="taken" title="${message(code: 'action.taken.label', default: 'Taken')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'action.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="waiting" title="${message(code: 'action.waiting.label', default: 'Waiting')}" />
                        
                            <g:sortableColumn property="waitingFor" title="${message(code: 'action.waitingFor.label', default: 'Waiting For')}" />
                        
                            <th><g:message code="action.waitingOn.label" default="Waiting On" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${actionInstanceList}" status="i" var="actionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${actionInstance.id}">${fieldValue(bean: actionInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${actionInstance.taken}" /></td>
                        
                            <td>${fieldValue(bean: actionInstance, field: "description")}</td>
                        
                            <td><g:formatBoolean boolean="${actionInstance.waiting}" /></td>
                        
                            <td>${fieldValue(bean: actionInstance, field: "waitingFor")}</td>
                        
                            <td>${fieldValue(bean: actionInstance, field: "waitingOn")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${actionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
