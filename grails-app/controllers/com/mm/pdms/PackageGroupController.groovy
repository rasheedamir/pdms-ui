package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

class PackageGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [packageGroupInstanceList: PackageGroup.list(params), packageGroupInstanceTotal: PackageGroup.count()]
    }

    def create() {
        [packageGroupInstance: new PackageGroup(params)]
    }

    def save() {
        def packageGroupInstance = new PackageGroup(params)
        if (!packageGroupInstance.save(flush: true)) {
            render(view: "create", model: [packageGroupInstance: packageGroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), packageGroupInstance.id])
        redirect(action: "show", id: packageGroupInstance.id)
    }

    def show(Long id) {
        def packageGroupInstance = PackageGroup.get(id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "list")
            return
        }

        [packageGroupInstance: packageGroupInstance]
    }

    def edit(Long id) {
        def packageGroupInstance = PackageGroup.get(id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "list")
            return
        }

        [packageGroupInstance: packageGroupInstance]
    }

    def update(Long id, Long version) {
        def packageGroupInstance = PackageGroup.get(id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (packageGroupInstance.version > version) {
                packageGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'packageGroup.label', default: 'PackageGroup')] as Object[],
                          "Another user has updated this PackageGroup while you were editing")
                render(view: "edit", model: [packageGroupInstance: packageGroupInstance])
                return
            }
        }

        packageGroupInstance.properties = params

        if (!packageGroupInstance.save(flush: true)) {
            render(view: "edit", model: [packageGroupInstance: packageGroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), packageGroupInstance.id])
        redirect(action: "show", id: packageGroupInstance.id)
    }

    def delete(Long id) {
        def packageGroupInstance = PackageGroup.get(id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            packageGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
