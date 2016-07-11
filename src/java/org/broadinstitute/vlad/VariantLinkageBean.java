package org.broadinstitute.vlad;

/**
 * Created by mduby on 6/2/16.
 */
public class VariantLinkageBean {
    // instance variables
    private String dbSnpId;
    private Float ldValue;

    public VariantLinkageBean(String snpId, Float ld) {
        this.dbSnpId = snpId;
        this.ldValue = ld;
    }

    public String getDbSnpId() {
        return dbSnpId;
    }

    public void setDbSnpId(String dbSnpId) {
        this.dbSnpId = dbSnpId;
    }

    public Float getLdValue() {
        return ldValue;
    }

    public void setLdValue(Float ldValue) {
        this.ldValue = ldValue;
    }
}
