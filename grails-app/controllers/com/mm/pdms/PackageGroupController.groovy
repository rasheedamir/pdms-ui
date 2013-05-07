package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

/**
 * PackageGroupController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PackageGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
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

    def show() {
        def packageGroupInstance = PackageGroup.get(params.id)
        if (!packageGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "list")
            return
        }

        [packageGroupInstance: packageGroupInstance]
    }

    def edit() {
        def packageGroupInstance = PackageGroup.get(params.id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "list")
            return
        }

        [packageGroupInstance: packageGroupInstance]
    }

    def update() {
        def packageGroupInstance = PackageGroup.get(params.id)
        if (!packageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
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

    def delete() {
        def packageGroupInstance = PackageGroup.get(params.id)
        if (!packageGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            packageGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'packageGroup.label', default: 'PackageGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
