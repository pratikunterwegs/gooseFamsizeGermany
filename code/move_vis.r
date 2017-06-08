library(moveVis)

setwd("~/git/thesis/code")
load("fsize_coords.rdata")

#'convert to move and split by fam
#'
fam.move.day = daycoords

fam.move.day = move(x=fam.move.day$lon, y = fam.move.day$lat,
                    time = fam.move.day$time, animal = fam.move.day$fam,
                    proj = CRS("+proj=longlat +ellps=WGS84"))

fam.move.day = split(fam.move.day)

animate_move(fam.move.day, out_dir = "~/git/thesis/code", map_type = "satellite",
             img_caption = "Movement tracks of goose families", 
             paths_col = "auto", frames_interval = 0.2,
             frames_nres = 20)
