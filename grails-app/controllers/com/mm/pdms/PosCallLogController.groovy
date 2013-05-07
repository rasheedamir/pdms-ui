package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

/**
 * PosCallLogController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PosCallLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
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

    def show() {
        def posCallLogInstance = PosCallLog.get(params.id)
        if (!posCallLogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "list")
            return
        }

        [posCallLogInstance: posCallLogInstance]
    }

    def edit() {
        def posCallLogInstance = PosCallLog.get(params.id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "list")
            return
        }

        [posCallLogInstance: posCallLogInstance]
    }

    def update() {
        def posCallLogInstance = PosCallLog.get(params.id)
        if (!posCallLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
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

    def delete() {
        def posCallLogInstance = PosCallLog.get(params.id)
        if (!posCallLogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "list")
            return
        }

        try {
            posCallLogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'posCallLog.label', default: 'PosCallLog'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
