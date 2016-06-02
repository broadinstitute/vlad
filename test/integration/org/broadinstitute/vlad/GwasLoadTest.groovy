package org.broadinstitute.vlad

import junit.framework.TestCase
import org.junit.Before
import org.junit.Test

/**
 * Created by mduby on 6/2/16.
 */
public class GwasLoadTest extends TestCase {

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void testGwasLoad() {
        // get the load file
        InputStream gwasFileStream = this.getClass().getResourceAsStream("/resources/gwas_catalog2.csv");
        BufferedReader reader = new BufferedReader(new InputStreamReader(gwasFileStream));
        String[] headerLine = null;
        String[] tempLine = null;
        String line = null;
        String delimiter = ",";
        Integer count = 0;
        Map<String, String> tempMap = new HashMap<String, String>();

        // test
        assertNotNull(gwasFileStream);
        assertNotNull(reader);

        // parse
        while ((line = reader.readLine()) != null) {
            if (count == 0) {
                headerLine = line.split(delimiter);
                log.info("header line: " + headerLine)
            } else {

                tempLine = line.split(delimiter);
                log.info("data line: " + tempLine)

                // create hash from line
                for (int i = 0; i < 10; i++) {
                    tempMap.put(headerLine[i], tempLine[i]);
                }

                // log

                // insert
                // find the variant
                String dbSnpId = tempMap.get("SNPS")
                Variant variant = Variant.findByDbSnpId(dbSnpId)

                // if null, create
                if (variant == null) {
                    variant = new Variant();
                    variant.dbSnpId = dbSnpId
                    variant.save(flush: true)
                }

                // get the phenotype
                String pheno = tempMap.get("DISEASE/TRAIT")
                Phenotype phenotype = Phenotype.findByName(pheno)

                // if null, create
                if (phenotype != null) {
                    phenotype = new Phenotype();
                    phenotype.name = pheno;
                    phenotype.save(flush: true);
                }

                // create the association
                Float pValue = Float.parseFloat(tempMap.get("P-VALUE"))
                VariantPhenotypeAssociation variantPhenotypeAssociation = new VariantPhenotypeAssociation();
                variantPhenotypeAssociation.variant = variant;
                variantPhenotypeAssociation.phenotype = phenotype;
                variantPhenotypeAssociation.pValue = pValue
                variantPhenotypeAssociation.save(flush: true)

            }

            // increment
            count++;
        }
    }
}
