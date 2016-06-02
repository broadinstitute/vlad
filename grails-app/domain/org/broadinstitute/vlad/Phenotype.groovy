package org.broadinstitute.vlad

class Phenotype {
    // instance variables
    Integer id
    String name
    String description

    static constraints = {
        description nullable: true
    }

    public String toString() {
        return name;
    }
}
