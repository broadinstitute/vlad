package org.broadinstitute.vlad

class VariantLinkage {
    // instance variables
    Integer id
    String chromosomeReference
    Integer positionReference
    String dbSnpIdReference
    String chromosomeLink
    Integer positionLink
    String dbSnpIdLink
    Float rSquare
    Float dp

    public String toString() {
        return dbSnpIdReference + "-" + dbSnpIdLink;
    }

    static constraints = {
    }

    static mapping = {
//        table 'vlad_variant'
//        id 				column: 'variant_id'
//        dbSnpId			column: 'dn_snp_id'
//        chromosome			column: 'chromosome'
//        description		column: 'description'
//        position			column: 'position'
//        reference			column: 'chromosome'
//        alternate			column: 'alternate'
//        user 			column: 'user_id', fetch: 'join'
//        type 			column: 'account_type_id', fetch: 'join'
    }
}
