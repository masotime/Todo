

<%@ page import="todo.Action" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${actionInstance}">
            <div class="errors">
                <g:renderErrors bean="${actionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${actionInstance?.id}" />
                <g:hiddenField name="version" value="${actionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="taken"><g:message code="action.taken.label" default="Taken" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'taken', 'errors')}">
                                    <g:checkBox name="taken" value="${actionInstance?.taken}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="action.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${actionInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="waiting"><g:message code="action.waiting.label" default="Waiting" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'waiting', 'errors')}">
                                    <g:checkBox name="waiting" value="${actionInstance?.waiting}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="waitingFor"><g:message code="action.waitingFor.label" default="Waiting For" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'waitingFor', 'errors')}">
                                    <g:textField name="waitingFor" value="${actionInstance?.waitingFor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="waitingOn"><g:message code="action.waitingOn.label" default="Waiting On" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'waitingOn', 'errors')}">
                                    <g:select name="waitingOn.id" from="${todo.Person.list()}" optionKey="id" value="${actionInstance?.waitingOn?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="order"><g:message code="action.order.label" default="Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'order', 'errors')}">
                                    <g:textField name="order" value="${fieldValue(bean: actionInstance, field: 'order')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="task"><g:message code="action.task.label" default="Task" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actionInstance, field: 'task', 'errors')}">
                                    <g:select name="task.id" from="${todo.Task.list()}" optionKey="id" value="${actionInstance?.task?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
