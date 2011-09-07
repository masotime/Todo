package todo

class ActionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [actionInstanceList: Action.list(params), actionInstanceTotal: Action.count()]
    }

    def create = {
        def actionInstance = new Action()
        actionInstance.properties = params
        return [actionInstance: actionInstance]
    }

    def save = {
        def actionInstance = new Action(params)
        if (actionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'action.label', default: 'Action'), actionInstance.id])}"
            redirect(action: "show", id: actionInstance.id)
        }
        else {
            render(view: "create", model: [actionInstance: actionInstance])
        }
    }

    def show = {
        def actionInstance = Action.get(params.id)
        if (!actionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
            redirect(action: "list")
        }
        else {
            [actionInstance: actionInstance]
        }
    }

    def edit = {
        def actionInstance = Action.get(params.id)
        if (!actionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [actionInstance: actionInstance]
        }
    }

    def update = {
        def actionInstance = Action.get(params.id)
        if (actionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (actionInstance.version > version) {
                    
                    actionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'action.label', default: 'Action')] as Object[], "Another user has updated this Action while you were editing")
                    render(view: "edit", model: [actionInstance: actionInstance])
                    return
                }
            }
            actionInstance.properties = params
            if (!actionInstance.hasErrors() && actionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'action.label', default: 'Action'), actionInstance.id])}"
                redirect(action: "show", id: actionInstance.id)
            }
            else {
                render(view: "edit", model: [actionInstance: actionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def actionInstance = Action.get(params.id)
        if (actionInstance) {
            try {
                actionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), params.id])}"
            redirect(action: "list")
        }
    }
}
