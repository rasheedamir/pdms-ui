package com.mm.pdms

import org.springframework.dao.DataIntegrityViolationException

/**
 * PackageVersionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PackageVersionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [packageVersionInstanceList: PackageVersion.list(params), packageVersionInstanceTotal: PackageVersion.count()]
    }

    def create() {
        [packageVersionInstance: new PackageVersion(params)]
    }

    def save() {
        def packageVersionInstance = new PackageVersion(params)
        if (!packageVersionInstance.save(flush: true)) {
            render(view: "create", model: [packageVersionInstance: packageVersionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), packageVersionInstance.id])
        redirect(action: "show", id: packageVersionInstance.id)
    }

    def show() {
        def packageVersionInstance = PackageVersion.get(params.id)
        if (!packageVersionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "list")
            return
        }

        [packageVersionInstance: packageVersionInstance]
    }

    def edit() {
        def packageVersionInstance = PackageVersion.get(params.id)
        if (!packageVersionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "list")
            return
        }

        [packageVersionInstance: packageVersionInstance]
    }

    def update() {
        def packageVersionInstance = PackageVersion.get(params.id)
        if (!packageVersionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (packageVersionInstance.version > version) {
                packageVersionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'packageVersion.label', default: 'PackageVersion')] as Object[],
                          "Another user has updated this PackageVersion while you were editing")
                render(view: "edit", model: [packageVersionInstance: packageVersionInstance])
                return
            }
        }

        packageVersionInstance.properties = params

        if (!packageVersionInstance.save(flush: true)) {
            render(view: "edit", model: [packageVersionInstance: packageVersionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), packageVersionInstance.id])
        redirect(action: "show", id: packageVersionInstance.id)
    }

    def delete() {
        def packageVersionInstance = PackageVersion.get(params.id)
        if (!packageVersionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            packageVersionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'packageVersion.label', default: 'PackageVersion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
