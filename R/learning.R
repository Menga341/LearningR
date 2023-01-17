# Here's an example of a conflict.
# Here's an example of a conflict round 2.
# Here's an example of a conflict round 3.
# Conflict from github 4 haha
10

# R basics ----------------------------------------------------------------
# Command shit P : search “section” to add a new coding section
weight_kilos <- 100
weight_kilos <- 10
weight_kilos

# C() is an option

weight_kilos

colnames(airquality)

str(airquality)
# str means structure, it's to check the data set

summary(airquality)

2 + 2

2 + 2

# Two ways to restyle the code 1. highlight, then Code > Reform Code 2. Crl+shift+P, then search "Style active file"


# Packages ----------------------------------------------------------------

library(tidyverse)

# This will be used for testing out Git.

library(NHANES)


# Looking at data ---------------------------------------------------------
glimpse(NHANES)
# glimpse is to take a quick look at the data set

select(NHANES, Age, Weight, BMI)

select(NHANES, -HeadCirc)

select(NHANES, starts_with("BP"))

select(NHANES, ends_with("Day"))

select(NHANES, contains("Age"))

nhanes_small <- select(
  NHANES,
  Age,
  Gender,
  BMI,
  Diabetes,
  PhysActive,
  BPSysAve,
  BPDiaAve,
  Education
)
nhanes_small
