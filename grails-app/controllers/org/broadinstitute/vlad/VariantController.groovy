package org.broadinstitute.vlad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VariantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Variant.list(params), model:[variantInstanceCount: Variant.count()]
    }

    def show(Variant variantInstance) {
        respond variantInstance
    }

    def create() {
        respond new Variant(params)
    }

    @Transactional
    def save(Variant variantInstance) {
        if (variantInstance == null) {
            notFound()
            return
        }

        if (variantInstance.hasErrors()) {
            respond variantInstance.errors, view:'create'
            return
        }

        variantInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'variant.label', default: 'Variant'), variantInstance.id])
                redirect variantInstance
            }
            '*' { respond variantInstance, [status: CREATED] }
        }
    }

    def edit(Variant variantInstance) {
        respond variantInstance
    }

    @Transactional
    def update(Variant variantInstance) {
        if (variantInstance == null) {
            notFound()
            return
        }

        if (variantInstance.hasErrors()) {
            respond variantInstance.errors, view:'edit'
            return
        }

        variantInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Variant.label', default: 'Variant'), variantInstance.id])
                redirect variantInstance
            }
            '*'{ respond variantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Variant variantInstance) {

        if (variantInstance == null) {
            notFound()
            return
        }

        variantInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Variant.label', default: 'Variant'), variantInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'variant.label', default: 'Variant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
