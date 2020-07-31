#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Text Prediction Model"),
    p("This app that takes an input phrase (multiple words) in a text box and outputs a prediction of the next word."),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h2("Instructions:"), 
            h5("1. Enter a word or words in the text box."),
            h5("2. The predicted next word prints below it in blue."),
            h5("3. No need to hit enter of submit."),
            h5("4. A question mark means no prediction, typically due to mis-spelling."),
            h5("5. When the input textbox is empty, the word with maximum frequency in unigram is predicted."),
            h5("6. Additional tabs show plots of the top ngrams in the dataset."),
            br()
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("predict",
                         textInput("user_input", h3("Your Input:"), 
                                   value = "Your words"),
                         h3("Predicted Next Word:"),
                         h4(em(span(textOutput("ngram_output"), style="color:blue")))),
                
                tabPanel("top quadgrams",
                         br(),
                         HTML('<img src = "quadgram.png", height = 500, width = 700>')),
                
                tabPanel("top trigrams",
                         br(),       
                         img(src = "trigram.png", height = 500, width = 700)),
                
                tabPanel("top bigrams",
                         br(),
                         img(src = "bigrams.png", height = 500, width = 700)),
                
                tabPanel("top unigrams",
                         br(),
                         img(src = "unigram.png", height = 500, width = 700))
            )   
        )
    )
)
)