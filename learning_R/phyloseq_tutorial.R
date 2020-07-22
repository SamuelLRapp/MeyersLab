library("phyloseq")
packageVersion("phyloseq")
library(ggplot2)
packageVersion("ggplot2")
theme_set(theme_bw())

zipftp = "ftp://ftp.microbio.me/pub/restroom-data/study_1335_split_library_seqs_and_mapping.zip"
zipfile = "study_1335_split_library_seqs_and_mapping.zip"
download.file(zipftp, zipfile)
import_dir <- tempdir()
unzip(zipfile, exdir = import_dir)

biomfile = paste0(import_dir, "/study_1335_closed_reference_otu_table.biom")
biom = import_biom(biomfile, parseFunction = parse_taxonomy_greengenes)



sdfile = paste0(import_dir, "/study_1335_mapping_file.txt")
sample_metadata = import_qiime_sample_data(sdfile)
restroom = merge_phyloseq(biom, sample_metadata)
restroom #merged object of data biom and metadata

#functions called on object restroom
rank_names(restroom) #see taxonomic ranked available in phyloseq object
sample_variables(restroom) #see names of variables contained in phyloseq object

levels(sample_data(restroom)$BUILDING)
levels(sample_data(restroom)$SURFACE)

any(taxa_sums(restroom) == 0) #are there any#not super clear on what no processed reads for an OTU means...?
sum(taxa_sums(restroom) == 0) #how many

restroom0=restroom #having preprocessed copy of object
restroom = prune_taxa(taxa_sums(restroom)>0, restroom) #I guess it  just knows to iterate through the dataset because it is a prune fucntion

any(taxa_sums(restroom) == 0) #test that we pruned data correctly

readsumsdf = data.frame(nreads = sort(taxa_sums(restroom), TRUE), sorted = 1:ntaxa(restroom), 
                        type = "OTUs") #creating dataframe/structure from a object 'restroom'
readsumsdf = rbind(readsumsdf, data.frame(nreads = sort(sample_sums(restroom), 
                                                        TRUE), sorted = 1:nsamples(restroom), type = "Samples"))
title = "Total number of reads"
p = ggplot(readsumsdf, aes(x = sorted, y = nreads)) + geom_bar(stat = "identity")
p + ggtitle(title) + scale_y_log10() + facet_wrap(~type, 1, scales = "free")

restroom
restroom = prune_samples(sample_sums(restroom) > 500, restroom) #(variable(object) logical statement , object)
set.seed(4990)
restroomR= rarefy_even_depth(restroom, sample.size=500) #a way of normalizing different read lengths(not encouraged by creators of phyloseq)
restroomP = transform_sample_counts(restroom, function(x) 500 * x/sum(x))


par(mfrow=c(1,2))
title = "Sum of reads for each sample, restroomR"
plot(sort(sample_sums(restroomR), TRUE), type = "h", main = title, ylab = "reads", 
     ylim = c(0, 1000))
title = "Sum of reads for each sample, restroomP"
plot(sort(sample_sums(restroomP), TRUE), type = "h", main = title, ylab = "reads", 
     ylim = c(0, 1000))

top19otus = names(sort(taxa_sums(restroomR), TRUE)[1:19])


