---
title: Goose families project
bibliography: geese_citations.bib
---

# Background

The Whitefronted goose *Anser albifrons* is a circumpolar migrant with a number of subspecies proposed [@BirdStudy1380]. The population that migrates to western continental Europe originates from around the Barents Sea, and has been studied since at least the '60s [@Wildfowl271]. Breeding success is apparently high, with [@Wildfowl271] reporting that around a third of Barents Sea birds overwintering in England were first-winter geese. These historical data are backed up in a comprehensive report by @kondratyev2008greater in which the breeding biology of the species is reported from Kolguyev, an offshore Russian island. This study simultaneously casts Kolguyev as the spring arrival point of 30% of the total Western European wintering population - around 500,000 birds - and thus an important breeding and stop-over site.

The following is known of the species: that geese live and migrate in family groups, and that parent-offspring relationships are strong and may continue beyond the first migration in the form of alloparenting [@10.2307/4088245; @10.2307/4511184]; that winter site fidelity is high at least for the Greenland population @wilson1991winter; and that geese use favourable environmental conditions to migrate, following the band of emerging spring vegetation [@OIK:OIK12114; @OIK:OIK20083].

Family structure appears to be preferred in larger geese such as the White-fronted goose [@jonsson2008lesser]. However, in some species, this structure is subsumed by foraging or collective defence requirements, and is not always strongly expressed, especially on wintering grounds [@johnson1988weak].[^1]

# Observations[^2]
Field observations of geese wintering in The Netherlands suggest that:

1. Family groups are identified as those having a higher proportion of juveniles;
2. Geese arrive in groups of non-breeders or families; non-breeders arrive a few weeks earlier than family groups;
3. Some family groups are maintained through winter and the succeeding spring migration, while some juvenile geese leave these groups and become independent;
4. Goose family sizes appear to decrease through winter, but larger families are seen in the west, where;
5. Numbers of geese are lower, leading to agglomeration, making it difficult to distinguish large families from small groups.

# Questions[^3]
Knowledge of anserine natural history, coupled with field observations of White-fronted geese, prompt these questions:

1. Do family and group sizes differ between the breeding and wintering grounds? How are the two related?
2. How are family and group size related to environmental predictors?
3. Is there a seasonal difference?
4. How are large families to be differentiated from small groups of non-breeders at their wintering grounds?[^4]

# General expectations
1. Family and group size variation with season
 - In summer on Kolguyev, @kondratyev2008greater report a nesting success of 78%, which should boost family sizes. Additionally, migration related mortality has not yet occurred. In winter, juveniles might become independent and leave family units. On the whole, families are hypothesised to be larger in summer than in winter.
 - In summer, predation pressure is higher on Kolguyev than it is in the wintering grounds. Food is likely more abundant due to spring growth. Bigger groups benefit from collective defence while avoiding resource competition. Groups are similarly hypothesised to be larger in summer than in  winter.[^5]
 - The benefit of living in groups should outweigh the costs during summer in a high predation environment, while the advantages of foraging as a smaller unit are more evident in a low-risk, low-resource wintering area.
 - The relation of family size to group size should probably be season dependent: positively related in the summer, negatively in the winter.[^6]

2. Family and group size and environmental predictors
 - Both families and groups probably benefit from similar environmental conditions. This section is likely to be more exploratory.
 - I expect numbers to be well explained by vegetation and/or snow cover.
 - The observation that families to the west are larger could be tested by including longitude as a predictor, and      perhaps small groups could be differentiated from large families by using a cut-off threshold of first-winter bird proportion (the literature suggests 0.33 as the expected proportion of first-winter birds). [^7]

### Using track data

The way I see of using the data from the satellite transmitters would be to use their positions at the breeding and wintering grounds to extract environmental variable values of the corresponding coordinates from a raster layer. The flight path in between seems quite valuable, but I’m not sure what one could do with it. I see that migration tracks have been used to determine the conditions constraining spring migration [@OIK:OIK20083]. From work on schooling fish I suspect that cohesion is one parameter that could be extracted from the migration tracks, but I think the summer school will give me a better idea of what’s possible
here.

# Possible analysis
At the moment, I can mostly only guess at what the analysis should be like. I would use GLMs, but I’m not sure if there isn’t a better option. I could potentially use `adehabitatHS` R package functions to determine the ecological niche given the position data and environmental rasters, and this would likely differ across seasons. It would be one way of  determining what impacts goose habitat choice, but I haven’t found a way to include group size as a response variable here. This section needs serious expansion.

---

# References

[^1]: On the whole, it would seem that the Greenland geese are better
    studied.

[^2]: These statements are modified from the master’s project document.
    I hope I understood them correctly.

[^3]: I wonder if questions related to mixed species flocking might be
    interesting. It seems from the literature that geese of other
    species do form mixed species flocks. I wonder whether these geese
    do so, and if the proportions of heterospecifics are significant.

[^4]: Question 3 might not be particularly interesting except for
    practical purposes. On wintering grounds, a low proportion of
    first-winter birds might indicate a small group of mostly
    non-breeders rather than a large family.

[^5]: Other species of geese are reported to dissolve family groups and
    opt for larger, denser feeding groups. I’m not really sure what to
    expect here. I know wintering ducks move in huge groups, so perhaps
    this prediction is not well founded.

[^6]: Again, I’m not very sure that this works. It could also be that
    potential inter-family competition keeps group sizes low. If
    families are accompanied by alloparents, group defence might not be
    an incentive.

[^7]: I’m not sure which variables should be considered here. For a
    grazer, NDVI seems most relevant. I don’t expect temperature to vary
    much within the two-week observation periods. I also suspect between
    season temp differences might be less important than grass/snow
    cover. I hope rasters for Kolguyev are available.

[^8]: Number of heterospecifics. Might not be relevant/feasible.

[^9]: Seems relevant, but direct quantification of predation pressure
    seems difficult at best.
