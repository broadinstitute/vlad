package org.broadinstitute.vlad

class VariantPhenotypeAssociation {
    // instance variables
    Integer id
    Variant variant
    Phenotype phenotype
    Float pValue
    Integer pubMedId
    String study
    String webLink
    String gene
    String context

    static constraints = {
        pubMedId nullable: true
        study nullable: true
        webLink nullable: true
        gene nullable: true
        context nullable: true
    }
}
