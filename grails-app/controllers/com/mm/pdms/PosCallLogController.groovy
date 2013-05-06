package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

class PosCallLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [posCallLogInstanceList: PosCallLog.list(params), posCallLogInstanceTotal: PosCallLog.count()]
    }

    def create() {
        [posCallLogInstance: new PosCallLog(params)]
    }

    def save() {
        def posCallLogInstance = new PosCallLog(params)
        if (!posCallLogInstance.save(flush: true)) {
            render(view: "create", model: [posCallLogInstance: posCallLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), posCallLogInstance.id])
        redirect(action: "show", id: posCallLogInstance.id)
    }

    def show(Long id) {
        def posCallLogInstance = PosCallLog.get(id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "list")
            return
        }

        [posCallLogInstance: posCallLogInstance]
    }

    def edit(Long id) {
        def posCallLogInstance = PosCallLog.get(id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "list")
            return
        }

        [posCallLogInstance: posCallLogInstance]
    }

    def update(Long id, Long version) {
        def posCallLogInstance = PosCallLog.get(id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (posCallLogInstance.version > version) {
                posCallLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'posCallLog.label', default: 'PosCallLog')] as Object[],
                          "Another user has updated this PosCallLog while you were editing")
                render(view: "edit", model: [posCallLogInstance: posCallLogInstance])
                return
            }
        }

        posCallLogInstance.properties = params

        if (!posCallLogInstance.save(flush: true)) {
            render(view: "edit", model: [posCallLogInstance: posCallLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), posCallLogInstance.id])
        redirect(action: "show", id: posCallLogInstance.id)
    }

    def delete(Long id) {
        def posCallLogInstance = PosCallLog.get(id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "list")
            return
        }

        try {
            posCallLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), id])
            redirect(action: "show", id: id)
        }
    }
}
