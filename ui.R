library(shiny)
shinyUI(fluidPage(
        titlePanel("Guinea Pigs: Vitamin C treatment and some basic information"),
        sidebarLayout(
                sidebarPanel(
                        helpText("Insert vitamin treatment method and desired effect on tooth length:"),
                        checkboxGroupInput('supp', 'Supplement:', c("Orange Juice"="OJ", "Vitamin C"="VC"), selected = c("OJ","VC")),
                        checkboxGroupInput('dose', 'Dosage to feed:', c("0.5"=0.5, "1.0"=1.0, "2.0"=2.0), selected = c(0.5,1.0,2.0)),
                        sliderInput('len', 'Desired tooth length', min=7, max=27, value=c(7,27), step= 1)
                ),
                mainPanel(
                        
                        tabsetPanel(
                                tabPanel("Table", dataTableOutput("mytable3")),
                                tabPanel("Boxplot", plotOutput("boxplotGuinea2")),
                                tabPanel("Some Basic Information", uiOutput("myList")),
                                tabPanel("Diet", uiOutput("myList2")),
                                tabPanel("Picture",img(src='guineapig.png', align = "center"))
                                )
                        )
                        )
))
