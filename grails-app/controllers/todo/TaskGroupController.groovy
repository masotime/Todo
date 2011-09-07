package todo

class TaskGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taskGroupInstanceList: TaskGroup.list(params), taskGroupInstanceTotal: TaskGroup.count()]
    }

    def create = {
        def taskGroupInstance = new TaskGroup()
        taskGroupInstance.properties = params
        return [taskGroupInstance: taskGroupInstance]
    }

    def save = {
        def taskGroupInstance = new TaskGroup(params)
        if (taskGroupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), taskGroupInstance.id])}"
            redirect(action: "show", id: taskGroupInstance.id)
        }
        else {
            render(view: "create", model: [taskGroupInstance: taskGroupInstance])
        }
    }

    def show = {
        def taskGroupInstance = TaskGroup.get(params.id)
        if (!taskGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [taskGroupInstance: taskGroupInstance]
        }
    }

    def edit = {
        def taskGroupInstance = TaskGroup.get(params.id)
        if (!taskGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [taskGroupInstance: taskGroupInstance]
        }
    }

    def update = {
        def taskGroupInstance = TaskGroup.get(params.id)
        if (taskGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (taskGroupInstance.version > version) {
                    
                    taskGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'taskGroup.label', default: 'TaskGroup')] as Object[], "Another user has updated this TaskGroup while you were editing")
                    render(view: "edit", model: [taskGroupInstance: taskGroupInstance])
                    return
                }
            }
            taskGroupInstance.properties = params
            if (!taskGroupInstance.hasErrors() && taskGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), taskGroupInstance.id])}"
                redirect(action: "show", id: taskGroupInstance.id)
            }
            else {
                render(view: "edit", model: [taskGroupInstance: taskGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def taskGroupInstance = TaskGroup.get(params.id)
        if (taskGroupInstance) {
            try {
                taskGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taskGroup.label', default: 'TaskGroup'), params.id])}"
            redirect(action: "list")
        }
    }
}
