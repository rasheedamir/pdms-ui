package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

@TestFor(GroupStoreController)
@Mock(GroupStore)
class GroupStoreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/groupStore/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.groupStoreInstanceList.size() == 0
        assert model.groupStoreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.groupStoreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.groupStoreInstance != null
        assert view == '/groupStore/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/groupStore/show/1'
        assert controller.flash.message != null
        assert GroupStore.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/groupStore/list'

        populateValidParams(params)
        def groupStore = new GroupStore(params)

        assert groupStore.save() != null

        params.id = groupStore.id

        def model = controller.show()

        assert model.groupStoreInstance == groupStore
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/groupStore/list'

        populateValidParams(params)
        def groupStore = new GroupStore(params)

        assert groupStore.save() != null

        params.id = groupStore.id

        def model = controller.edit()

        assert model.groupStoreInstance == groupStore
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/groupStore/list'

        response.reset()

        populateValidParams(params)
        def groupStore = new GroupStore(params)

        assert groupStore.save() != null

        // test invalid parameters in update
        params.id = groupStore.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/groupStore/edit"
        assert model.groupStoreInstance != null

        groupStore.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/groupStore/show/$groupStore.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        groupStore.clearErrors()

        populateValidParams(params)
        params.id = groupStore.id
        params.version = -1
        controller.update()

        assert view == "/groupStore/edit"
        assert model.groupStoreInstance != null
        assert model.groupStoreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/groupStore/list'

        response.reset()

        populateValidParams(params)
        def groupStore = new GroupStore(params)

        assert groupStore.save() != null
        assert GroupStore.count() == 1

        params.id = groupStore.id

        controller.delete()

        assert GroupStore.count() == 0
        assert GroupStore.get(groupStore.id) == null
        assert response.redirectedUrl == '/groupStore/list'
    }
}
