function(input, output) {
  output$wip5 <- renderValueBox({
    valueBox(paste0(wip4),
            strong("WIP STASIUN 4"),
             icon = icon("clipboard-list"),
             color = "purple")
  })
  
  output$tes <- renderValueBox({
    valueBox(paste0(jumlah),
             "Progress",
             icon = icon("list"),
             color = "purple")
  })
  
  output$dashboard <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$mesin1 <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$mesin2 <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$mesin3 <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$mesin4 <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$mesin5a <- renderPlotly({
    mcn5 <- testo1 %>%
      filter(mingguke1 == input$pilih_minggu) %>%
      ggplot(mapping = aes(x = waktu, y = tabel1)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  
  output$mesin5b <- renderPlotly({
    mcn5 <- testo2 %>%
      filter(mingguke2 == input$pilih_minggu) %>%
      ggplot(mapping = aes(x = waktu, y = tabel2)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  output$mesin5c <- renderPlotly({
    mcn5 <- testo3 %>%
      filter(mingguke3 == input$pilih_minggu) %>%
      ggplot(mapping = aes(x = waktu, y = tabel3)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  output$mesin5d <- renderPlotly({
    mcn5 <- testo4 %>%
      filter(mingguke4 == input$pilih_minggu) %>%
      ggplot(mapping = aes(x = waktu, y = tabel4)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  output$mesin6 <- renderPlotly({
    mcn5 <- kie2 %>%
      ggplot(mapping = aes(x = waktu, y = qty)) +
      geom_line(linetype = "dashed") +
      geom_point(color = "red") +
      theme_fivethirtyeight()
    
  })
  
  output$oee1 <- renderPlotly({
    plot_ly(kie3,
            x = ~ waktu,
            y = ~ qty,
            type = "bar")
  })
  
  output$oee2 <- renderPlotly({
    # Create a basic bar
    oee2 = ggplot(kie2, aes(x = "", y = waktu, fill = qty)) + geom_bar(stat = "identity", width = 1)
    
  })
  output$oee3 <- renderPlotly({
    fig <-
      plot_ly(
        kie2,
        x = ~ waktu,
        y = ~ qty,
        text = ~ time_diff,
        type = 'scatter',
        mode = 'markers',
        marker = list(size = ~ qty, opacity = 0.5)
      )
    fig <- fig %>% layout(
      title = 'tes',
      xaxis = list(showgrid = FALSE),
      yaxis = list(showgrid = FALSE)
    )
    
    
  })
  
  output$oee4 <- renderPlotly({
    plot_ly(kie3,
            x = ~ waktu,
            y = ~ qty,
            type = "bar")
  })
  
}