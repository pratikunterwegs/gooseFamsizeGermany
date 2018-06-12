#### ggplot printing options ####

library(ggplot2)
unit = unit(0, "cm")
g1 = theme_light()+
  theme(panel.grid = element_blank(),
 legend.position="none", plot.title = element_text(size = 12, face = "bold"))+theme(#strip.text=element_blank(),

  strip.background=element_blank(), panel.spacing.y=unit)#+#+ theme(panel.border = element_rect(fill = NA, colour = 1))

#  theme(axis.ticks.length=unit(-0.1, "cm"), axis.text.x = element_text(margin=unit(rep(0.2,4), "cm")), axis.text.y = element_text(margin=unit(rep(0.2,4), "cm")))

base_size = 11; base_family = ""

c = qnorm(0.975)

g2 = theme_grey(base_size = base_size, base_family = base_family) %+replace% theme(panel.background = element_rect(fill = "grey96", colour = NA), panel.border = element_rect(fill = NA, colour = "grey70", size = 0.5), panel.grid.major = element_line(colour = "grey87", size = 0.25), panel.grid.minor = element_line(colour = "grey87", size = 0.125), axis.ticks = element_line(colour = "grey70", size = 0.25), legend.key = element_rect(fill = "white", colour = NA), strip.background = element_rect(fill = "grey70", colour = NA), strip.text = element_text(colour = "white", size = rel(0.8)), complete = TRUE)+
  theme(legend.position="none", plot.title = element_text(size = 12, face = "bold"))+theme(#strip.text=element_blank(),

    strip.background=element_blank(), panel.spacing.y=unit)

cola = "royalblue4";colb = "indianred3"

cola1 = "lightblue";colb1 = "lightpink"

coltemp = "#fc8d62"
