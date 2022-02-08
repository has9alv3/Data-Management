ggplot(q2_data, aes(V191, economic_status, fill = economic_status, color = economic_status, alpha = 0.1)) + 
  geom_boxplot() + 
  scale_fill_manual(values=c('#ff6340', '#ffd138', '#2ee684')) +
  scale_color_manual(values=c('#eb2a10', '#eb9b10', '#00c45c')) +
  labs(title = "Dispersion Between The Quantiles", 
       x = "Wealth Index Factor Score", 
       y = "economic_status") +
  scale_x_continuous(labels = label_comma()) +
guides(alpha = "none")
