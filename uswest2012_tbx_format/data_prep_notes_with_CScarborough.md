> for (l in list.files(dir_lyr)) {
+   print(l)
+   lyr = read.csv(l)
+   # print(names(lyr))
+   print(head(lyr))
+ }
[1] "ao_access_e.csv"
  region_code year      value
1          CA 2003 0.08642614
2          OR 2003 0.08560333
3          WA 2003 0.01739213
4          CA 2004 0.18836721
5          OR 2004 0.21602290
6          WA 2004 0.13295238
[1] "ao_access_mi.csv":::: we want every mile of coastline to have an access point. So this is how many miles fall within 1 mile of an access pot
miles of access/miles of coastline. Report all but coastal area; see ao_coastline_area.csv
  region_code access.value coastal.value units     value
1         CA1          156           411  sqmi 0.3795620
2         CA2          361           701  sqmi 0.5149786
3         CA3          384           799  sqmi 0.4806008
4          WA          279          2395  sqmi 0.1164927
5          OR          346           569  sqmi 0.6080844
6          CA          901          1911  sqmi 0.4714809
[1] "ao_access_pub.csv"::::area that's owned/managed for the public
  region_code public.value coastal.value units     value
1         CA1     112.3399      481.9631  sqmi 0.2330881
2         CA2     270.3096      861.9101  sqmi 0.3136170
3         CA3     307.8712      655.9560  sqmi 0.4693474
4          WA    1451.0882     5934.5284    km 0.2445162
5          OR    2507.8830     2507.8830    km 1.0000000
[1] "ao_coastline_area.csv" redundant to 2 above; use this one above
  region_code     value units     metric
1         CA1  411.0000  sqmi  1mi_strip
2         CA2  701.0000  sqmi  1mi_strip
3         CA3  799.0000  sqmi  1mi_strip
4          OR  569.0000  sqmi  1mi_strip
5          WA 2395.0000  sqmi  1mi_strip
6         CA1  481.9631  sqmi 1mi_inland
[1] "ao_coastline_length.csv":: just delete metric column
  region_code    value units metric
1         CA1 1186.267    km  hires
2         CA2 2350.640    km  hires
3         CA3 1697.063    km  hires
4          OR 2507.883    km  hires
5          WA 5934.528    km  hires
[1] "ao_fssi.csv"
  region_code year     value
1          OR 2006 0.8087809
2          WA 2006 0.6608004
3         CA1 2006 0.5675031
4         CA2 2006 0.5675031
5         CA3 2006 0.5675031
6          OR 2007 0.8964627
[1] "cw_data.csv"
  region_code    metric year     value
1         CA1 chemicals 1986 0.6200000
2         CA1 chemicals 1987 0.6900000
3         CA1 chemicals 1988 0.6994949
4         CA1 chemicals 1989 0.6698232
5         CA1 chemicals 1990 0.7209596
6         CA1 chemicals 1991 0.6590909
[1] "fis_data.csv"
  region_code year                       species value
1         CA1 2006 JACK MACKEREL - PACIFIC COAST   1.5
2         CA2 2006 JACK MACKEREL - PACIFIC COAST   1.5
3         CA3 2006 JACK MACKEREL - PACIFIC COAST   1.5
4          OR 2006 JACK MACKEREL - PACIFIC COAST   1.5
5          WA 2006 JACK MACKEREL - PACIFIC COAST   1.5
6         CA1 2007 JACK MACKEREL - PACIFIC COAST   1.5
[1] "hab_metrics.csv"::: 3 separate .csv files for extent, status, trend
  region_code  habitat metric    value
1         CA1    dunes extent 104.1406
2         CA2    dunes extent 121.1727
3         CA3    dunes extent 101.2628
4          OR    dunes extent 281.6098
5          WA    dunes extent 133.1642
6         CA1 seagrass extent  37.5201
[1] "ico_species.csv"
  region_code variable                              species value
1         CA1   status BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.4
2         CA2   status BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.4
3         CA3   status BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.4
4          OR   status BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.8
5          WA   status BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.8
6         CA1    trend BALD EAGLE: HALIAEETUS LEUCOCEPHALUS   0.0
[1] "le_adjustments.csv"
  region_code metric year    value
1          CA   jobs 2000 19466162
2          OR   jobs 2000  2094825
3          WA   jobs 2000  3522932
4         CA1   jobs 2000 19466162
5         CA2   jobs 2000 19466162
6         CA3   jobs 2000 19466162
[1] "le_counties.csv"
     county region
1         *     OR
2         *     WA
3 DEL NORTE    CA1
4  HUMBOLDT    CA1
5 MENDOCINO    CA1
6    SONOMA    CA1
[1] "le_data.csv"::: separate files for jobs/revenue/etc
  region_code sector_code metric county year value
