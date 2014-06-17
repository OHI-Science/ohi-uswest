library(reshape2)
library(plyr)
library(stringr)
library(dplyr)
library(gdata)

# get machine paths
source('../ohiprep/src/R/common.R') # get dir_neptune_data

# create directories
for (dir in c('conf','layers','scores','spatial')) dir.create(dir, showWarnings=F)

# connect to postgres db: not used yet
#library(RPostgreSQL)
#dbi.pg = dbDriver('PostgreSQL') 
#pg = dbConnect(dbi.pg, host='neptune.nceas.ucsb.edu', dbname='ohi_cc2012', user='bbest') # assumes password in ~/.pgpass
#dbSendQuery(pg, 'SET search_path TO global_li, global; SET ROLE TO ohi;')

# conf: goal weights
for (f in c('goal_weights.csv')){
  file.copy(
    file.path(dir_neptune_local, 'src/model/california-current/data', f),
    file.path('conf', str_replace(f, fixed('cc_'),'')))
}

# derived pressures & resilience in long form
for (f in c('cc_pressures.csv','cc_resilience.csv')){
  file.copy(
    file.path(dir_neptune_local, 'src/model/california-current/data', f),
    file.path('layers', str_replace(f, fixed('cc_'),'')))
}

# scores
files = c(
  'scores_index.csv'='results_cc_scores.csv', 'scores_dimension.csv'='results_cc_data.csv',
  setNames(
    sprintf('results_cc_scores_scenario%s.csv', c('1','2','3a','3b','3c')), 
    sprintf('scores_index_scenario%s.csv', c('1','2','3a','3b','3c'))),
  setNames(
    sprintf('results_cc_data_scenario%s.csv'       , c('1','2','3a','3b','3c')), 
    sprintf('scores_dimension_scenario%s.csv', c('1','2','3a','3b','3c'))))
for (i in 1:length(files)){ # i=1
  f_from = files[[i]]
  f_to   = names(files)[[i]]
  file.copy(
     file.path(dir_neptune_local, 'src/model/california-current/doc', f_from),
     file.path('scores', f_to))
}
    
# regions layers
for (f in c('cc_regions.csv','cc_regions_area.csv','cc_regions_counties.csv')){
  file.copy(
    file.path(dir_neptune_local, 'src/model/california-current/data', f),
    file.path('layers', str_replace(f, fixed('cc_'),'')))
}

# regions spatial
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

# HAB, CP, CS
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

# ICO
load(file.path(dir_neptune_local, 'src/model/california-current/ICO/data/ico_data.RData'))
write.csv(melt(ico_data), 'layers/ico_species.csv', row.names=F, na='')

# LE
load(file.path(dir_neptune_local, 'src/model/california-current/LE/status/data/cc_le_status_model_data.Rdata'))
write.csv(melt(cc_le_status_model_data[['data']]), 'layers/le_data.csv', row.names=F, na='')
write.csv(melt(cc_le_status_model_data[['adjustments']]), 'layers/le_adjustments.csv', row.names=F, na='')
d = melt(cc_le_status_model_data[['le.counties']])
names(d) = c('county','region')
write.csv(d, 'layers/le_counties.csv', row.names=F, na='')
load(file.path(dir_neptune_local, 'src/model/california-current/LE/trend/data/cc_le_trend_model_data.Rdata'))
write.csv(
  rename(melt(cc_le_trend_model_data[['weights']]), c('L1'='metric')), 
  'layers/le_weights.csv', row.names=F, na='')

# LSP
file.copy(
  file.path(dir_neptune_data, 'model/CC-NCEAS-LSP/data/lsp_model_data.csv'),
  'layers/lsp_data.csv')

# SPP
file.copy(
  file.path(dir_neptune_data, 'model/CC-NCEAS-Species/data/cc_spp_results.csv'),
  'layers/spp_data.csv')

# TR
load(file.path(dir_neptune_data, 'model/CC-NCEAS-TR/data/tr_results.RData'))
write.csv(
  tr_results[['prediction']],
  'layers/tr_data.csv', row.names=F, na='')