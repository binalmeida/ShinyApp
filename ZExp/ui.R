library(shiny)
library(ExpDes.pt)
library(shinythemes)
library(DescTools)


shinyUI(
  fluidPage(
    navbarPage(
      theme = shinytheme("darkly"), "ZExp",
      
      #DIC
      tabPanel(
        icon = icon("tag"),
        "DIC",
        mainPanel(
          tabsetPanel(
            sidebarPanel(
              fileInput(
                "file",
                'Importar arquivo txt/csv',
                buttonLabel = "Procurar...",
                accept = c('text/csv',
                           'text/comma-separated-values,text/plain',
                           '.csv')
              ),
              
              tags$hr(),
              
              selectInput("sep1", label = "Selecione o separador de valores: ", 
                          choices = list('Virgula - ,' = ",",
                                         'Ponto e virgula - ;' = ";",
                                         'Tabulação - tab' = "\t"), selected = ";"),
              selectInput("dec1", "Selecione o separador Decimal", 
                          choices = list('Ponto - .' = ".",
                                         "Virgula - ," = ","), selected = ','),
              
              tags$hr(),
              
              uiOutput("VarTrat"),
              uiOutput("VarResp"),
              
              tags$hr(),
              
              selectInput("t1", label = "Selecione o teste: ", 
                          choices = list('Tukey' = "tukey", 'SNK' = "snk",'Duncan' = "duncan", 'Scott-Knott' = "sk" , 'Scheffe' = "scheffe"), 
                          selected = "tukey"),
              
              selectInput("q1", label = "Sobre os tratamentos, eles são: ", 
                          choices = list("Quantitativos" = FALSE, "Qualitativos" = TRUE), 
                          selected = "TRUE"),
              
              tags$hr(),
              
              numericInput("nc", "Defina o nivel de significância: ", 0.05, min = 0, max = 1, step = 0.01 ),
            ),
          ),
          verbatimTextOutput("anovatable"),
        ),
      ),
      
      #DBC
      tabPanel(
        icon = icon("tag"),
        "DBC",
        mainPanel(
          tabsetPanel(
            sidebarPanel(
              fileInput(
                "file2",
                'Importar arquivo txt/csv',
                buttonLabel = "Procurar...",
                accept = c('text/csv',
                           'text/comma-separated-values,text/plain',
                           '.csv')
              ),
              
              tags$hr(),
              
              selectInput("sep2", label = "Selecione o separador de valores: ", 
                          choices = list('Virgula - ,' = ",",
                                         'Ponto e virgula - ;' = ";",
                                         'Tabulação - tab' = "\t"), selected = ";"),
              selectInput("dec2", "Selecione o separador Decimal", 
                          choices = list('Ponto - .' = ".",
                                         "Virgula - ," = ","), selected = ','),
              
              tags$hr(),
              
              uiOutput("VarTrat2"),
              uiOutput("VarBloco"),
              uiOutput("VarResp2"),
              
              tags$hr(),
              
              selectInput("t2", label = "Selecione o teste: ", 
                          choices = list('Tukey' = "tukey", 'SNK' = "snk",'Duncan' = "duncan", 'Scott-Knott' = "sk", 'Scheffe' = "scheffe"), 
                          selected = "tukey"), 
              
              selectInput("q2", label = "Sobre os tratamentos, eles são: ", 
                          choices = list("Quantitativos" = FALSE, "Qualitativos" = TRUE), 
                          selected = "TRUE"),
              
              tags$hr(),
              
              numericInput("nc2", "Defina o nivel de significância: ", 0.05, min = 0, max = 1, step = 0.01 ),
            ),
          ),
          verbatimTextOutput("anovatable2"),
        ),
      ),
      
      #Sobre
      tabPanel(
        icon = icon("tag"),
        "Sobre",
        mainPanel(
          h2("Aluno: Pablo Fellipe de Souza Almeida - IF SUDESTE MG, Campus Rio Pomba"),
          h2("Orientadora: Alessandra Coelho Martins - IF SUDESTE MG, Campus Rio Pomba"),
          h2("Curso: Ciência da Computação"),
          tags$hr(),
          h2("Essa aplicação fez parte do desenvolvimento de uma monografia, com o título: 'SOFTWARE RSTUDIO: uma aplicação web
              para o ensino de estatística experimental utilizando o pacote Shiny'"),
          h2("Segue abaixo contato para caso precisar, base de dados para teste e o código fonte."),
          tags$hr(),
          htmlOutput("contato"),
          htmlOutput("github"),
        ),
      ),
      
    )
  )
)