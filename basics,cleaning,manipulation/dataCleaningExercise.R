install.packages("tidyverse")
library(tidyverse)


mpg %>% 
dplyr::filter(model =='a4') %>% 

dplyr::arrange(displ, cyl) %>% 

dplyr::mutate(old = year < 2000, full_wheel_drive = drv == 'f')%>% 

#dplyr::transmute(full_wheel_drive = drv == 'f')

dplyr::select(-drv)

mpg %>% 
dplyr::count(model, sort = T)