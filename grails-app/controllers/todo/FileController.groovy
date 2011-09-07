package todo

class FileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fileInstanceList: File.list(params), fileInstanceTotal: File.count()]
    }

    def create = {
        def fileInstance = new File()
        fileInstance.properties = params
        return [fileInstance: fileInstance]
    }

    def save = {
        def fileInstance = new File(params)
        if (fileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'file.label', default: 'File'), fileInstance.id])}"
            redirect(action: "show", id: fileInstance.id)
        }
        else {
            render(view: "create", model: [fileInstance: fileInstance])
        }
    }

    def show = {
        def fileInstance = File.get(params.id)
        if (!fileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fileInstance: fileInstance]
        }
    }

    def edit = {
        def fileInstance = File.get(params.id)
        if (!fileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fileInstance: fileInstance]
        }
    }

    def update = {
        def fileInstance = File.get(params.id)
        if (fileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fileInstance.version > version) {
                    
                    fileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'file.label', default: 'File')] as Object[], "Another user has updated this File while you were editing")
                    render(view: "edit", model: [fileInstance: fileInstance])
                    return
                }
            }
            fileInstance.properties = params
            if (!fileInstance.hasErrors() && fileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'file.label', default: 'File'), fileInstance.id])}"
                redirect(action: "show", id: fileInstance.id)
            }
            else {
                render(view: "edit", model: [fileInstance: fileInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fileInstance = File.get(params.id)
        if (fileInstance) {
            try {
                fileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), params.id])}"
            redirect(action: "list")
        }
    }
}
