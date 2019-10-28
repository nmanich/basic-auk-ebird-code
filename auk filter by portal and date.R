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
#this is how it works with pipes, probably a better way to make the dataframe

library(auk)

output_file <- "allatlas2priorityspecies.txt" #name your output file
ebird_data <- auk_ebd("ebd_US-WI_201412_201912_relAug-2019.txt") %>% 

  auk_project(project = "EBIRD_ATL_WI")  %>%
  auk_date(date = c("2015-01-01", "2019-12-31")) %>%
  auk_species(species = c("Acadian Flycatcher", "American Bittern", "American Wigeon", "Bay-breasted Warbler", "Bell's Vireo", "Black Tern", "Black-crowned Night-Heron", "Black-necked Stilt", "Boreal Chickadee",  "Bufflehead", "Carolina Wren", "Caspian Tern", "Cattle Egret", "Cerulean Warbler", "Common Goldeneye", "Common Nighthawk", "Common Tern", "Connecticut Warbler", "Eared Grebe", "European Goldfinch", "Forster's Tern", "Golden-winged Warbler", "Great Black-backed Gull", "Great Egret", "Great Tit", "Greater Prairie-Chicken", "Henslow's Sparrow", "Hooded Warbler", "Horned Grebe", "Kentucky Warbler", "King Rail", "Kirtland's Warbler", "Lark Sparrow", "LeConte's Sparrow", "Least Bittern", "Loggerhead Shrike", "Long-eared Owl", "Nelson's Sparrow", "Northern Bobwhite", "Northern Goshawk", "Northern Pintail", "Olive-sided Flycatcher", "Peregrine Falcon", "Philadelphia Vireo", "Piping Plover", "Purple Martin", "Red-necked Grebe", "Red-shouldered Hawk", "Ruby-crowned Kinglet", "Sharp-tailed Grouse", "Short-eared Owl", "Snowy Egret", "Spruce Grouse", "Swainson's Thrush", "Tennessee Warbler", "Upland Sandpiper", "Western Meadowlark", "Western Grebe", "Whooping Crane", "Wilson's Phalarope", "Wilson's Warbler", "Worm-eating Warbler", "Yellow Rail", "Yellow-breasted Chat", "Yellow-crowned Night-Heron", "Yellow-headed Blackbird", "Yellow-throated Warbler")) %>%
  auk_filter(file = output_file) %>% 

  read_ebd()
