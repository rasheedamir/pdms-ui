package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

class GroupStoreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [groupStoreInstanceList: GroupStore.list(params), groupStoreInstanceTotal: GroupStore.count()]
    }

    def create() {
        [groupStoreInstance: new GroupStore(params)]
    }

    def save() {
        def groupStoreInstance = new GroupStore(params)
        if (!groupStoreInstance.save(flush: true)) {
            render(view: "create", model: [groupStoreInstance: groupStoreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), groupStoreInstance.id])
        redirect(action: "show", id: groupStoreInstance.id)
    }

    def show(Long id) {
        def groupStoreInstance = GroupStore.get(id)
        if (!groupStoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "list")
            return
        }

        [groupStoreInstance: groupStoreInstance]
    }

    def edit(Long id) {
        def groupStoreInstance = GroupStore.get(id)
        if (!groupStoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "list")
            return
        }

        [groupStoreInstance: groupStoreInstance]
    }

    def update(Long id, Long version) {
        def groupStoreInstance = GroupStore.get(id)
        if (!groupStoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupStoreInstance.version > version) {
                groupStoreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'groupStore.label', default: 'GroupStore')] as Object[],
                          "Another user has updated this GroupStore while you were editing")
                render(view: "edit", model: [groupStoreInstance: groupStoreInstance])
                return
            }
        }

        groupStoreInstance.properties = params

        if (!groupStoreInstance.save(flush: true)) {
            render(view: "edit", model: [groupStoreInstance: groupStoreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), groupStoreInstance.id])
        redirect(action: "show", id: groupStoreInstance.id)
    }

    def delete(Long id) {
        def groupStoreInstance = GroupStore.get(id)
        if (!groupStoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "list")
            return
        }

        try {
            groupStoreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'groupStore.label', default: 'GroupStore'), id])
            redirect(action: "show", id: id)
        }
    }
}
