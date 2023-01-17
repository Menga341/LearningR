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
  select(
    bp_sys_ave,
    education
  )
nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

select(nhanes_small, bmi, contains("age"))

nhanes_small %>%
  select(
    bmi,
    contains("age")
  )

blood_pressure <- select(nhanes_small, starts_with("bp_"))
rename(blood_pressure, bp_systolic = bp_sys)

nhanes_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys)

# Filtering rows ----------------------------------------------------------

nhanes_small %>%
  filter(phys_active == "No")

nhanes_small %>%
  filter(phys_active != "No")

nhanes_small %>%
  filter(bmi == 25)

nhanes_small %>%
  filter(bmi >= 25)

nhanes_small %>%
  filter(bmi >= 25 &
    phys_active == "No")
# Can use "&" or "," to refer to "and"

nhanes_small %>%
  filter(bmi >= 25 |
    phys_active == "No")

# Arranging rows ----------------------------------------------------------

nhanes_small %>%
  arrange(age)
nhanes_small %>%
  arrange(desc(age), bmi, education)

# Mutating columes --------------------------------------------------------

nhanes_small %>%
  mutate(
    age = age * 12
  )

nhanes_small %>%
  mutate(
    age_month = age * 12,
    logged_bmi = log(bmi),
    age_weeks = age_month * 4,
    old = if_else(
      age >= 30,
      "old",
      "young"
    )
  )


# 7.12 Exercise: Piping, filtering, and mutating --------------------------

# 1. BMI between 20 and 40 with diabetes
nhanes_small %>%
    # Format should follow: variable >= number or character
    filter(bmi >= 20 & bmi <= 40 & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # Specifying dataset
    mutate(
        # 2. Calculate mean arterial pressure
        mean_arterial_pressure = (2 * bp_dia_ave + bp_sys_ave)/3,
        # 3. Create young_child variable using a condition
        young_child = if_else(age <= 6,
                              "Yes",
                              "No")
    )

nhanes_modified
