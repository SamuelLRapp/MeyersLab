install.packages("BiocManager")
#trouble shooting:https://stackoverflow.com/questions/32785284/error-in-loadnamespacename-there-is-no-package-called-evaluate

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install() 
#getting the package down manager https://bioconductor.org/install/

BiocManager::install(c("phyloseq")) #getting the package.

library("phyloseq")
packageVersion("phyloseq")

## [1] '1.5.8'(Is this the output from when the guide ran the program?)

library("ggplot2")
packageVersion("ggplot2")
## [1] '0.9.3.1' 

theme_set(theme_bw())
a

zipftp = "ftp://ftp.microbio.me/pub/restroom-data/study_1335_split_library_seqs_and_mapping.zip" #File Transfer Protocol url used to transfer files
zipfile = "study_1335_split_library_seqs_and_mapping.zip" #the zip file
download.file(zipftp, zipfile)
import_dir <- tempdir() #creating temporary directory import_dir' variable in R studio
unzip(zipfile, exdir = import_dir) #assign exdir the unziped content

biomfile = paste0(import_dir, "/study_1335_closed_reference_otu_table.biom")
biom = import_biom(biomfile, parseFunction = parse_taxonomy_greengenes)
sdfile = paste0(import_dir, "/study_1335_mapping_file.txt")
sample_metadata = import_qiime_sample_data(sdfile)

restroom = merge_phyloseq(biom, sample_metadata)
restroom

