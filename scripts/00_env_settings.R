
# Set installation path for packages
.libPaths(c("/projappl/project_2006536/project_rpackages_4.3.0", .libPaths()))

# Check
.libPaths()[1]


# Check installed packages
ip <-  as.data.frame(installed.packages())
# this is already quite comprehensive

# Install packages
install.packages("CooRTweet")

## Set theme
#devtools::install_github("rstudio/rstudioapi")
rstudioapi::applyTheme("Tomorrow Night Blue")


## set up Git
library(usethis)
usethis::use_git_config(user.name = "thieled", user.email = "daniel.thiele@univie.ac.at")

#create_github_token()

gitcreds::gitcreds_set()

gh::gh_whoami()


# Create new Rproject
usethis::create_from_github(repo_spec = "https://github.com/thieled/cop_coorbe.git", 
                            destdir = "/projappl/project_2006536/danthie")
                              


gh_token_help()


