#Run after Q1. 1. Behavior Of The Respondents.R

#Graph 2 (For Not Exposed To Media)

large_data[large_data$media_exposure=="Not Exposed",] %>%
  drop_na(response) %>%
  ggplot(aes(y = response, fill = response, order = response)) +
  geom_bar(show.legend = F) +
  geom_text(stat = "count",
            aes(label=..count.., hjust=-0.05, vjust=0.4),
            size=3) +
  facet_wrap(vars(question),
             ncol = 1,
             scales="free_y",
             labeller = variable_labeller) +
  labs(title = "Behavior Of The Respondents",
       subtitle = "(Not Exposed To Media)",
       x = "Number of respondents",
       y="") +
  theme_bw() +
  scale_fill_manual(values = colpal)
