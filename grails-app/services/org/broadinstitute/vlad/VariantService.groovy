package org.broadinstitute.vlad

import grails.transaction.Transactional

@Transactional
class VariantService {

    @Transactional
    def saveVariantAssociation(String dbSnpId, String pheno, Float pValue) {
        // local variables
        log.info("saving association: " + dbSnpId + " - " + pheno + ": " + pValue);

        Variant variant = Variant.findByDbSnpId(dbSnpId)

        // if null, create
        if (variant == null) {
            variant = new Variant();
            variant.dbSnpId = dbSnpId
            variant.save(flush: true)
        }


        Phenotype phenotype = Phenotype.findByName(pheno)

        // if null, create
        if (phenotype == null) {
            phenotype = new Phenotype();
            phenotype.name = pheno;
            phenotype.save(flush: true);
        }

        VariantPhenotypeAssociation variantPhenotypeAssociation = new VariantPhenotypeAssociation();
        variantPhenotypeAssociation.variant = variant;
        variantPhenotypeAssociation.phenotype = phenotype;
        variantPhenotypeAssociation.pValue = pValue
        variantPhenotypeAssociation.save(flush: true)
    }
}
