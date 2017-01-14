        library(shiny)
        shinyServer(function(input, output) {
                library(ggplot2)
        
                #Barplot creation
                output$boxplotGuinea <- renderPlot({
                        a <- input$supp
                        qplot(len ~ ., data=asdf,
                                main = "Effect of Orange Juice or Vitamin C on Length",
                                xlab = "Dosage (mg/day)",
                                ylab = "Tooth length",
                                ) 
                        
                })
                
                output$boxplotGuinea2 <- renderPlot({
                        boxplot(len~supp*dose, data=ToothGrowth,
                                main = "Effect of Supplement Type and Dosage on Tooth Length",
                                xlab = "Supplement of Orange Juice (OJ) or Vitamin C (VC) and dosage",
                                ylab = "Tooth length",
                                las = 1) 
                        
                })
                
                library(dplyr)
                
                output$mytable3 <- renderDataTable({
                        tooth_table <- aggregate(len~supp+dose,
                                                 data=ToothGrowth,
                                                 FUN = function(x) c(mn = mean(x),
                                                                     sd = sd(x),
                                                                     n = length(x) )) %>% 
                                as.list %>% 
                                as.data.frame()
                        
                        names(tooth_table)[names(tooth_table) == 'len.mn'] <- 'MeanLength'
                        names(tooth_table)[names(tooth_table) == 'len.sd'] <- 'StandardDeviation'
                        names(tooth_table)[names(tooth_table) == 'len.n'] <- 'SampleSize'
                        tooth_table <- filter(tooth_table, MeanLength>input$len[1], MeanLength<input$len[2],
                                       dose %in% input$dose, supp %in% input$supp)
        
                        tooth_table})
                        
                output$myList <- renderUI(HTML("<ul><b>Scientific classification:</b>
                                               <li>Kingdom: Animalia
                                               <li>Phylum: Chordata 
                                               <li>Class: Mammalia
                                               <li>Order: Rodentia 
                                               <li>Suborder: Hystricomorpha
                                               <li>Family: Caviidae
                                               <li>Subfamily: Caviinae 
                                               <li>Genus: Cavia
                                               <li>Species: Cavia porcellus (guinea pig)
                                               <br /><br />        
                                               <b>Physiological data:</b>
                                               <li>body length: 23 - 35 cm (females are usually shorter)
                                               <li>weight: 700 - 1300 grams
                                               <li>life expectancy: 7 - 12 years
                                               <li>number of young per litter: 1 - 6 (usually 2 -3)
                                               <li>body temperature: 37-39 Celsius degrees."))
                
                output$myList2 <- renderUI(HTML("<ul><b>Some of their favorite foods:</b>
                                               <li>Hay
                                               <li>Paprika
                                               <li>Apples
                                               <li>Carrots
                                               <li>Pellets
                                               <li>Lettuce 
                                               <li>Radicchio
                                               <li>Raspberry leaves 
                                               <li>Zucchini"))
                
                
        
        })
