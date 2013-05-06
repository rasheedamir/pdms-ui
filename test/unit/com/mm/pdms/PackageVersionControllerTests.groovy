package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

@TestFor(PackageVersionController)
@Mock(PackageVersion)
class PackageVersionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/packageVersion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.packageVersionInstanceList.size() == 0
        assert model.packageVersionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.packageVersionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.packageVersionInstance != null
        assert view == '/packageVersion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/packageVersion/show/1'
        assert controller.flash.message != null
        assert PackageVersion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/packageVersion/list'

        populateValidParams(params)
        def packageVersion = new PackageVersion(params)

        assert packageVersion.save() != null

        params.id = packageVersion.id

        def model = controller.show()

        assert model.packageVersionInstance == packageVersion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/packageVersion/list'

        populateValidParams(params)
        def packageVersion = new PackageVersion(params)

        assert packageVersion.save() != null

        params.id = packageVersion.id

        def model = controller.edit()

        assert model.packageVersionInstance == packageVersion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/packageVersion/list'

        response.reset()

        populateValidParams(params)
        def packageVersion = new PackageVersion(params)

        assert packageVersion.save() != null

        // test invalid parameters in update
        params.id = packageVersion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/packageVersion/edit"
        assert model.packageVersionInstance != null

        packageVersion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/packageVersion/show/$packageVersion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        packageVersion.clearErrors()

        populateValidParams(params)
        params.id = packageVersion.id
        params.version = -1
        controller.update()

        assert view == "/packageVersion/edit"
        assert model.packageVersionInstance != null
        assert model.packageVersionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/packageVersion/list'

        response.reset()

        populateValidParams(params)
        def packageVersion = new PackageVersion(params)

        assert packageVersion.save() != null
        assert PackageVersion.count() == 1

        params.id = packageVersion.id

        controller.delete()

        assert PackageVersion.count() == 0
        assert PackageVersion.get(packageVersion.id) == null
        assert response.redirectedUrl == '/packageVersion/list'
    }
}
