package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

@TestFor(PosAssemblyLogController)
@Mock(PosAssemblyLog)
class PosAssemblyLogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/posAssemblyLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.posAssemblyLogInstanceList.size() == 0
        assert model.posAssemblyLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.posAssemblyLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.posAssemblyLogInstance != null
        assert view == '/posAssemblyLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/posAssemblyLog/show/1'
        assert controller.flash.message != null
        assert PosAssemblyLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/posAssemblyLog/list'

        populateValidParams(params)
        def posAssemblyLog = new PosAssemblyLog(params)

        assert posAssemblyLog.save() != null

        params.id = posAssemblyLog.id

        def model = controller.show()

        assert model.posAssemblyLogInstance == posAssemblyLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/posAssemblyLog/list'

        populateValidParams(params)
        def posAssemblyLog = new PosAssemblyLog(params)

        assert posAssemblyLog.save() != null

        params.id = posAssemblyLog.id

        def model = controller.edit()

        assert model.posAssemblyLogInstance == posAssemblyLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/posAssemblyLog/list'

        response.reset()

        populateValidParams(params)
        def posAssemblyLog = new PosAssemblyLog(params)

        assert posAssemblyLog.save() != null

        // test invalid parameters in update
        params.id = posAssemblyLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/posAssemblyLog/edit"
        assert model.posAssemblyLogInstance != null

        posAssemblyLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/posAssemblyLog/show/$posAssemblyLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        posAssemblyLog.clearErrors()

        populateValidParams(params)
        params.id = posAssemblyLog.id
        params.version = -1
        controller.update()

        assert view == "/posAssemblyLog/edit"
        assert model.posAssemblyLogInstance != null
        assert model.posAssemblyLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/posAssemblyLog/list'

        response.reset()

        populateValidParams(params)
        def posAssemblyLog = new PosAssemblyLog(params)

        assert posAssemblyLog.save() != null
        assert PosAssemblyLog.count() == 1

        params.id = posAssemblyLog.id

        controller.delete()

        assert PosAssemblyLog.count() == 0
        assert PosAssemblyLog.get(posAssemblyLog.id) == null
        assert response.redirectedUrl == '/posAssemblyLog/list'
    }
}
