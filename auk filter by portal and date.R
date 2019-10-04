library(auk) #load auk (auk will not run unless you have cygwin on your computer)

# Setup input and output files, make sure you set working directory

output_file <- "2018atlas.txt" #name your output file
ebird_data <- auk_ebd("ebd_US-WI_201412_201912_relAug-2019.txt") %>% #point to input file
  # 1. reference file
  auk_ebd() %>% 
  # 2. define filters
  auk_project(project = "EBIRD_ATL_WI")  %>% #this filters it to only the WI atlas portal data
  auk_date(date = c("2018-01-01", "2018-12-31")) %>% #this filters it to a specific date window
  # 3. run filtering
  auk_filter(file = output_file) %>% 
  # 4. read text file into r data frame
  read_ebd()

-------------------------------------------
#this is how it works with pipes

library(auk)

 ebird_data <- auk_ebd("ebd_US-WI_201412_201912_relAug-2019.txt") %>% 

  auk_project(project = "EBIRD_ATL_WI")  %>%

  auk_date(date = c("2015-01-01", "2019-12-31")) %>%

  auk_filter(file = "2019aug_atlaswi.txt") %>% 

  read_ebd()
