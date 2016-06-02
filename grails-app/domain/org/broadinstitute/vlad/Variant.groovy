package org.broadinstitute.vlad

class Variant {
    // instance variables
    Integer id
    String dbSnpId
    String chromosome
    Integer position
    String reference
    String alternate
    String description

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
