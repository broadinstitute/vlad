

select var.db_snp_id, pheno.name, association.pub_med_id, association.p_value
from variant var, phenotype pheno, variant_phenotype_association association
where association.variant_id = var.id
  and association.phenotype_id = pheno.id


select var_link.db_snp_id_reference as provided_snp, var_link.chromosome_reference as provided_chrom,
  var_link.r_square, var_link.dp,
  var.db_snp_id as pub_med_snp, pheno.name as pub_med_disease, association.pub_med_id, association.p_value
from variant var, phenotype pheno, variant_phenotype_association association, variant_linkage var_link
where association.variant_id = var.id
  and association.phenotype_id = pheno.id
  and instr(var.db_snp_id, var_link.db_snp_id_link) > 0
order by var_link.db_snp_id_reference, var.db_snp_id

