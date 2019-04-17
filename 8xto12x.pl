#!/local/bin/perl

#Ouverture des fichier d'entréé, filename = sortie de blast
my $filename = $ARGV[0];
my $ATclassfile = $ARGV[1];
#Ouverture des fichiers de sortie
my $output = $filename . ".vviID.xml";
open(OUT, ">$output") || die "Could not create $output.\n";



open(IN, $filename) || die "Could not open $filename.\n";
open(DAT, $ATclassfile) || die "Could not open $filename.\n";
# utilisation des modules de perl et de bioperl, Bio::Searchio
# est le module de traitement de sortie de blast


#neconnaissance du format d'entree

#Debut du code proprement dit


#Tant que on a une query, fait la suite du programme
    while( my $line = <IN>) {
	seek (DAT, 0, 0);
#print "$d\n";
if($line =~ "name" || $line =~ "specie"){
	while ($ligne = <DAT>) {
	chop $ligne;
	($a, $b) = split (/\t/, $ligne);
	$line =~ s/$a/$b/g;
	}
	}
	print OUT "$line";
	
	}