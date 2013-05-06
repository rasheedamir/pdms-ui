package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

class KfGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
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

    def show(Long id) {
        def kfGroupInstance = KfGroup.get(id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "list")
            return
        }

        [kfGroupInstance: kfGroupInstance]
    }

    def edit(Long id) {
        def kfGroupInstance = KfGroup.get(id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "list")
            return
        }

        [kfGroupInstance: kfGroupInstance]
    }

    def update(Long id, Long version) {
        def kfGroupInstance = KfGroup.get(id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
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

    def delete(Long id) {
        def kfGroupInstance = KfGroup.get(id)
        if (!kfGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            kfGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'kfGroup.label', default: 'KfGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
