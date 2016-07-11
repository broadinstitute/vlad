package org.broadinstitute.vlad;

/**
 * Bean class to be used to store read in pub med data
 *
 * Created by mduby on 7/10/16.
 */
public class VariantPhenotypeBean {
    // instance variables
    private int publicationId;
    private String disease;
    private String mappedGene;
    private String dbSnpId;
    private float pValue;

    public int getPublicationId() {
        return publicationId;
    }

    public void setPublicationId(int publicationId) {
        this.publicationId = publicationId;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getMappedGene() {
        return mappedGene;
    }

    public void setMappedGene(String mappedGene) {
        this.mappedGene = mappedGene;
    }

    public String getDbSnpId() {
        return dbSnpId;
    }

    public void setDbSnpId(String dbSnpId) {
        this.dbSnpId = dbSnpId;
    }

    public float getpValue() {
        return pValue;
    }

    public void setpValue(float pValue) {
        this.pValue = pValue;
    }
}
