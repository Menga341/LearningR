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

# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
  nhanes_small,
  snakecase::to_snake_case
)

nhanes_small <- rename(
  nhanes_small,
  sex = gender
)

# the first object is always the dataset, then new name = old name

# Piping ------------------------------------------------------------------
# command+shift+M to type %>%
colnames(nhanes_small)

nhanes_small %>%
  colnames()

nhanes_small %>%
  select(phys_active) %>%
  rename(
    phyically_active = phys_active
  )

nhanes_small %>%
    select(bp_sys_ave,
           education)
nhanes_small %>%
    rename(bp_sys = bp_sys_ave,
           bp_dia = bp_dia_ave
    )

select(nhanes_small, bmi, contains("age"))

nhanes_small %>%
    select(bmi,
           contains("age"))

blood_pressure <- select(nhanes_small, starts_with("bp_"))
rename(blood_pressure, bp_systolic = bp_sys)

nhanes_small %>%
    select(starts_with("bp_")) %>%
    rename(bp_systolic = bp_sys)

