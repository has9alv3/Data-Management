#Graph 1 (For Exposed To Media)
colpal <- c("#29Af7F", "#1F968B", "#FDE725", "#B8DE29", "#73D055", 
              "#55c667", "#482677", "#440154", "#287D8E", "#404788")

# Checking if respondents get enough ANC visits or not
q1_data$M14 <- q1_data$M14 %>%
  replace_na(99)
q1_data <- q1_data %>%
  mutate(M14=ifelse(
    (M14>=4 & M14!=98 & M14!=99),1,
    ifelse((M14==98 | M14==99),NA,2)))
q1_data$M14 <- q1_data$M14 %>%
  labelled(c("Enough"=1, "Not Enough"=2),
           label="ANC visit")

behavior_data <- q1_data %>% select("media_exposure",
                                    "V025", "V106","M14", "M17") %>% as_factor()
large_data <- behavior_data %>%
  pivot_longer(cols=c('V025', 'V106',"M14", 'M17'), 
               names_to = "question",
               values_to = "response")

variable_names <- list(
  "V025" = "Place Of Residence" ,
  "V106" = "Educational Qualification",
  "M17" = "Delivery By Caesarean Section",
  "M14" = "Antenatal Care Visit")

variable_labeller <- function(variable,value){
  return(variable_names[value])
}
large_data[large_data$media_exposure=="Exposed",] %>%
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
       subtitle = "(Exposed To Media)",
       x = "Number of respondents",
       y="") +
  theme_bw() +
  scale_fill_manual(values = colpal)
