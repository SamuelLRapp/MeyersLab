library(rglobi)

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


#can make a variable that counts number of interactions
#what else do we want? 
#summary stats: Number of each type of interaction, 
#most interactive organisms!(back to adundance congregators): make an array that holds each species and the number of interactions it has. Use order function to investigate top functions
#number of interactions by group eDNA vs eDNA, iNat vs iNat. eDNA vs iNat, and broken down by interaction type...
#how can I store them as a network?

#to do this project I need to learn how to
#1. import a csv, and create a data.frame
#2. read a data.frame
#3. create a fucntion
#3. write a for loop
#4. make sense of the data in the function 

# get_interactions_by_taxa()
#get_interaction_matrix() might be a better way to run with lists
#there are also geographic lists functions, but I think we would handle all that data entry

#pseudo code: running through a list of species
#list of  spp list = species in LA river [] = CSV list...
#for loop spp list index x-n()
#compare species x to species x-n from spp list
# create seperate species list for
#  if Globi doesn't contain  a spp in in the list
#  if Globi doesn't 