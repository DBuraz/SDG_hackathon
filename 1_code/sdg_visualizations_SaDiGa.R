# SDG hackathon
# Group: GROUPPSEUDONYM

library(tidyverse)

# read data
publications <- read_csv('0_data/publications_sdg.csv')
projects <- read_csv('0_data/projects_sdg.csv')

##########
# plot 1
##########

# count occurences
pub = publications %>% select(starts_with("SDG")) %>% colSums() %>% t() %>% as_tibble() %>% pivot_longer(everything()) %>% mutate(type = "publication")
pro = projects %>% select(starts_with("SDG")) %>% colSums() %>% t() %>% as_tibble() %>% pivot_longer(everything()) %>% mutate(type = "project")
alltypes = bind_rows(pub, pro)

# plot publication frequencies
ggplot(data = pub) +
  geom_col(mapping = aes(x = name, y = value, fill = name)) +
  theme_minimal() +
  scale_fill_viridis_d() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    title = "SDG Frequencies",
    subtitle = "Number of publications related to SDGs at University of Basel",
    x = "SDG",
    y = "Frequency"
  )
ggsave(filename = '2_figures/sdg_frequencies_SaDiGa_publications.pdf')

# plot project frequencies
ggplot(data = pro) +
  geom_col(mapping = aes(x = name, y = value, fill = name)) +
  theme_minimal() +
  scale_fill_viridis_d() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    title = "SDG Frequencies",
    subtitle = "Number of projects related to SDGs at University of Basel",
    x = "SDG",
    y = "Frequency"
  )
ggsave(filename = '2_figures/sdg_frequencies_SaDiGa_projects.pdf')

# plot all frequencies
ggplot(data = alltypes) +
  geom_col(mapping = aes(x = name, y = value, fill = name)) +
  theme_minimal() +
  scale_fill_viridis_d() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    title = "SDG Frequencies",
    subtitle = "Number of projects and publications related to SDGs at University of Basel",
    x = "SDG",
    y = "Frequency"
  ) +
  facet_wrap(~type)
ggsave(filename = '2_figures/sdg_frequencies_SaDiGa_alltypes.pdf')


##########
# plot 2
##########


##########
# plot 3
##########

# we do this
