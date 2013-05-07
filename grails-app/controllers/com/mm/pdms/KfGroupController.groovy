package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

/**
 * KfGroupController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class KfGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [kfGroupInstanceList: KfGroup.list(params), kfGroupInstanceTotal: KfGroup.count()]
    }

    def create() {
        [kfGroupInstance: new KfGroup(params)]
    }

    def save() {
        def kfGroupInstance = new KfGroup(params)
        if (!kfGroupInstance.save(flush: true)) {
            render(view: "create", model: [kfGroupInstance: kfGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), kfGroupInstance.id])
        redirect(action: "show", id: kfGroupInstance.id)
    }

    def show() {
        def kfGroupInstance = KfGroup.get(params.id)
        if (!kfGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "list")
            return
        }

        [kfGroupInstance: kfGroupInstance]
    }

    def edit() {
        def kfGroupInstance = KfGroup.get(params.id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "list")
            return
        }

        [kfGroupInstance: kfGroupInstance]
    }

    def update() {
        def kfGroupInstance = KfGroup.get(params.id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (kfGroupInstance.version > version) {
                kfGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'kfGroup.label', default: 'KfGroup')] as Object[],
                          "Another user has updated this KfGroup while you were editing")
                render(view: "edit", model: [kfGroupInstance: kfGroupInstance])
                return
            }
        }

        kfGroupInstance.properties = params

        if (!kfGroupInstance.save(flush: true)) {
            render(view: "edit", model: [kfGroupInstance: kfGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), kfGroupInstance.id])
        redirect(action: "show", id: kfGroupInstance.id)
    }

    def delete() {
        def kfGroupInstance = KfGroup.get(params.id)
        if (!kfGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            kfGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
