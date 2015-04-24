library(shiny)
library(UsingR)

shinyServer(
      function(input,output){
           
            output$bmi <- renderPrint({
                  round(input$pounds / (input$feet * 12 + input$inches)^2 * 703,1)
            })
            
            output$outputInfo <- renderPrint({
                  bmi <- input$pounds / (input$feet * 12 + input$inches)^2 * 703
                  if(bmi < 16){
                        bmiType <- 'Severly Underweight'
                  } else if(bmi < 18.5){
                        bmiType <- 'Underweight'
                  } else if(bmi < 25){
                        bmiType <- 'Normal Weight'
                  } else if(bmi < 30){
                        bmiType <- 'Overweight'
                  } else if(bmi < 35){
                        bmiType <- 'Moderately Obese'
                  } else {
                        bmiType <- 'Severely Obese'
                  }
                  bmiType
            })
            
            output$inputInfo <- renderPrint(paste(input$feet,'ft',
                                    input$inches, 'in;', input$pounds,'lbs'))
            
      }
)