#controlla se esiste una cartella e se non esiste la crea



mainDir <- "c:/path/to/main/dir"
subDir <- "outputDirectory"

if (file.exists(subDir)){
  setwd(file.path(mainDir, subDir))
} else {
  dir.create(file.path(mainDir, subDir))
  setwd(file.path(mainDir, subDir))
  
}