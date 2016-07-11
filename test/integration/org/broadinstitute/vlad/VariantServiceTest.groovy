package org.broadinstitute.vlad
import org.junit.Test

import java.util.logging.Logger

/**
 * Created by mduby on 6/2/16.
 */
class VariantServiceTest {
    // instance variable
    VariantService variantService
    static transactional = false
    Logger testLog = Logger.getLogger(this.getClass().getName());

    @Test
    public void testLoad() {
        // get the load file
        InputStream gwasFileStream = this.getClass().getResourceAsStream("/resources/gwas_catalog_modified.txt");
        BufferedReader reader = new BufferedReader(new InputStreamReader(gwasFileStream));
        String[] headerLine = null;
        String[] tempLine = null;
        String line = null;
        String delimiter = "\\t";
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
                for (int i = 0; i < tempLine.length; i++) {
//                    if (tempLine.size() >= i) {
                        tempMap.put(headerLine[i], tempLine[i]);
//                    }
                }

                // log

                // insert
                // find the variant
                String dbSnpId = tempMap.get("SNPS")
                if (dbSnpId == null) {
                    continue;
                }

                // get the phenotype
                String pheno = tempMap.get("DISEASE/TRAIT")
                if (pheno == null) {
                    continue;
                }

                // create the association
                Float pValue = Float.parseFloat(tempMap.get("P-VALUE"))

                // get the pub med id
                Integer pubMedId = Integer.valueOf(tempMap.get("PUBMEDID"))

                // get the mapped gene
                String gene = tempMap.get("MAPPED_GENE")

                // call the service
                variantService.saveVariantAssociation(dbSnpId, pheno, pValue, pubMedId, gene)
            }

            // increment
            count++;
            this.testLog.info("inserting row: " + count);

            /*
            if (count == 150) {
                break;
            }
            */
        }

    }
}
