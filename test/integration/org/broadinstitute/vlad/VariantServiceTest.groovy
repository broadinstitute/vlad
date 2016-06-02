package org.broadinstitute.vlad
import org.junit.Test
/**
 * Created by mduby on 6/2/16.
 */
class VariantServiceTest {
    // instance variable
    VariantService variantService
    static transactional = false

    @Test
    public void testLoad() {
        // get the load file
        InputStream gwasFileStream = this.getClass().getResourceAsStream("/resources/gwas_catalog3.txt");
        BufferedReader reader = new BufferedReader(new InputStreamReader(gwasFileStream));
        String[] headerLine = null;
        String[] tempLine = null;
        String line = null;
        String delimiter = "\t";
        Integer count = 0;
        Map<String, String> tempMap = new HashMap<String, String>();

        // test
        assert (gwasFileStream != null);
        assert (reader != null);

        // parse
        while ((line = reader.readLine()) != null) {
            if (count == 0) {
                headerLine = line.split(delimiter);
//                log.info("header line: " + headerLine)
            } else {

                tempLine = line.split(delimiter);
//                log.info("data line: " + tempLine)

                // create hash from line
                for (int i = 0; i < headerLine.length; i++) {
                    tempMap.put(headerLine[i], tempLine[i]);
                }

                // log

                // insert
                // find the variant
                String dbSnpId = tempMap.get("SNPS")

                // get the phenotype
                String pheno = tempMap.get("DISEASE/TRAIT")

                // create the association
                Float pValue = Float.parseFloat(tempMap.get("P-VALUE"))

                // call the service
                variantService.saveVariantAssociation(dbSnpId, pheno, pValue)
            }

            // increment
            count++;

            if (count == 50) {
                break;
            }
        }

    }
}
