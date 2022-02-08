neonatal <- q4_data$B7[q4_data$B7<1] %>% na.omit()
infant <- q4_data$B7[q4_data$B7<12] %>% na.omit()
child_death <- data.frame(Period = c("Neonatal Period\n(<1 month)","Infant\n(<1 year)"), 
                          Total = c(length(neonatal),length(infant)))

ggplot(child_death, aes(x=Period, weight=Total, fill = Period)) +
  geom_bar(width = 0.5) +
  geom_text(stat = "count", aes(label=Total,vjust=2)) +
  labs(title = "Neonatal and Infant Death",
       subtitle = "(among 357 childrens who are not alive)",
       x = "Time Period",
       y = "Frequency") +
  theme_bw() +
  scale_fill_manual(values=c('#94DFFF', '#FCADB0')) +
  theme(legend.position="none")
