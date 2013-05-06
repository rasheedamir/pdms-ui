package com.mm.pdms



import org.junit.*
import grails.test.mixin.*

@TestFor(PosCallLogController)
@Mock(PosCallLog)
class PosCallLogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/posCallLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.posCallLogInstanceList.size() == 0
        assert model.posCallLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.posCallLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.posCallLogInstance != null
        assert view == '/posCallLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/posCallLog/show/1'
        assert controller.flash.message != null
        assert PosCallLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/posCallLog/list'

        populateValidParams(params)
        def posCallLog = new PosCallLog(params)

        assert posCallLog.save() != null

        params.id = posCallLog.id

        def model = controller.show()

        assert model.posCallLogInstance == posCallLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/posCallLog/list'

        populateValidParams(params)
        def posCallLog = new PosCallLog(params)

        assert posCallLog.save() != null

        params.id = posCallLog.id

        def model = controller.edit()

        assert model.posCallLogInstance == posCallLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/posCallLog/list'

        response.reset()

        populateValidParams(params)
        def posCallLog = new PosCallLog(params)

        assert posCallLog.save() != null

        // test invalid parameters in update
        params.id = posCallLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/posCallLog/edit"
        assert model.posCallLogInstance != null

        posCallLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/posCallLog/show/$posCallLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        posCallLog.clearErrors()

        populateValidParams(params)
        params.id = posCallLog.id
        params.version = -1
        controller.update()

        assert view == "/posCallLog/edit"
        assert model.posCallLogInstance != null
        assert model.posCallLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/posCallLog/list'

        response.reset()

        populateValidParams(params)
        def posCallLog = new PosCallLog(params)

        assert posCallLog.save() != null
        assert PosCallLog.count() == 1

        params.id = posCallLog.id

        controller.delete()

        assert PosCallLog.count() == 0
        assert PosCallLog.get(posCallLog.id) == null
        assert response.redirectedUrl == '/posCallLog/list'
    }
}
