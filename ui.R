library(shiny)

# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
    dashboardHeader(title = 'Stiff my data'),
    
    dashboardSidebar(collapsed = FALSE,
      sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("home"), selected = TRUE),
      menuItem("Data", tabName = "data", icon = icon("table")),
      menuItem('About', tabName = 'about', icon = icon('info')),
      hr(),
      sidebarUserPanel(name = a("Pablo Ortega",
                                href = "https://www.linkedin.com/in/portega/"), 
                       subtitle = "Creator",
                       image = "images/portega.jpg")
    ) ),
    
    dashboardBody(
                tabItems(
                tabItem(tabName = 'dashboard',
                fluidRow(
                  column( width = 9,
                  box(title = "Map", status = 'success', width = NULL,
                      solidHeader = FALSE, leafletOutput("map", height = 540))),
                  column( width = 3, 
                          box(title = 'Settings', status = 'warning', width = NULL,
                              helpText(h6("First upload your chemical data")),
                              fileInput("file1", "Choose CSV File",
                                        accept = c(
                                          "text/csv",
                                          "text/comma-separated-values,text/plain",
                                          ".csv")),
                             numericInput("radio", "Height factor", 1, min = 0, max = 100),
                             numericInput("scale", "Scale factor", 1, min = 0, max = 100),
                             helpText(h6("Note: a scale factor of 1 implies that 1 meq equals to 
                                      1 meter in the map")),
                             # hr(),
                             tableOutput("ions"),
                             # br(),
                             # actionButton("stiffme", "Stiff me please!"),
                             # helpText(h6("This creates the file to be exported")),
                             # hr(),
                             downloadButton("export", "Export"),
                             helpText(h6("Stiff exported in CRS: WGS84"))
                             
                             ))
                )   
                  ),
                tabItem(tabName = "data",
                    fluidRow(
                      div(class = "dataframe", includeCSS("styles.css"),
                  # box(title = "Data", width = 12,
                  dataTableOutput("data")

                  ))
                        # )
                    ),
                tabItem(tabName = "about",
                        includeMarkdown("about.md")
                        )
                )
    )
    ))
  