1         CA1          CO   jobs      * 2000    NA
2         CA2          CO   jobs      * 2000    NA
3         CA3          CO   jobs      * 2000    NA
4          OR          CO   jobs      * 2000    NA
5          WA          CO   jobs      * 2000  2641
6         CA1          LI   jobs      * 2000    NA
[1] "le_weights.csv"::: separate files for jobs/rev/etc
  region_code sector_code     value metric
1         CA1          CO  167.4411   jobs
2         CA2          CO 4304.5530   jobs
3         CA3          CO 7218.7806   jobs
4          OR          CO 2062.3575   jobs
5          WA          CO 4930.7315   jobs
6         CA1          LI  255.8081   jobs
[1] "lsp_data.csv"::: separate .csvs by column
  region_code    status        trend mpa_offshoreEEZ_score
1         CA1 0.3714360 1.087272e-02          1.768523e-03
2         CA2 0.4055130 7.994129e-03          6.083516e-03
3         CA3 0.4505581 7.911017e-03          1.306225e-02
4          OR 0.2407439 1.191616e-15          8.630649e-05
5          WA 0.2668463 0.000000e+00          6.862763e-04
[1] "mar_area.csv":::: NOT USED, DELETE, repeat CA values for CA1,2,3
  region_code               category         km2
1          CA               approved  0.03330549
2          CA conditionally-approved 50.51329148
3          CA             restricted  6.53486913
4          CA           unclassified  3.86240269
5          OR               approved 39.97691007
6          OR conditionally-approved 64.25905842
[1] "mar_farmable_area.csv":: separate by CA
  state farmable_bay_hectares
1    WA                 63770
2    CA                 10470
3    OR                 11980
[1] "mar_sustainability.csv"
  species sustainability
1   clams       9.000000
2 mussels       8.000000
3 oysters       9.333333
[1] "mar_tonnes.csv"::::: gather into columns, sep by CA1,2,3
  region_code year       clams   mussels   oysters
1          CA 2005    6.350292  272.1554  4535.923
2          CA 2008  336.321902  142.8816  4205.252
3          OR 2005          NA        NA  2853.096
4          OR 2008          NA        NA  1079.544
5          WA 2005 3855.534484  952.5438 34926.606
6          WA 2008 4318.198622 1247.3788 27669.130
[1] "pressures.csv": separate by goal into csvs from cumulative impacts CC
  goal region_code     value
1   AO         CA1 0.2788022
2   AO         CA2 0.2428306
3   AO         CA3 0.2486457
4   AO          OR 0.3532456
5   AO          WA 0.2549523
6   BD         CA1 0.3159633
[1] "regions_area.csv": sep into diff .csvs
  region_code    km2             metric
1         CA1 196982 offshore_200nmiEEZ
2         CA2 166753 offshore_200nmiEEZ
3         CA3 207611 offshore_200nmiEEZ
4          OR 173413 offshore_200nmiEEZ
5          WA  76577 offshore_200nmiEEZ
6         CCO 821336 offshore_200nmiEEZ
[1] "regions_counties.csv"
  region_code       county      state state_code is_coastal
1         CA1    Del Norte California         CA          1
2         CA1     Humboldt California         CA          1
3         CA1    Mendocino California         CA          1
4         CA1       Sonoma California         CA          1
5         CA2      Alameda California         CA          1
6         CA2 Contra Costa California         CA          1
[1] "regions.csv"
  region_id region_code        region_label
1         1         CA1 Northern California
2         2         CA2  Central California
3         3         CA3 Southern California
4         4          OR              Oregon
5         5          WA          Washington
6         6          CA          California
[1] "resiliience.csv" separate by goal into csvs 
  goal region_code     value
1   AO         CA1 0.6295809
2   AO         CA2 0.6546722
3   AO         CA3 0.6530800
4   AO          OR 0.6070413
5   AO          WA 0.6442198
6   BD         CA1 0.5438756
[1] "spp_data.csv"
  region_code      value      metric
1         CA1  0.6824017      status
2         CA1  0.7996161 status.3nmi
3         CA1 -0.1703750       trend
4         CA2  0.6972702      status
5         CA2  0.7911572 status.3nmi
6         CA2 -0.1543476       trend
[1] "tr_data.csv":: gather into region_code, year, activity, value
  activity_code CA_2000    CA_2010 OR_2000    OR_2010 WA_2000   WA_2010
1       BeachSW    6.11 6.14742597    1.01 1.10086862    0.98 1.0765037
2       BirdsSW    1.25 1.28150763    0.28 0.34958652    0.42 0.4801817
3       CanoeSW    0.09 0.05470969    0.01 0.06036449    0.08 0.1446700
4        JSkiSW    0.33 0.33827453    0.00 0.14625138    0.01 0.1642209
5       KayakSW    0.21 0.27600592    0.01 0.17308173    0.07 0.2405681
6       MBoatSW    0.75 0.76776290    0.07 0.14420266    0.23 0.3182624