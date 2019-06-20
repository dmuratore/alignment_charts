### Generating alignment charts based on entries listed in an accompanying txt file
## the text file should just be plain with entries separated by newlines in the order
## chaotic good/neutral/evil, neutral good/neutral/evil, lawful good/neutral/evil
## Establishing working directory - may need to change for your path
setwd('~/repos/alignment_charts/')

## Loading libraries
library(tidyverse)

## Reading in entries and
## Setting title for chart
chart_title<-'Choose Your Pride Alignment'
texts<-read.csv('pride_text.txt',header=FALSE)
names(texts)<-'texts'

## Preparing data frame for plotting
axis1<-factor(rep(c('Chaotic','Neutral','Lawful'),each=3),levels=c('Lawful','Neutral','Chaotic'))
axis2<-factor(rep(c('Good','Neutral','Evil'),3),levels=c('Evil','Neutral','Good'))
alignment_frame<-data.frame(axis1,axis2,texts)


## Generating the chart
ggplot(alignment_frame)+
  geom_tile(aes(x=axis1,y=axis2),fill='white',col='black')+
  geom_text(aes(x=axis1,y=axis2,label=str_wrap(texts,12)),size=6)+
  scale_x_discrete(position='top')+
  ggtitle(chart_title)+
  theme(panel.background=element_blank(),
        axis.title=element_blank(),
        axis.ticks=element_blank(),
        text=element_text(size=23,colour='black'),
        plot.title=element_text(hjust=0.5))
ggsave(filename='pride_alignment.pdf',device='pdf',width=8,height=8,units='in')
