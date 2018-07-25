library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$map <- renderLeaflet({ # Agrega mapa de leaflet
    leaflet()%>%
      # Base groups
      addProviderTiles(providers$OpenStreetMap, group = "Basemap")%>%
      addProviderTiles(providers$Esri.WorldStreetMap, group = "Topo")%>%
      addProviderTiles(providers$Esri.WorldImagery, group = "Satellite")%>%  
      
      setView(-69.7, -33, zoom = 5)%>%
      
      # Add points
      # addCircleMarkers(data = pts, ~long, ~lat, layerId = ~id, 
      #                  label = ~htmlEscape(id),
      #                  radius=5, group = "Monitoring points")%>%
      
      # addEasyButton(easyButton(
        # icon="fa-crosshairs", title="Locate Me",
        # onClick=JS("function(btn, map){ map.locate({setView: true}); }")))%>%

      # Layers control
      addLayersControl(
        baseGroups = c("Base", "Topo", "Satellite"),
        # overlayGroups = c("Monitoring points"),
        options = layersControlOptions(collapsed = TRUE))%>%

      addMiniMap(position = 'bottomright', toggleDisplay = TRUE,
                  collapsedWidth = 30, collapsedHeight = 30)
  })

  # df = reactiveValues(data = data.frame())
  
  df = reactive({
    infile = input$file1
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    read.csv(infile$datapath, row.names = NULL)
  })
  
  stiffme = NULL
  makeReactiveBinding("stiffme")
  
  observeEvent(c(input$file1, input$radio, input$scale) , {
    if(is.null(df()))
      return(NULL)
      
    stiff = stiff.to.geojson(df(), input$radio, input$scale)
    stiff84 = spTransform(stiff, CRSobj = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
    coord = coordinates(stiff84)
    stiff84$lat = coord[,2]
    stiff84$lng = coord[,1]
    latmin = min(coord[,2])-0.03
    latmax = max(coord[,2])+0.03
    longmin = min(coord[,1])-0.03
    longmax = max(coord[,1])+0.03
    stiffcolor = randomColor(1)
    proxy = leafletProxy("map")
    proxy %>% clearShapes()
    proxy %>% addPolygons(data = stiff84, group = "Stiff diagrams", label = ~htmlEscape(id), 
                          opacity = 0.5, color = "black", fillColor = stiffcolor, 
                          fillOpacity = 0.5)
    proxy %>% flyToBounds(lng1 = longmin, lat1 = latmin, lng2 = longmax, lat2 = latmax)
    proxy %>% addLayersControl( 
      baseGroups = c("Base", "Topo", "Satellite"),
      options = layersControlOptions(collapsed = TRUE),
      overlayGroups = c("Stiff diagrams") )
    stiffme <<- stiff84
  })

  
  
  output$export = downloadHandler(
    filename = function() {
      paste("stiff_", Sys.Date(), "_groundwaterCL.geojson" , sep = '')
    },
      content = function(file){
        geojson_write(stiffme, file = "stiff_export.geojson", 
                      crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
        # writeOGR(stiffme, dsn = "stiff_export.geojson",
                 # layer="stiff_export", driver="GeoJSON", overwrite_layer = TRUE)
        file.copy("stiff_export.geojson", file)
     }
    )

  output$data <- renderDataTable({
  # if (is.null(df()))
  # return(renderText("Upload a file please"))
  datatable(df(), class = "display", autoHideNavigation = TRUE, 
            extensions = c("Responsive", "RowGroup", "Scroller","ColReorder"))
  })
  output$ions <- renderTable(hover = TRUE, spacing = "xs", align = "c", {
    df.ions = data.frame(cations = c("Na", "Ca", "Mg"), anions = c("Cl", "HCO3", "SO4"))
    # datatable(df.ions, class = "display", autoHideNavigation = TRUE, filter = "none",
              # extensions = c("Responsive", "RowGroup", "Scroller","ColReorder"))
  })
  # output$markdown <- render({
  #   HTML(markdown::markdownToHTML(knit('about.rmd', quiet = TRUE)))
  # })
})
