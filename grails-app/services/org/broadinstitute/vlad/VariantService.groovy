package org.broadinstitute.vlad

import grails.transaction.Transactional

@Transactional
class VariantService {

    @org.springframework.transaction.annotation.Transactional
    def saveVariantAssociation(String dbSnpId, String pheno, Float pValue, Integer pubMedId, String mappedGene) {
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
        variantPhenotypeAssociation.pValue = pValue;
        variantPhenotypeAssociation.pubMedId = pubMedId;
        variantPhenotypeAssociation.gene = mappedGene;
        variantPhenotypeAssociation.save(flush: true);
    }

    @org.springframework.transaction.annotation.Transactional
    def saveVariantLinkage(VariantLinkage variantLinkage) {
        // log
        log.info("saving linkage: " + variantLinkage.toString());

        variantLinkage.save(flush: true);
    }

    public List<VariantLinkageBean> getLinkageBeans() {
        // local variables
        List<VariantLinkageBean> beanList = new ArrayList<VariantLinkageBean>();

        // stub data for now
        beanList.add(new VariantLinkageBean("rs7626795", 0.71));
        beanList.add(new VariantLinkageBean("rs16892766", 0.54));
        beanList.add(new VariantLinkageBean("rs12779790", 0.89));
        beanList.add(new VariantLinkageBean("rs7961581", 0.32));
        beanList.add(new VariantLinkageBean("rs2180341", 0.67));

        return beanList;

    }

    public List<AssociationDisplayBean> getAssociationBeanList() {
        // local variables
        List<AssociationDisplayBean> beanList = new ArrayList<AssociationDisplayBean>();
        List<VariantLinkageBean> variantLinkageList = this.getLinkageBeans();

        // get the linkage list
        for (VariantLinkageBean bean : variantLinkageList) {
            AssociationDisplayBean
        }
        // for each, get the db variant information

        // return

    }
}
