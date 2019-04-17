#!/local/bin/perl

#Ouverture des fichier d'entréé, filename = sortie de blast
my $filename = $ARGV[0];
my $ATclassfile = $ARGV[1];
#Ouverture des fichiers de sortie
my $output = $filename . ".tov2.gff";
open(OUT, ">$output") || die "Could not create $output.\n";



open(IN, $filename) || die "Could not open $filename.\n";
open(DAT, $ATclassfile) || die "Could not open $filename.\n";
# utilisation des modules de perl et de bioperl, Bio::Searchio 
# est le module de traitement de sortie de blast


#neconnaissance du format d'entree

#Debut du code proprement dit


#Tant que on a une query, fait la suite du programme
    while( my $line = <IN>) {
	chop $line;
	($gchr1, $jigsawgaze, $exon, $gstart1, $gstop1, $rest, $rest2, $rest3, $rest4, $rest5) = split (/\t/, $line);
	seek (DAT, 0, 0);
	#chop $line;
	#print OUT "$gstart1\t";
		while ($ligne = <DAT>) {
		chop $ligne;
		($scaffold1, $schr1, $sstart1, $sstop1, $schr2, $sstart2, $sstop2, $senschange) = split (/\t/, $ligne);
			if($gchr1 eq $schr1){
			if($sstart1<$gstart1){
			if($gstart1<$sstop1){
			if($senschange eq 1){
			#print OUT "$gene\n";
			$tempstart = $gstart1-$sstart1+1;
			$tempstop = $gstop1-$sstart1+1;
			#print OUT "$tempstop\n";
			$finalstart = $tempstart+$sstart2-1;
			$finalstop = $sstart2+$tempstop-1;
						
						print OUT "$schr2\t";
						print OUT "$jigsawgaze\t";
						print OUT "$exon\t";
print OUT "$finalstart\t";
print OUT "$finalstop\t";
print OUT "$rest\t";
print OUT "$rest2\t";
print OUT "$rest3\t";
print OUT "$rest4\t";
print OUT "$rest5\n";
#print OUT "$schr1\n";
			}
			
		if($senschange eq 0){
			#print OUT "$gene\n";
			$tempstart = $sstop1-$gstop1+1;
			$tempstop = $sstop1-$gstart1+1;
			#print OUT "$tempstop\n";
			$finalstart = $tempstart+$sstart2-1;
			$finalstop = $sstart2+$tempstop-1;
						
						if($rest2 eq "+"){
			$rest2 = "-";
			}
			if($rest2 eq "-"){
			$rest2 = "+";
			}
						
						
						
						print OUT "$schr2\t";
						print OUT "$jigsawgaze\t";
						print OUT "$exon\t";
print OUT "$finalstart\t";
print OUT "$finalstop\t";
print OUT "$rest\t";
print OUT "$rest2\t";
print OUT "$rest3\t";
print OUT "$rest4\t";
print OUT "$rest5\n";
#print OUT "$schr1\n";
			}	
			
			}
			}

			}
					
	
}


#print OUT "\n";
}


