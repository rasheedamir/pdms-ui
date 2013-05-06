package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

@TestFor(KfGroupController)
@Mock(KfGroup)
class KfGroupControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/kfGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.kfGroupInstanceList.size() == 0
        assert model.kfGroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.kfGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.kfGroupInstance != null
        assert view == '/kfGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/kfGroup/show/1'
        assert controller.flash.message != null
        assert KfGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/kfGroup/list'

        populateValidParams(params)
        def kfGroup = new KfGroup(params)

        assert kfGroup.save() != null

        params.id = kfGroup.id

        def model = controller.show()

        assert model.kfGroupInstance == kfGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/kfGroup/list'

        populateValidParams(params)
        def kfGroup = new KfGroup(params)

        assert kfGroup.save() != null

        params.id = kfGroup.id

        def model = controller.edit()

        assert model.kfGroupInstance == kfGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/kfGroup/list'

        response.reset()

        populateValidParams(params)
        def kfGroup = new KfGroup(params)

        assert kfGroup.save() != null

        // test invalid parameters in update
        params.id = kfGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/kfGroup/edit"
        assert model.kfGroupInstance != null

        kfGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/kfGroup/show/$kfGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        kfGroup.clearErrors()

        populateValidParams(params)
        params.id = kfGroup.id
        params.version = -1
        controller.update()

        assert view == "/kfGroup/edit"
        assert model.kfGroupInstance != null
        assert model.kfGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/kfGroup/list'

        response.reset()

        populateValidParams(params)
        def kfGroup = new KfGroup(params)

        assert kfGroup.save() != null
        assert KfGroup.count() == 1

        params.id = kfGroup.id

        controller.delete()

        assert KfGroup.count() == 0
        assert KfGroup.get(kfGroup.id) == null
        assert response.redirectedUrl == '/kfGroup/list'
    }
}
