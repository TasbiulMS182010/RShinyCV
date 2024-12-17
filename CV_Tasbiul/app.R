# Install the necessary packages
if (!require("shiny")) install.packages("shiny")
if (!require("bslib")) install.packages("bslib")
if (!require("leaflet")) install.packages("leaflet")
if (!require("timevis")) install.packages("timevis")

library(shiny)
library(bslib)
library(leaflet)
library(timevis)

# Define UI with bslib theme and leaflet map
ui <- navbarPage(
  title = p(class = "gradient-text-title","Tasbiul's Profile"),
  id = "nav",
  
  # Custom CSSs
  tags$head(
    tags$style(HTML("
        /* Navigation Box Style */
        .navbar {
        background-color: #00246B; /* Matching primary color */
        border-radius: 0; /* Remove rounded corners */
        border: none;
        height: 80px; /* Increase this value to change the height */
        padding: 0; /* Ensure no extra padding affects height */
      }
      
      /* Title Style */
      .navbar-brand {
        font-size: 30px;
        font-weight: bold;
        color: white !important; /* White text for the title */
        margin: 0; /* Remove default margin */
        line-height: 50px; /* Match the navbar height for vertical centering */
      }
      /* Custom Title TEXT Color Style */
      .gradient-text-title {
        background: linear-gradient(43deg, #21D4FD , #B721FF);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-size: 40px;
        font-weight: bold;
      }
      /* Navbar Links Default */
      .navbar-nav > li > a {
        color: white !important; /* Set default text color */
        line-height: 30px; /* Adjust for better vertical centering */
        padding: 20px; /* Increase padding to avoid text being cut */
        min-height: 60px;
      }
      
      /* Navbar Links Hovered */
      .navbar-nav > li > a:hover {
        background-color: white !important;
        color: #00246B !important; /* You can also set the text color */
      }
      
      /* Custom Tab TEXT Color Style */
      .gradient-text-tab {
        background: linear-gradient(160deg, #0093E9 , #80D0C7);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-size: 20px;
        font-weight: bold;
        margin:1px;
      }
      .card {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
      }
      .card-body {
        padding: 20px;
      }
      .card h4 {
        color: #00246B; /* Customize heading color */
      }
      .card p {
        font-size: 14px;
        color: #666; /* Customize text color */
      }
    "))
  ),
  
  # Main Page Tab
  ##################################################################################################
  tabPanel(p(class="gradient-text-tab","Biography"),
           fluidRow(
             # Common Start ----------------------------------------------------------------Common Start
             column(3, # Left Column Common for All
                    div(style = "background-color: #CADCFC; padding: 20px; border-radius: 10px;",
                        # -----------------------------------------------------------------------------------
                        h3("Tasbiul Islam Nibir"),
                        p(tags$b(style = "padding-left: 30px;padding-bottom: px;", "Nationality:"), "Bangladeshi"),
                        p(tags$b(style = "padding-left: 30px;", "Current Designation:"), "MERL Specialist"),
                        p(tags$b(style = "padding-left: 30px;", "Current Organizatsion:"), "iDE Global"),
                        p(tags$b(style = "padding-left: 30px;", "Present Address:"), "Dhaka, Bangladesh"),
                        
                        p(tags$b(style = "padding-left: 30px;", "Contacts:"), tags$a(href = "www.linkedin.com/in/tasbiul", "linkedin"),"|",
                          tags$a(href = "https://sites.google.com/view/tasbiul-islam-nibir/home", "Website"),"|",
                          tags$a(href = "mailto:tasbiulnibir@gmail.com", "Email")),
                          tags$a(href = "tel:+8801789465406", "Call Me on Mobile", 
                               style = "padding-left: 95px; font-size: 15px; color: blue; text-decoration: underline;"),
                        tags$br(),
                          tags$a(href = "https://wa.me/8801789465406", "Chat with Me on WhatsApp", 
                               style = "padding-left: 95px; font-size: 15px; color: green; text-decoration: underline;"),
                        tags$hr(),
                        
                        # -----------------------------------------------------------------------------------
                        h5("Experienced with"),
                        tags$ul(
                          tags$li("Data Analysis and Visualization"),
                          tags$li("Research Design and Sampling"),
                          tags$li("Developing Customized R Packages"),
                          tags$li("Dashboard Designing"),
                          tags$li("GIS and Remote Sensing")),
                        tags$hr(),
                        h5("Skills"),
                        tags$ul(
                          tags$li("Data Analysis"),
                          tags$li("R, Python, Shiny, D3.js"),
                          tags$li("MERL Frameworks"),
                          tags$li("Dashboard Development")
                        ),
                        tags$hr(),
                        # -----------------------------------------------------------------------------------
                        h5("References"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                    )
             ),
             # Common End ----------------------------------------------------------------Common End
             column(9,
                    fluidRow(
                      column(12,
                             tags$h3("About Me",
                                     style = "margin-top:25px;"),
                             tags$p(style="padding: 15px;background-color: #eff6f9; margin: 20px",
                             "Hi, I am Tasbiul Islam Nibir. I am currently involved with development research.
                             Over the past 5 years i have held various roles in Monitoring, Evaluation, Accounatibility, Research,
                             Learning, and Program Quality. My professional journey has enabled me to contribute to various humanitarian crisis 
                             and development sectors in Bangladesh. I also have experience of being a PhD Student for One year."
                             )
                      ),
                      column(5,
                             h3("Research Interest"),
                             tags$ol(
                               tags$li("Dynamic data visualization."),
                               tags$li("Public health"),
                               tags$li("Social Data Science")
                             )
                      ),
                      column(7,
                             h3("Work Locations"),
                             leafletOutput("workMap", height = 300)  # Output for the leaflet map
                      )
                    )
             )
           )
  ),
  
  # Experience tab with timeline
  ##################################################################################################
  tabPanel(p(class="gradient-text-tab","Experience"),
           fluidRow(
             # Common Start ----------------------------------------------------------------Common Start
             column(3, # Left Column Common for All
                    div(style = "background-color: #CADCFC; padding: 20px; border-radius: 10px;",
                        # -----------------------------------------------------------------------------------
                        h3("Tasbiul Islam Nibir"),
                        p(tags$b(style = "padding-left: 30px;padding-bottom: px;", "Nationality:"), "Bangladeshi"),
                        p(tags$b(style = "padding-left: 30px;", "Current Designation:"), "MERL Specialist"),
                        p(tags$b(style = "padding-left: 30px;", "Current Organizatsion:"), "iDE Global"),
                        p(tags$b(style = "padding-left: 30px;", "Present Address:"), "Dhaka, Bangladesh"),
                        
                        p(tags$b(style = "padding-left: 30px;", "Contacts:"), tags$a(href = "www.linkedin.com/in/tasbiul", "linkedin"),"|",
                          tags$a(href = "https://sites.google.com/view/tasbiul-islam-nibir/home", "Website"),"|",
                          tags$a(href = "mailto:tasbiulnibir@gmail.com", "Email")),
                        tags$a(href = "tel:+8801789465406", "Call Me on Mobile", 
                               style = "padding-left: 95px; font-size: 15px; color: blue; text-decoration: underline;"),
                        tags$br(),
                        tags$a(href = "https://wa.me/8801789465406", "Chat with Me on WhatsApp", 
                               style = "padding-left: 95px; font-size: 15px; color: green; text-decoration: underline;"),
                        tags$hr(),
                        
                        # -----------------------------------------------------------------------------------
                        h5("Experienced with"),
                        tags$ul(
                          tags$li("Data Analysis and Visualization"),
                          tags$li("Research Design and Sampling"),
                          tags$li("Developing Customized R Packages"),
                          tags$li("Dashboard Designing"),
                          tags$li("GIS and Remote Sensing")),
                        tags$hr(),
                        h5("Skills"),
                        tags$ul(
                          tags$li("Data Analysis"),
                          tags$li("R, Python, Shiny, D3.js"),
                          tags$li("MERL Frameworks"),
                          tags$li("Dashboard Development")
                        ),
                        tags$hr(),
                        # -----------------------------------------------------------------------------------
                        h5("References"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                    )
             ),
             # Common End ----------------------------------------------------------------Common End
             column(9,
                    div(style = "margin: 22px; padding-bottom:1px;",  # Adjust the margin value as needed
                        h3("Experience"),
                        h4("Lifeline"),
                        timevisOutput("timeLine", height = 160),  # Output for the timeline
                    ),
                    br(),
                    div(class = "container-fluid",
                        div(class = "row",
                            
                            # First Row First Col [iDE]
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse1", "MERL Specialist - iDE Global", # Change number here
                                            `data-toggle` = "collapse", 
                                            `aria-expanded` = "false", 
                                            `aria-controls` = "collapse1" # Change number here
                                          )
                                        ),
                                        p("February 2024 - Present"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I am working as a part of the Institutional MERL team at iDE and providing MERL support to different iDE projects all around Bangladesh.  Here, MERL means Monitoring, Evaluation, Research and Learning."),
                                        tags$a(href = "#collapse1","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse1", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse1", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Developed MERL Minimum Standard Guideline - Using R {Bookdown}."),
                                              tags$li("Implemented Realtime Data Collection and Dynamic Dashboard - Using Kobo Toolbox, Javascript and Looker Studio."),
                                              tags$li("Dynamic Photo Collection and Reporting tool in Cell Embeded Image Sheet - Using Kobo Toolbox, Excel {VBA} and Gsheet."),
                                              tags$li("Developed project dashboard using R {Shiny}."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Contribute to Overall MERL System Development."),
                                              tags$li("Contribute to Overall MIS System Development."),
                                              tags$li("Ensure program quality and implementation in line with global KPI."),
                                              tags$li("Contribute in quantative and qualitative research."),
                                            )
                                        )
                                    )
                                )
                            ), # Col1
                            # First Row 2nd Col
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse2", "MEAL Officer - DRC", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse2" # Change number here
                                          )
                                        ),
                                        p("August 2023 - January 2024"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I worked as a part of the MEAL team and supported multiple projects (livelihood, Protection, Site Management) in six Rohingya Refugee Camps in Ukhiya, Cox’s Bazar, Bangladesh."),
                                        tags$a(href = "#collapse2","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse2", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse2", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Led multiple endline surveys and wrote report for donor and other stakeholders."),
                                              tags$li("Led and Supported qualitative assessments such as FGDs and KIIs."),
                                              tags$li("Supported the core humanitarian standards assessments in DRC Bangladesh as a part of DRCs global assessment."),
                                              tags$li("Developed multiple project dashboard using Power BI"),
                                              tags$li("Supported with systematic review of relevant document and project proposal writing for acquiring new projects."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Developing and updating program quality management tools such as logical framework analysis, MEAL plans, and performance indicator tracking tables and dashboards using Power BI for different projects."),
                                              tags$li("Design, conduct, and report on the baseline & endline evaluation surveys, PDMs, quarterly assessments etc."),
                                              tags$li("Conduct and write reports on focused group discussions, case studies, and key informant interviews."),
                                              tags$li("Conduct regular monitoring visits and collaborate with project teams to ensure project quality. "),
                                            )
                                        )
                                    )
                                )
                            ) # Col2
                        ), 
                        # Second Row First Col
                        div(class = "row",
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse3", "PhD Candidate - TCD", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse3" # Change number here
                                          )
                                        ),
                                        p("February 2022 - March 2023"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I researched on the topic named “Support Afforestation with the Aid of Statistics”."),
                                        tags$a(href = "#collapse3","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse3", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse3", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Developed four new spatial metrics to model species community-level neighborhood interactions."),
                                              tags$li("Implemented Diversity Interactions’ (DI) models on simulated forest tree data."),
                                              tags$li("Conducted a simulation study and identified the limitations and breaking points of the new modeling approach."),
                                              tags$li("Developed R package to compare different models using one function that evaluates the nested statistical models using three statistics F-Test, AIC, AIC (Corrected) and BIC. (Unpublished)."),
                                              tags$li("Implemented matrix calculations and statistical modellings extensively to simulate the artificial forest environments with different tree species diversity configurations."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Invent an innovative modeling approach to model diversity interactions amongst the forest tree species."),
                                              tags$li("Explore the existing modeling approaches with their merits and demerits."),
                                              tags$li("Develop new metrics for improved modelling with concept."),
                                              tags$li("Showcase the credibility of the new model/'s"),
                                              
                                            )
                                        )
                                    )
                                )
                            ), # Col1
                            # Second Row Second Col
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse4", "MERL Officer - DRC", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse1" # Change number here
                                          )
                                        ),
                                        p("May 2021 - February 2022"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I Worked as a part of the MEAL team and supported multiple projects (livelihood, WASH) in 4 Rohingya Refugee Camps in Ukhiya, Cox’s Bazar, Bangladesh."),
                                        tags$a(href = "#collapse4","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse4", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse4", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Developed and updateed program quality management tool such as logical framework analysis, MEAL plans, and performance indicator tracking tables for different projects."),
                                              tags$li("Designed, conduct, and report baseline and endline evaluation surveys, PDM etc."),
                                              tags$li("Conduct and write reports on focused group discussions, case studies, and key informant interviews."),
                                              tags$li("Conduct regular monitoring visits and collaborate with project teams to ensure project quality."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Developing and updating program quality management tools such as logical framework analysis, MEAL plans, and performance indicator tracking tables and dashboards using Power BI for different projects."),
                                              tags$li("Design, conduct, and report on the baseline & endline evaluation surveys, PDMs, quarterly assessments etc."),
                                              tags$li("Conduct and write reports on focused group discussions, case studies, and key informant interviews."),
                                              tags$li("Conduct regular monitoring visits and collaborate with project teams to ensure project quality. "),
                                            )
                                        )
                                    )
                                )
                            ) # Col2
                        ), # Row 2
                        # Third Row First Col
                        div(class = "row",
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse5", "Technical Officer - BRAC", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse5" # Change number here
                                          )
                                        ),
                                        p("December 2020 - April 2021"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summmary:"), "I worked as a part of the WASH project team and supported the UNICEF funded WASH project in three Rohingya camps (14, 15, and 8W) in Ukhiya, Cox’s Bazar, Bangladesh."),
                                        tags$a(href = "#collapse5","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse5", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse5", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("I supervised four field facilitators, developed complaints and feedback response mechanisms, and maintained all the facility operations, and sanitation condition updates by sharing the situation reports with pictures embedded into the xlsx data tables using VBA."),
                                              tags$li("Planned and conducted KAPB (knowledge, attitude, practice, and behavior) and report writing identifying the impact of the implemented project activities using Python and Latex."),
                                              tags$li("Conducted regular monitoring visits, onsite monitoring, post distribution monitoring, key informant interviews, etc."),
                                              tags$li("Supported to develop hygiene guidelines, WASH project proposal, and IEC materials."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Contribute to Overall program quality."),
                                              tags$li("Lead the CFRM team and develop the CFRM system."),
                                              tags$li("Contribute in the program tool development."),
                                              tags$li("Assessment of project processes and progresses."),
                                            )
                                        )
                                    )
                                )
                            ), # Col1
                            # Third Row Second Col
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse6", "MERL Officer - ACF", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse6" # Change number here
                                          )
                                        ),
                                        p("February 2020 - November 2020"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I worked as a part of the MEAL team and supported multiple projects (i.e., food security and livelihood, WASH, and Nutrition) in five Rohingya camps (23-27) in Teknaf, Cox’s Bazar, Bangladesh."),
                                        tags$a(href = "#collapse6","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse6", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse6", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Supported to develop logical framework analysis, MEAL plans, monitoring tools, etc."),
                                              tags$li("Conducted regular monitoring visits, onsite monitoring, post distribution monitoring, beneficiary satisfaction surveys, focused group discussions and other quantitative and qualitative assessments."),
                                              tags$li("Prepared dashboards using tableau and wrote baseline and end evaluation reports."),
                                              tags$li("Prepared geographical maps of the project implementing camps indicating different facilities (Wash Facilities) and infrastructure (Nutrition centers, MHPSS centers, FSL Centers) using QGIS."),
                                              tags$li("Conducted data collection, cleaning, validation, analysis, and reporting using Python (Data Preparation) and R (Visualization {ggplot2}, {Rmardown})."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Support with MEAL activities in the responsible camp areas."),
                                              tags$li("Contribute to the overall MEAL system"),
                                              tags$li("Support in programme evaluations."),
                                              tags$li("Support in report writing and tool developments."),
                                              tags$li("Conduct regular monitoring visits and write weekly, monthly, bi-yearly, and yearly reports."),
                                            )
                                        )
                                    )
                                )
                            ) # Col2
                        ),
                        # Fourth Row First Col
                        div(class = "row",
                            div(class = "col-sm-6",
                                div(class = "card",
                                    div(class = "card-body",
                                        h4(
                                          tags$a(href = "#collapse7", "MERL Officer - Shushilan", # Change number here
                                                 `data-toggle` = "collapse", 
                                                 `aria-expanded` = "false", 
                                                 `aria-controls` = "collapse7" # Change number here
                                          )
                                        ),
                                        p("October 2019 - February 2024"),
                                        p(tags$b("Tools Utilized:"), "D3.js, Python, R, Javascript, LookerStudio, Stata, SPSS, Orange."),
                                        p(tags$b("Summary:"), "I worked as a part of the IOM funded WASH project team in Rohingya Camp 12 in Ukhiya, Cox’s Bazar, Bangladesh."),
                                        tags$a(href = "#collapse7","See More", # Change number here
                                               `data-toggle` = "collapse", 
                                               `aria-expanded` = "false", 
                                               `aria-controls` = "collapse7", # Change number here
                                               style=("font-size:15px;")
                                        ),
                                        div(id = "collapse7", class = "collapse", # Change number here
                                            p(tags$b("Achievements:")),
                                            tags$ul(
                                              tags$li("Developed data flow management system, monitoring toolkits using Kobo Toolbox, and prepared facility maps of the camp."),
                                              tags$li("Provided technical trainings to the project team members on data collection and quality of the data."),
                                              tags$li("Prepared different reports such as monthly activity update reports, 4W and 5W reports etc."),
                                              tags$li("Developed WASH Facility Mapping of Camp 12 using QGIS."),
                                              tags$li("Data cleaning and analysis using SPSS."),
                                              tags$li("Represented the organization in different coordination meetings, e.g., camp coordination meetings."),
                                            ),
                                            p(tags$b("Key Responsibilities:")),
                                            tags$ul(
                                              tags$li("Conducting regualar onsight monitoring visits and reporting."),
                                              tags$li("Develop the project LFA from the information available in the project proposal."),
                                              tags$li("Ensure program quality and implementation."),
                                              tags$li("Ensure the accuracy of the quantitative results and ensure DQA"),
                                              tags$li("Support in enhanching the quality of the qualitative reports."),
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    ) # Container
             ) # Column
           )
  ),

  # Projects tab
  ##################################################################################################
  tabPanel(p(class="gradient-text-tab","Projects"),
           fluidRow(
             # Common Start ----------------------------------------------------------------Common Start
             column(3, # Left Column Common for All
                    div(style = "background-color: #CADCFC; padding: 20px; border-radius: 10px;",
                        # -----------------------------------------------------------------------------------
                        h3("Tasbiul Islam Nibir"),
                        p(tags$b(style = "padding-left: 30px;padding-bottom: px;", "Nationality:"), "Bangladeshi"),
                        p(tags$b(style = "padding-left: 30px;", "Current Designation:"), "MERL Specialist"),
                        p(tags$b(style = "padding-left: 30px;", "Current Organizatsion:"), "iDE Global"),
                        p(tags$b(style = "padding-left: 30px;", "Present Address:"), "Dhaka, Bangladesh"),
                        
                        p(tags$b(style = "padding-left: 30px;", "Contacts:"), tags$a(href = "www.linkedin.com/in/tasbiul", "linkedin"),"|",
                          tags$a(href = "https://sites.google.com/view/tasbiul-islam-nibir/home", "Website"),"|",
                          tags$a(href = "mailto:tasbiulnibir@gmail.com", "Email")),
                        tags$a(href = "tel:+8801789465406", "Call Me on Mobile", 
                               style = "padding-left: 95px; font-size: 15px; color: blue; text-decoration: underline;"),
                        tags$br(),
                        tags$a(href = "https://wa.me/8801789465406", "Chat with Me on WhatsApp", 
                               style = "padding-left: 95px; font-size: 15px; color: green; text-decoration: underline;"),
                        tags$hr(),
                        
                        # -----------------------------------------------------------------------------------
                        h5("Experienced with"),
                        tags$ul(
                          tags$li("Data Analysis and Visualization"),
                          tags$li("Research Design and Sampling"),
                          tags$li("Developing Customized R Packages"),
                          tags$li("Dashboard Designing"),
                          tags$li("GIS and Remote Sensing")),
                        tags$hr(),
                        h5("Skills"),
                        tags$ul(
                          tags$li("Data Analysis"),
                          tags$li("R, Python, Shiny, D3.js"),
                          tags$li("MERL Frameworks"),
                          tags$li("Dashboard Development")
                        ),
                        tags$hr(),
                        # -----------------------------------------------------------------------------------
                        h5("References"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                        tags$ul(tags$li(tags$b("A. M. Humayun Rashid")),
                                "MEAL Expert",tags$br(),
                                tags$b("IRC"),tags$br(),
                                "Email:rupu@gmail.com",tags$br(),
                                "Phone: +8801717115617"),
                    )
             ),
             # Common End ----------------------------------------------------------------Common End
             column(9,
                    tags$h3("Projects",
                            style = "margin-top:25px;"),
                    h4(p("Project 1:", tags$b("Free of Cost", style="color: blue"), "Real Time MIS & Dashboard")),
                    p("In this project I used looker studio coupled with google sheet script and kobo toolbox."),
                    tags$ul(
                      tags$li("I first developed a data collection tool using a kobo toolbox xlsx format where the backend 
                      names for the questions and choice are well planned according to the needs of the dashboard."),
                      tags$li("Then I obtained the JSON api of the Kobo toolbox server."),
                      tags$li("In kobo toolbox setting I have enabled the data to be access publicly with the respective link."),
                      tags$li("Then I used javascript code to import and make a table in gsheet using the google sheet script."),
                      tags$li("Then I gsheet feature named 'trigger' based on time, to run the respective java script code after a certain time inteval."),
                      tags$li("This way I got the automated data sheet for the dashboard"),
                      tags$li("Further using looker studio I developed a dashboard so that project stakeholders can get access to the updates on the data being collected in real time."),
                    )
                      ,
                    br(),
                    h4("Project 2"),
                    p("Description of project 2...")
             )
           )
  ),
)

################################################################################## 
################# server ###############################
################################################################################## 
server <- function(input, output) {
  # Rendering leaflet map
  output$workMap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 40, lat = 42, zoom = 3) %>%
      addMarkers(lng = 90.4125, lat = 23.8103, 
                 popup = "<b>Bangladesh</b><br>Khulna University, Shushilan, ACF, BRAC, DRC & iDE",
                 label = "Bangladesh") %>%
      addMarkers(lng = -8.2439, lat = 53.4129, 
                 popup = "<b>Ireland</b><br>Trinity College Dublin",
                 label = "Ireland")
  })
  # Rendering timeline
  output$timeLine <- renderTimevis({
    timevis(
      data.frame(
        id = c(1:13),
        content = c("Childhood","Primary School","Secondary School Certificate","Higher Secondary School","Khulna University (Honors)","Khulna University (Masters)","Shushilan", "Action Contre la Faim", "BRAC", "Danish Refugee Council", 
                    "Trinity College Dublin", "Danish Refugee Council", "iDE Bangladesh"),
        start = c("1996-10-14","2001-01-01","2006-01-01","2011-01-01","2014-11-09","2018-11-09","2019-10-03", "2020-02-27", "2020-12-20", "2021-05-25", "2022-03-01", "2023-08-27", "2024-02-01"),
        end = c("2000-12-30","2005-11-01","2010-11-01","2013-11-01","2018-09-25","2020-02-12","2020-02-26", "2020-11-30", "2021-04-25", "2022-02-20", "2023-07-25", "2023-12-30", "2024-12-31")
      ),
      options = list(
        min = "1995-01-01",
        max = "2026-12-31"
      )
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
