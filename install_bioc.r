
args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  stop("No arguments provided. Please specify a file name.")
}

input_file <- args[1]

listpackages = read.table(input_file, header = F)$V1

rspm::enable()

for (pkg_name in listpackages){
    if (pkg_name != "" & length(find.package(pkg_name, quiet = T)) == 0) {
        print("")
        print("######################################################")
        print("#######          START PACKAGE INSTALL         #######")
        print(pkg_name)
        print("######################################################")
        print("")
        BiocManager::install(pkg_name, clean = TRUE, ask = FALSE, update = FALSE)
    }
}

rspm::install_sysreqs()

