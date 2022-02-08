newspaper <- q1_data$V157
radio <- q1_data$V158
tv <- q1_data$V159

uses_of_media <- data.frame(Class = c("Reads Newspaper",
                                      "Listens To Radio", 
                                      "Watches TV"),
                            Total = c(length(newspaper) %>% na.omit(),
                                      length(radio) %>% na.omit(),
                                      length(tv) %>% na.omit()),
                            Count = c(length(newspaper[newspaper==2 | newspaper==3]),
                                      length(radio[radio==2 | radio==3]),
                                      length(tv[tv==2 | tv==3])))

ggplot(uses_of_media, aes(x = Class,y=Count, fill = Class)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = sprintf("%.2f%%", Count/Total * 100)), 
            vjust = -.5)+
  labs(title = "Media Exposure Regarding Different Source",
       subtitle = "(Radio, Newspaper, TV)") +
  theme_bw() +
  scale_fill_manual(values=c('#3d8c95', '#404788', '#482677')) +
  theme(legend.position="none")
