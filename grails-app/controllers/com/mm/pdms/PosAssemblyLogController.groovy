package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

class PosAssemblyLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [posAssemblyLogInstanceList: PosAssemblyLog.list(params), posAssemblyLogInstanceTotal: PosAssemblyLog.count()]
    }

    def create() {
        [posAssemblyLogInstance: new PosAssemblyLog(params)]
    }

    def save() {
        def posAssemblyLogInstance = new PosAssemblyLog(params)
        if (!posAssemblyLogInstance.save(flush: true)) {
            render(view: "create", model: [posAssemblyLogInstance: posAssemblyLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), posAssemblyLogInstance.id])
        redirect(action: "show", id: posAssemblyLogInstance.id)
    }

    def show(Long id) {
        def posAssemblyLogInstance = PosAssemblyLog.get(id)
        if (!posAssemblyLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "list")
            return
        }

        [posAssemblyLogInstance: posAssemblyLogInstance]
    }

    def edit(Long id) {
        def posAssemblyLogInstance = PosAssemblyLog.get(id)
        if (!posAssemblyLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "list")
            return
        }

        [posAssemblyLogInstance: posAssemblyLogInstance]
    }

    def update(Long id, Long version) {
        def posAssemblyLogInstance = PosAssemblyLog.get(id)
        if (!posAssemblyLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (posAssemblyLogInstance.version > version) {
                posAssemblyLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog')] as Object[],
                          "Another user has updated this PosAssemblyLog while you were editing")
                render(view: "edit", model: [posAssemblyLogInstance: posAssemblyLogInstance])
                return
            }
        }

        posAssemblyLogInstance.properties = params

        if (!posAssemblyLogInstance.save(flush: true)) {
            render(view: "edit", model: [posAssemblyLogInstance: posAssemblyLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), posAssemblyLogInstance.id])
        redirect(action: "show", id: posAssemblyLogInstance.id)
    }

    def delete(Long id) {
        def posAssemblyLogInstance = PosAssemblyLog.get(id)
        if (!posAssemblyLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "list")
            return
        }

        try {
            posAssemblyLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'posAssemblyLog.label', default: 'PosAssemblyLog'), id])
            redirect(action: "show", id: id)
        }
    }
}
