
<%@ page import="todo.Task" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'task.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'task.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'task.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="dateAssigned" title="${message(code: 'task.dateAssigned.label', default: 'Date Assigned')}" />
                        
                            <g:sortableColumn property="completeBy" title="${message(code: 'task.completeBy.label', default: 'Complete By')}" />
                        
                            <th><g:message code="task.assignedBy.label" default="Assigned By" /></th>
                        
                            <g:sortableColumn property="notes" title="${message(code: 'task.notes.label', default: 'Notes')}" />
                        
                            <g:sortableColumn property="priority" title="${message(code: 'task.priority.label', default: 'Priority')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'task.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'task.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <th><g:message code="task.taskGroup.label" default="Task Group" /></th>
                        
                        	<!-- action column -->
                        	<th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${taskInstance.dateAssigned}" /></td>
                        
                            <td><g:formatDate date="${taskInstance.completeBy}" /></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "assignedBy")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "notes")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "priority")}</td>
                        
                            <td><g:formatDate date="${taskInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${taskInstance.lastUpdated}" /></td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "taskGroup")}</td>
                        
                        	<!-- action column -->
                        	<td>
                        		<g:link action="show" id="${taskInstance.id}"><img src="${createLink(uri: '/images/icons/Search.png')}" /></g:link>
                        		<g:link action="edit" id="${taskInstance.id}"><img src="${createLink(uri: '/images/icons/Modify.png')}" /></g:link>
                        		<g:link action="delete" id="${taskInstance.id}"><img src="${createLink(uri: '/images/icons/Delete.png')}" /></g:link>
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taskInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
