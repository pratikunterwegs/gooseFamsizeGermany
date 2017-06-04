library(moveVis)

load(fam.move)

animate_move(fam.move2[[1]], out_dir = "~/git/thesis/code", map_type = "satellite",
             img_caption = "Movement tracks of goose families")
