package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

/**
 * PackageGroupControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PackageGroupController)
@Mock(PackageGroup)
class PackageGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/packageGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.packageGroupInstanceList.size() == 0
        assert model.packageGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.packageGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.packageGroupInstance != null
        assert view == '/packageGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/packageGroup/show/1'
        assert controller.flash.message != null
        assert PackageGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/packageGroup/list'


        populateValidParams(params)
        def packageGroup = new PackageGroup(params)

        assert packageGroup.save() != null

        params.id = packageGroup.id

        def model = controller.show()

        assert model.packageGroupInstance == packageGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/packageGroup/list'


        populateValidParams(params)
        def packageGroup = new PackageGroup(params)

        assert packageGroup.save() != null

        params.id = packageGroup.id

        def model = controller.edit()

        assert model.packageGroupInstance == packageGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/packageGroup/list'

        response.reset()


        populateValidParams(params)
        def packageGroup = new PackageGroup(params)

        assert packageGroup.save() != null

        // test invalid parameters in update
        params.id = packageGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/packageGroup/edit"
        assert model.packageGroupInstance != null

        packageGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/packageGroup/show/$packageGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        packageGroup.clearErrors()

        populateValidParams(params)
        params.id = packageGroup.id
        params.version = -1
        controller.update()

        assert view == "/packageGroup/edit"
        assert model.packageGroupInstance != null
        assert model.packageGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/packageGroup/list'

        response.reset()

        populateValidParams(params)
        def packageGroup = new PackageGroup(params)

        assert packageGroup.save() != null
        assert PackageGroup.count() == 1

        params.id = packageGroup.id

        controller.delete()

        assert PackageGroup.count() == 0
        assert PackageGroup.get(packageGroup.id) == null
        assert response.redirectedUrl == '/packageGroup/list'
    }
}
