package org.broadinstitute.vlad

import org.junit.Test

import java.util.logging.Logger

import static org.junit.Assert.fail

/**
 * Created by mduby on 7/10/16.
 */
class VariantLinkagesLoadTest {
    // instance variable
    VariantService variantService
    static transactional = false
    Logger testLog = Logger.getLogger(this.getClass().getName());

    @Test
    public void testLoad() {
        // get the load file
        InputStream gwasFileStream = this.getClass().getResourceAsStream("/resources/resultsLinkages3.txt");
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
        try {
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

                    VariantLinkage variantLinkage = new VariantLinkage();
                    variantLinkage.chromosomeReference = tempMap.get("CHR_A");
                    variantLinkage.positionReference = Integer.valueOf(tempMap.get("BP_A"));
                    variantLinkage.dbSnpIdReference = tempMap.get("SNP_A");
                    variantLinkage.chromosomeLink = tempMap.get("CHR_B");
                    variantLinkage.positionLink = Integer.valueOf(tempMap.get("BP_B"));
                    variantLinkage.dbSnpIdLink = tempMap.get("SNP_B");
                    variantLinkage.rSquare = Float.parseFloat(tempMap.get("R2"));
                    variantLinkage.dp = Float.parseFloat(tempMap.get("DP"));

                    // call the service
                    variantService.saveVariantLinkage(variantLinkage)
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

        } catch (IOException exception) {
            fail("got IO exception" + exception.getMessage());
        }
    }

}
