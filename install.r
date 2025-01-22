args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  stop("No arguments provided. Please specify a file name.")
}

source_type <- args[1]
input_file <- args[2]

listpackages = read.table(input_file, header = F)$V1

rspm::enable()

for (pkg_name in listpackages){
    if ( (!startsWith(pkg_name, "#")) & pkg_name != "" & length(find.package(pkg_name, quiet = T)) == 0) {
        print("")
        print("######################################################")
        print("#######          START PACKAGE INSTALL         #######")
        print(pkg_name)
        print("######################################################")
        print("")
        if (source_type == "cran"){
          install.packages(pkg_name, clean = TRUE)
        } else if (source_type == "bioc") {
          BiocManager::install(pkg_name, clean = TRUE, ask = FALSE, update = FALSE)
        } else if (source_type == "github") {
          devtools::install_github(pkg_name, clean = TRUE)
        }
    }
} 

rspm::install_sysreqs()
