library(shiny);library(forecast);library(dplyr);library(tm);library(SnowballC);library(RWeka);library(rJava);library(RWekajars);library(wordcloud);library(RColorBrewer)
shinyServer(function(input, output) {
        attitude <- reactive({
                load("tsopinion.RData")
        })
        output$tsplot <- renderPlot({
                fit <- auto.arima(value)
                fore <- predict(fit, n.ahead = input$ph)
                ts.plot(value, fore$pred, col = c(1,2), lty = c(1,2), ylab = "Attitudes", main = "Changes of Bus Passengers' Overall Satisfaction Towards TfL's Bus Service")
        })
        wordcod <- reactive({
                load("wordcloud.RData")
                })
        output$wordcloudvis <- renderPlot({
                wd <- as.matrix(tdm)
                wdfreq <- sort(rowSums(wd), decreasing = TRUE)
                wordcloud(words = names(wdfreq), freq = wdfreq, min.freq = input$freq, random.order = FALSE, colors=brewer.pal(8, "Dark2"))
        })
        
        
})