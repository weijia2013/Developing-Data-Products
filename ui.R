library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Changes of Passengers Overall Attitude Towards TfL Bus Service"),
        sidebarPanel(
                p("This is a demo of understanding passengers attitude changes towards TfL bus service by utilising sentiment analysis.
                  This demo includes two parts, attitude changes by timeseries plot and the most frequently used words by utilising word cloud analysis.
                  The timeseries plot can predict the next 48 hours attitude changes.
                  The word cloud can illustrate different reasons caused the attitude changes."),
                br(),
                p("Use the controls below to adjust settings and the
                  prediction will be displayed in the plot to the right. 
                  The initial figure is a demo based on 7 days timeseries plot."),
                br(),
                p("Please be patient for Initialization. If you encounter the crash of the app, please refresh your browser. Thanks for you waiting. :-)"),
                sliderInput("ph",
                            "Prediction hours:",
                            min = 1,
                            max = 48,
                            value = 24),

                sliderInput("freq",
                            "Minimum word frequency:",
                            min = 15,
                            max = 50,
                            value = 25)
                ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Sentiment Visualisation", 
                                 plotOutput("tsplot"),
                                 plotOutput("wordcloudvis")), 
                        tabPanel("About",
                                 p("This project is part of my final dissertation. It aims in understanding passengers' attitude changes towards TfL's bus service."),
                                 br(),
                                 br(),
                                 p("Twitter provides potential opportunities for travellers to express their opinions towards their experienced issues during their journey.
                                   In the meantime, it also provide new opportunities for transport operators to learn from their passengers. However, only accounting for the
                                   numbers of Twitter followers cannot reveal how success of operators' Twitter performance. This project provide a noval method in transport domain for operators 
                                   to understand their customers in a effective way."),
                                 br(),
                                 br(),
                                 p("Cluster analysis and sentiment analysis can not only help operators to investigate travellers' overall attitude changes towards their service,
                                   but also can understand opinions to a specific service, such as, bus reliability, driver behaviour and safety issues.
                                   Wordcloud can illustrate the reasons why passengers post that opinion."),
                                 br(),
                                 br(),
                                 #HTML('<div style="clear: left;"><img src="au.png" alt="" style="float: left; margin-right:5px" /></div>'),
                                 strong('Author'),
                                 p('Weijia Chen',br(),
                                   'MPhil at Newcastle University',br(),
                                   a('LinkedIn', href="https://www.linkedin.com/profile/view?id=144956580&trk=nav_responsive_tab_profile_pic", target="_blank")	
                                 )
                                 )
                        )
                )
))