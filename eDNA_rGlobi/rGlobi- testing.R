#create code for interactions of species found in eDNA list
#could also be done for species documented by Naturalist
#could also do them combined or across? 
#https://cran.r-project.org/web/packages/rglobi/index.html
#https://cran.r-project.org/web/packages/rglobi/rglobi.pdf
 
install.packages("dplyr")
install.packages("rglobi")
library(rglobi)
prey_of("Homo sapiens")$target_taxon_name

get_interactions_by_taxa("Pisaster ochraceus")

family_genus_spp<-get_interactions_by_taxa("Asteriidae Pisaster ochraceus", "Mytilus californianus",showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))
family_genus_spp
genus_spp<-get_interactions_by_taxa("Pisaster ochraceus", "Mytilus californianus", showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))
genus_spp

get_interactions_by_taxa("Pisaster ochraceus", "Mytilus californianusss")
get_interactions_by_taxa("Pisaster ochraceus", "nucella canaliculata")
get_interaction_types()
get_interaction_matrix("Homo sapiens", "Mammalia", "interactsWith")

y<-list("Forcipulatida Pisaster ochraceus","Strongylocentrotus purpuratus")
x<-list("Larus occidentalis","Tegula funebralis","Mytilus californianus")
get_interactions_by_taxa(x,y, showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))
w<-get_interactions_by_taxa(y[[1]],x[[3]], showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))
none<-get_interactions_by_taxa(y[[2]],x[[3]], showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))
q<-get_interaction_matrix(x, y)#interaction.type = "eats"
q
none
w



)
filter(none)

str

nrow(none)
do_they_interact(none)
do_they_interact(w)

colnames(w)
head(w)

do_they_interact <-  function(rGlobiResult)
{
 NUMBER_OF_INTERACTIONS <- nrow(rGlobiResult)
 if(NUMBER_OF_INTERACTIONS<1)
   {
   OUTPUT <- FALSE
   }
    else {
    OUTPUT <- TRUE
    }
 return(OUTPUT)
}


opts()
get_interaction_table(source.taxon.names = list("Aves"), target.taxon.names = list('Insecta'), "eats")
t<-get_interaction_table(x,y)
t
get_child_taxa("Strongylocentrotus", rank ="species")
get_data_fields()

get_interactions_by_taxa("Pisaster ochraceus", "Mytilus californianus", showfield = c("source_taxon_name", "interaction_type", "target_taxon_name"))


#taxon_name,  target_taxon_name,  source_taxon_name, number_of_interactions
