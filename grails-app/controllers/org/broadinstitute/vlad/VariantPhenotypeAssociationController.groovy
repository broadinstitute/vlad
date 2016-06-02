package org.broadinstitute.vlad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VariantPhenotypeAssociationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        respond VariantPhenotypeAssociation.list(params), model:[variantPhenotypeAssociationInstanceCount: VariantPhenotypeAssociation.count()]
    }

    def show(VariantPhenotypeAssociation variantPhenotypeAssociationInstance) {
        respond variantPhenotypeAssociationInstance
    }

    def create() {
        respond new VariantPhenotypeAssociation(params)
    }

    @Transactional
    def save(VariantPhenotypeAssociation variantPhenotypeAssociationInstance) {
        if (variantPhenotypeAssociationInstance == null) {
            notFound()
            return
        }

        if (variantPhenotypeAssociationInstance.hasErrors()) {
            respond variantPhenotypeAssociationInstance.errors, view:'create'
            return
        }

        variantPhenotypeAssociationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'variantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation'), variantPhenotypeAssociationInstance.id])
                redirect variantPhenotypeAssociationInstance
            }
            '*' { respond variantPhenotypeAssociationInstance, [status: CREATED] }
        }
    }

    def edit(VariantPhenotypeAssociation variantPhenotypeAssociationInstance) {
        respond variantPhenotypeAssociationInstance
    }

    @Transactional
    def update(VariantPhenotypeAssociation variantPhenotypeAssociationInstance) {
        if (variantPhenotypeAssociationInstance == null) {
            notFound()
            return
        }

        if (variantPhenotypeAssociationInstance.hasErrors()) {
            respond variantPhenotypeAssociationInstance.errors, view:'edit'
            return
        }

        variantPhenotypeAssociationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VariantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation'), variantPhenotypeAssociationInstance.id])
                redirect variantPhenotypeAssociationInstance
            }
            '*'{ respond variantPhenotypeAssociationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VariantPhenotypeAssociation variantPhenotypeAssociationInstance) {

        if (variantPhenotypeAssociationInstance == null) {
            notFound()
            return
        }

        variantPhenotypeAssociationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VariantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation'), variantPhenotypeAssociationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'variantPhenotypeAssociation.label', default: 'VariantPhenotypeAssociation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
