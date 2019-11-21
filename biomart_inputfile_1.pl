
# An example script demonstrating the use of BioMart API.
# This perl API representation is only available for configuration versions >=  0.5 
use strict;
use BioMart::Initializer;
use BioMart::Query;
use BioMart::QueryRunner;

my $confFile = "./biomart-perl/conf/martURLLocation.xml";
#
# NB: change action to 'clean' if you wish to start a fresh configuration  
# and to 'cached' if you want to skip configuration step on subsequent runs from the same registry
#

my $action='clean';
my $initializer = BioMart::Initializer->new('registryFile'=>$confFile, 'action'=>$action);
my $registry = $initializer->getRegistry;

my $query = BioMart::Query->new('registry'=>$registry,'virtualSchemaName'=>'default');

		
	$query->setDataset("hsapiens_gene_ensembl");
	$query->addAttribute("ensembl_gene_id");
	$query->addAttribute("ensembl_transcript_id");
	$query->addAttribute("ensembl_peptide_id");
	$query->addAttribute("ensembl_exon_id");
	$query->addAttribute("external_gene_name");
	$query->addAttribute("description");
	$query->addAttribute("external_transcript_name");
	$query->addAttribute("chromosome_name");
	$query->addAttribute("start_position");
	$query->addAttribute("end_position");
	$query->addAttribute("strand");
	$query->addAttribute("transcript_start");
	$query->addAttribute("transcript_end");
	$query->addAttribute("gene_biotype");

$query->formatter("TSV");

my $query_runner = BioMart::QueryRunner->new();
############################## GET COUNT ############################
# $query->count(1);
# $query_runner->execute($query);
# print $query_runner->getCount();
#####################################################################


############################## GET RESULTS ##########################
# to obtain unique rows only
# $query_runner->uniqueRowsOnly(1);

$query_runner->execute($query);
$query_runner->printHeader();
$query_runner->printResults();
$query_runner->printFooter();
#####################################################################
