library(RPostgreSQL)
library(reshape2)
library(plyr)
library(stringr)
library(dplyr)


# working directory
source('../ohiprep/src/R/common.R') # get dir_neptune_data

dir.create('layers', showWarnings=F)

# connect to postgres db
dbi.pg = dbDriver('PostgreSQL') 
pg = dbConnect(dbi.pg, host='neptune.nceas.ucsb.edu', dbname='ohi_cc2012', user='bbest') # assumes password in ~/.pgpass
#dbSendQuery(pg, 'SET search_path TO global_li, global; SET ROLE TO ohi;')

# conf: goal weights, derived pressures & resilience in long form
dir.create('conf', showWarnings=F)
dir_data = file.path(dir_neptune_local, 'src/model/california-current/data')
for (f in c('cc_pressures.csv','cc_resilience.csv','goal_weights.csv')){
  file.copy(
    file.path(dir_data, f),
    file.path('conf', str_replace(f, fixed('cc_'),'')))
}

# conf: derived scores of different scenarios
dir.create('scores', showWarnings=F)
dir_doc = file.path(dir_neptune_local, 'src/model/california-current/doc')
files = c(
  'scores_index.csv'='results_cc_scores.csv', 'scores_dimension.csv'='results_cc_data.csv',
  setNames(
    sprintf('results_cc_scores_scenario%s.csv', c('1','2','3a','3b','3c')), 
    sprintf('scores_index_scenario%s.csv', c('1','2','3a','3b','3c'))),
  setNames(
    sprintf('results_cc_data_scenario%s.csv'       , c('1','2','3a','3b','3c')), 
    sprintf('scores_dimension_scenario%s.csv', c('1','2','3a','3b','3c'))))
for (i in 1:length(files)){ # i=1
  #print(f)
  #print(head(read.csv(file.path(dir_doc, f))))
  f_from = files[[i]]
  f_to   = names(files)[[i]]
  file.copy(
     file.path(dir_doc, f_from),
     file.path('scores', f_to))
}
    
# regions layers
for (f in c('cc_regions.csv','cc_regions_area.csv','cc_regions_counties.csv')){
  file.copy(
    file.path(dir_data, f),
    file.path('layers', str_replace(f, fixed('cc_'),'')))
}

# regions spatial
dir.create('spatial', showWarnings=F)
dir_regions = file.path(dir_neptune_local, 'src/model/california-current/data/regions')
for (f in list.files(dir_regions)){
  file.copy(
    file.path(dir_regions, f),
    file.path('spatial', f))
}

# AO
load(file.path(dir_neptune_data, 'model/CC-NCEAS-ArtisanalOpportunity/data/cc_ao_data.RData'))
for (v in names(cc_ao_data)){ # v = names(cc_ao_data)[1]
  csv = sprintf('layers/ao_%s.csv', str_replace(v, fixed('.'),'_'))
  write.csv(cc_ao_data[[v]], csv, na='', row.names=F)
}

# HAB, CP
load(file.path(dir_neptune_data, 'model/CC-NCEAS-Habitats/data/cc_habitat_model.RData'))
write.csv(cc_habitat_model, 'layers/hab_metrics.csv', na='', row.names=F)

# CW
file.copy(
  file.path(dir_neptune_data, 'model/CC-NCEAS-CW/data/cc_cw_data.csv'),
  'layers/cw_data.csv')

# FIS
file.copy(
  file.path(dir_neptune_data, 'stable/CC-NCEAS-FP/data/cc_fis_data.csv'),
  'layers/fis_data.csv')

# MAR
cat('loading MAR harvest...\n')
file.copy(
  file.path(dir_neptune_data, 'stable/CC-NCEAS-FP/data/Dumbauld_etal_2009_farmable_bay_area.csv'),
  'layers/mar_farmable_area.csv')
load(file.path(dir_neptune_data, 'stable/CC-NCEAS-FP/data/cc_mar_data.RData'))
paste(names(cc_mar_data), collapse="','") # 'area','species','regions','tonnes','sustainability'
write.csv(cc_mar_data[['area']]          , 'layers/mar_area.csv', na='', row.names=F)
write.csv(cc_mar_data[['tonnes']]        , 'layers/mar_tonnes.csv', na='', row.names=F)
d = cc_mar_data[['sustainability']]
write.csv(
  data.frame(
    species=names(d), 
    sustainability=d), 
  'layers/mar_sustainability.csv', na='', row.names=F)
