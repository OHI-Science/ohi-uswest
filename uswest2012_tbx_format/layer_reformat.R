library(dplyr)
library(tidyr)

dir_lyr = '~/github/ohi-uswest/uswest2012/layers'



for (l in list.files(dir_lyr)) {
  print(l)
  lyr = read.csv(l)
  # print(names(lyr))
  print(head(lyr))
}


# reformat certain layers

l_csv = 'ao_access_mi.csv'
l = read.csv(l_csv) %>% 
  dplyr::rename(sqmi = value) %>%
  select(-units); head(l)
write.csv(l, 
          file.path(dir_lyr, 
                    paste0(tools::file_path_sans_ext(l_csv), '_reformatted.csv')))