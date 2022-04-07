tags$style("@import url(https://use.fontawesome.com/releases/v5.7.2/css/all.css);")

dashboardPage(
  skin = "blue",
  dashboardHeader(title = strong("TEKNOMEDIKA")),
  ##tittle
  
  dashboardSidebar(sidebarMenu(
    ##open sidebar
    menuItem(
      text = "Home",
      tabName = "home",
      icon = icon("home")
    ),
    
    menuItem(
      "MESIN",
      icon = icon("clone"),
      menuSubItem(tabName = "mesin1", "MESIN 1", icon = icon("buffer")),
      menuSubItem("MESIN 2", icon = icon("fill-drip")),
      menuSubItem("MESIN 3", icon = icon("compress")),
      menuSubItem("MESIN 4", icon = icon("grip-lines")),
      menuSubItem(tabName = "mesin5", "MESIN 5", icon = icon("expand-alt")),
      menuSubItem("MESIN 6", icon = icon("sliders-h"))
    ),
    
    menuItem(
      text = "O E E",
      tabName = "oee",
      icon = icon("cogs")
    )
  )),
  ##close sidebar
  
  dashboardBody(tabItems(
    ##body | body 1
    tabItem(
      tabName = "home",
      h2("Dashboard"),
      valueBox(
        value = 0,
        
        subtitle = strong("FINISH GOOD"),
        icon = icon("box-open"),
        color = "red"
      ),
      valueBoxOutput("tes"),
      valueBox(
        value = 0,
        
        subtitle = strong("ARCHIEVE"),
        icon = icon("truck-loading"),
        color = "green"
      ),
      
      
      fluidRow(column(
        12,
        selectInput("state", "Pilih waktu", state.name),
        plotlyOutput(outputId = "dashboard")
      )),
      
      
    ),
    
    tabItem(
      ##mesin5 body
      tabName = "mesin5",
      valueBox(
        value = 0,
        
        subtitle = strong("FINISH"),
        icon = icon("box-open"),
        color = "green"
      ),
      valueBox(
        value = sum(fg$`Jumlah Finish Goods`),
        
        subtitle = strong("WIP MESIN 4"),
        icon = icon("times-circle"),
        color = "yellow"
      ),
      valueBox(
        value = sum(fg$`Jumlah Finish Goods`),
        
        subtitle = strong("REJECT"),
        icon = icon("times-circle"),
        color = "red"
      ),
      
      fluidRow(
        box(
          selectInput(
            inputId = "pilih_minggu",
            label = "Pilih Week",
            choices = unique(testo1$mingguke1)
          ),
          title = "MESIN 5 A",
          solidHeader = TRUE,
          status = "primary",
          plotlyOutput(outputId = "mesin5a")
        ),
        box(
          selectInput(
            inputId = "pilih_minggu",
            label = "Pilih Week",
            choices = unique(testo2$mingguke2)
          ),
          title = "MESIN 5 B",
          solidHeader = TRUE,
          status = "primary",
          plotlyOutput(outputId = "mesin5b")
        ),
        box(
          selectInput(
            inputId = "pilih_minggu",
            label = "Pilih Week",
            choices = unique(testo3$mingguke3)
          ),
          title = "MESIN 5 C",
          solidHeader = TRUE,
          status = "primary",
          plotlyOutput(outputId = "mesin5c")
        ),
        box(
          selectInput(
            inputId = "pilih_minggu",
            label = "Pilih Week",
            choices = unique(testo4$mingguke4)
          ),
          title = "MESIN 5 D",
          solidHeader = TRUE,
          status = "primary",
          plotlyOutput(outputId = "mesin5d")
        )
      ),
    ),
    
    tabItem(
      tabName = "oee",
      ##oee body
      valueBox(
        value = "20%",
        width = 3,
        subtitle = strong("Overall OEE"),
        icon = icon("box-open"),
        color = "red"
      ),
      valueBox(
        value = "21%",
        width = 3,
        subtitle = strong("Availability"),
        icon = icon("archive"),
        color = "blue"
      ),
      valueBox(
        value = "23%",
        width = 3,
        subtitle = strong("Performance"),
        icon = icon("truck-loading"),
        color = "green"
      ),
      valueBox(
        value = "90%",
        width = 3,
        subtitle = strong("Quality"),
        icon = icon("check-circle"),
        color = "yellow"
      ),
      fluidRow(column(4, box(
        width = 15, plotlyOutput("oee1")
      )),
      column(4, box(
        width = 15, plotlyOutput("oee2")
      )),
      column(4, box(
        width = 15, plotlyOutput("oee3")
      ))),
      
      
      fluidRow(column(12,
                      plotlyOutput(outputId = "oee4"))),
    )
    
    
    
    
  ))
)
