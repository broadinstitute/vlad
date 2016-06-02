package org.broadinstitute.vlad;

import junit.framework.TestCase;
import org.junit.Before;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by mduby on 6/2/16.
 */
public class GwasLoadUnitTest extends TestCase {

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void testSetup() {
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
        try {
            while ((line = reader.readLine()) != null) {
                if (count == 0) {
                    headerLine = line.split(delimiter);
                } else {

                    tempLine = line.split(delimiter);

                    // create hash from line
                    for (int i = 0; i < 10; i++) {
                        tempMap.put(headerLine[i], tempLine[i]);
                    }

                    // log

                    // insert
                    // find the variant
                    String dbSnpId = tempMap.get("SNPS");

                    // get the phenotype
                    String pheno = tempMap.get("DISEASE/TRAIT");

                    // create the association
                    Float pValue = Float.parseFloat(tempMap.get("P-VALUE"));

                }

                // increment
                count++;
            }
        } catch (IOException exception) {

        }
    }
}