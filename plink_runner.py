import os
import argparse
import flask
import random
from flask import Flask


def run_plink(rsid, ld_window_kb, ld_window_r2, chrom='8'):
    """Runs plink on the SNP with the given rsid.
    
    Args:
        rsid: SNP rsid
        ld_window_kb: (integer) window in kilobases
        ld_window_r2: (float) ld threshold
    """

    salt = random.randint(10**9, 10**10-1)
    output_filename = "temp%s.out" % salt
    os.system("/home/unix/sripke/plink_src/plink_1.9_newest/plink --bfile /humgen/atgu1/fs03/weisburd/1kg/ALL_chr%(chrom)s --r2 dprime --ld-snp %(rsid)s --ld-window-kb %(ld_window_kb)s --ld-window-r2 %(ld_window_r2)s --ld-window 99999 --out %(output_filename)s" % locals())
    
    results = []
    with open(output_filename+".ld") as f: 
        header = f.next()
        header = header.strip().split()
    
        for line in f:
            fields = line.strip().split()
            results.append( dict(zip(header, fields)) )
    os.remove(output_filename+".ld")
    os.remove(output_filename+".log")
    return results


# flask endpoints
app = Flask(__name__)

@app.route('/plink/<rsid>/window/<int:ld_window_kb>/r2/<float:ld_window_r2>/chr/<chrom>')
def plink(rsid, ld_window_kb, ld_window_r2, chromsome):
    result = run_plink(rsid, ld_window_kb, ld_window_r2)
    return flask.jsonify(result=result)


app.run(host="0.0.0.0", port=8090)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--rsid", default="rs13266634")
    p.add_argument("-w", "--ld-window-kb", default=1000)
    p.add_argument("-t", "--ld-window-r2", default=0.6)
    options = p.parse_args()
    #print(run_plink(options.rsid, options.ld_window_kb, options.ld_window_r2))



"""Example output:

CHR_A         BP_A                            SNP_A  CHR_B         BP_B                            SNP_B           R2           DP
     8    118184783                       rs13266634      8    118184783                       rs13266634            1            1
     8    118184783                       rs13266634      8    118185025                        rs3802177     0.992674     0.998947
     8    118184783                       rs13266634      8    118185733                       rs11558471     0.971111     0.997875
     8    118184783                       rs13266634      8    118191475                       rs35859536     0.982287     0.996831
     8    118184783                       rs13266634      8    118204020                        rs9650069     0.936597     0.986086
     8    118184783                       rs13266634      8    118209284                      rs185166635      0.90904     0.979491
     8    118184783                       rs13266634      8    118217915                        rs4300038     0.903824     0.990182
     8    118184783                       rs13266634      8    118220270                       rs11774700     0.817004     0.943803
     8    118184783                       rs13266634      8    118225198                        rs4350011     0.620814     0.943137

"""
