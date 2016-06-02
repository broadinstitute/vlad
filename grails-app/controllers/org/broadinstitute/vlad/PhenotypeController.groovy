package org.broadinstitute.vlad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PhenotypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Phenotype.list(params), model:[phenotypeInstanceCount: Phenotype.count()]
    }

    def show(Phenotype phenotypeInstance) {
        respond phenotypeInstance
    }

    def create() {
        respond new Phenotype(params)
    }

    @Transactional
    def save(Phenotype phenotypeInstance) {
        if (phenotypeInstance == null) {
            notFound()
            return
        }

        if (phenotypeInstance.hasErrors()) {
            respond phenotypeInstance.errors, view:'create'
            return
        }

        phenotypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'phenotype.label', default: 'Phenotype'), phenotypeInstance.id])
                redirect phenotypeInstance
            }
            '*' { respond phenotypeInstance, [status: CREATED] }
        }
    }

    def edit(Phenotype phenotypeInstance) {
        respond phenotypeInstance
    }

    @Transactional
    def update(Phenotype phenotypeInstance) {
        if (phenotypeInstance == null) {
            notFound()
            return
        }

        if (phenotypeInstance.hasErrors()) {
            respond phenotypeInstance.errors, view:'edit'
            return
        }

        phenotypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Phenotype.label', default: 'Phenotype'), phenotypeInstance.id])
                redirect phenotypeInstance
            }
            '*'{ respond phenotypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Phenotype phenotypeInstance) {

        if (phenotypeInstance == null) {
            notFound()
            return
        }

        phenotypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Phenotype.label', default: 'Phenotype'), phenotypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'phenotype.label', default: 'Phenotype'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
