library(shiny)

shinyUI(
      pageWithSidebar(
            
            headerPanel("Calculate your Body Mass Index (BMI)"),
            
            sidebarPanel(
                  h3('Enter your height and weight:'),
                  #sliderInput('mu','Guess the mean',value=70,min=62,max=74,step=0.05),
                  numericInput('feet','ft', value=5, min=3, max=7, step=1),
                  numericInput('inches','in', value=10, min=0, max=11, step=0.5),
                  sliderInput('pounds', 'lbs', value=150, min=50, max=350, step=1)
            ),
            
            mainPanel(
                  
                  p('This app calculates the Body Mass Index given a user\'s input. The user inputs his/her
                    height (in feet and inches) and weight (in pounds). The app calculates the BMI and returns 
                    both the BMI value and the corresponding category classification based on this value.'),
                  
                  p('The BMI is calculated as follows:'),
                  withMathJax('$$\\mbox{BMI} = \\frac{\\mbox{mass (lbs)}}{\\mbox{height }^2\\mbox{(in)}} \\times 703$$'),
                  
                  p('The classification categories are:'),
                  p('Severely Underweight (BMI < 16), Underweight (16 < BMI < 18.5), 
                        Normal Weight (18.5 < BMI < 25), Overweight (25 < BMI < 30), Moderately Obese (30 < BMI < 35),
                        and Severely Obese (BMI > 35).'),
                  
                  h5('You entered:'),
                  verbatimTextOutput('inputInfo'),

                  h5('Your BMI is:'),
                  verbatimTextOutput('bmi'),
                  
                  h5('Your BMI indicates that you are likely:'),
                  verbatimTextOutput('outputInfo')
                  
            )
      )
)