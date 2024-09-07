# instalar paquetes ####
install.packages("tidyverse")
install.packages("openxlsx")
install.packages("readr")
install.packages("janitor")
install.packages("rstatix")


# cargar paquetes------
library(tidyverse)
stats::filter 
library(openxlsx)
library(readr)
library(janitor)
stats::chisq.test
stats::fisher.test
library(rstatix)

# importar data--------
datos<-read.xlsx("DATA_STATA/DATA/DatosStata.xlsx")

# explorando el objeto datos------
str(datos)
names(DATA)

datos_ex <-datos %>% select (- c(Número.de.accionistas,DM.Edad,ADV.Edad)) #eliminar duplicados


# Diccionario de traducción
DATA <- datos_ex %>%
  rename(
    "Year" = "Año",
    "ID" = "Id.",
    "Identity" = "Ident",
    "Gender" = "Género",
    "Company_Name" = "Nombre.empresa",
    "City" = "Ciudad",
    "Country_ISO_Code" = "Código.ISO.del.país",
    "Total_Assets" = "Activos.totales",
    "Growth" = "Grow",
    "GDP" = "PIB",
    "GDP_Var" = "VarPIB",
    "Inflation" = "Inflacion",
    "Ln_GDP" = "LnPIB",
    "Ln_Inflation" = "LnInflacion",
    "Country" = "Pais",
    "NACE_Code" = "NACE.code",
    "Employees_Last_Year" = "Número.empleados.Últ..año.disp.",
    "Standard_Legal_Form" = "Forma.jurídica.estándar",
    "Legal_Form_Tabul" = "FJurídicaTabul",
    "Legal_Form" = "FormaJurídica",
    "Incorporation_Date" = "Fecha.de.constitución",
    "End_Date" = "Fecha.final",
    "Seniority" = "Antigüedad",
    "Ln_Seniority" = "LnAntigüedad",
    "Cash_Flows" = "Flujos.de.Caja",
    "Fixed_Assets" = "Activos.Fijos",
    "Current_Assets" = "Activos.Corrientes",
    "Inventory" = "Stock",
    "Receivables" = "Deudores",
    "Other_Current_Assets" = "Otros.activos.corrientes",
    "Cash_and_Equivalents" = "Efectivo.y.equivalentes",
    "Ln_Fixed_Assets" = "LnActFijo",
    "Ln_Current_Assets" = "LnActCorr",
    "Ln_Inventory" = "LnStock",
    "Ln_Receivables" = "LnDeudores",
    "Ln_Other_Assets" = "LnOtrosactiv",
    "Ln_Cash" = "LnEfectivo",
    "Ln_Total_Assets" = "LnActTotal",
    "Non_Current_Liabilities" = "Pasivos.no.corrientes",
    "Current_Liabilities" = "Pasivos.Corrientes",
    "Liquidity1" = "Liquidez1",
    "Liquidity1_Dummy" = "Liquidez1Dummy",
    "Total_Liabilities" = "Pasivo.Total",
    "Equity" = "Fondos.Propios",
    "Ln_Non_Current_Liabilities" = "LnPasivoNoCorr",
    "Ln_Current_Liabilities" = "LnPasivoCorr",
    "Ln_Total_Liabilities" = "LnPasivoTotal",
    "Ln_Equity" = "LnFondosPropios",
    "Operating_Revenue" = "Ingresos.Explotación",
    "Operating_Profit" = "Resultado.Explotación",
    "Financial_Expenses" = "Gastos.Financieros",
    "Ordinary_Profit_Before_Tax" = "Rdo..Ordinario.antes.Impuestos",
    "Taxes" = "Impuestos",
    "Ordinary_Activities_Profit" = "Rdo..Actividades.Odinarias",
    "Extraordinary_and_Other_Profit" = "Rdo..Extr..y.Otros",
    "Net_Profit" = "Rdo.Ejercicio",
    "ROE" = "ROE",
    "ROA" = "ROA",
    "Collection_Period" = "Período.de.Cobro",
    "Credit_Period" = "Período.de.Credito",
    "ROEE" = "ROEE",
    "ROAA" = "ROAA",
    "CollectionPeriod" = "PeríodoCobro",
    "Payment_Period" = "PeríodoPago",
    "PMC_PMP" = "PMC-PMP",
    "Net_Asset_Turnover" = "Rotación.de.activos.netos",
    "Inventory_Turnover" = "Rotación.de.las.existencias",
    "Solvency_Turnover" = "Rotacion.de.Solvencia",
    "Asset_Turnover" = "RotacActivos",
    "InventoryTurnover" = "RotacExistenc",
    "SolvencyTurnover" = "RotacSolvencia",
    "Liquidity_Ratio" = "Ratio.de.Liquidez",
    "Leverage" = "Apalancamiento",
    "Profit_per_Employee" = "Beneficio.por.empleado",
    "Operating_Revenue_per_Employee" = "Ingresos.Explotación.por.empleado",
    "Average_Employee_Cost" = "Coste.medio.Empleados",
    "Total_Assets_per_Employee" = "Total.acivos.por.empleado",
    "Levera" = "Apalancam",
    "Profit_Employee" = "Benefic/empleado",
    "OperatingRevenue_Employee" = "IngrExpl/empleado",
    "Cost_Employee" = "Coste/empleado",
    "Assets_Employee" = "Activos/empleado",
    "Number_of_Board_and_Management_Members" = "Nümero.de.miembros.de.las.juntas.&.gestión",
    "Board_Members" = "MiembrosJuntas",
    "DM_Full_Name" = "DM.Nombre.completo",
    "DM_Job_Title" = "DM.Título.trabajo",
    "Shareholder_Direct_Percentage" = "Accionista.-.%.directo",
    "Shareholder_Total_Percentage" = "Accionista.-.%.total",
    "CSH_Direct_Percentage" = "CSH.-.%.directo",
    "DM_Original_Job_Title" = "DM.Título.original.trabajo",
    "DM_Board_Committee_or_Executive_Department" = "DM.Junta,.comité.or.departamento.ejecutivo",
    "DM_Level_of_Responsibility" = "DM.Nivel.de.responsabilidad",
    "DM_First_Name" = "DM.Nombre",
    "DM_Last_Name" = "DM.Apellido",
    "DM_Gender" = "DM.Género",
    "DM_Nationality_Country" = "DM.País.de.nacionalidad",
    "DM_Also_a_Shareholder" = "DM.También.un.accionista",
    "DM_Position_Type" = "DM.Tipo.de.posición",
    "Number_of_Advisors" = "Número.de.asesores",
    "ADV_First_Name" = "ADV.Nombre",
    "ADV_Last_Name" = "ADV.Apellido",
    "ADV_Gender" = "ADV.Género",
    "ADV_Nationality_Country" = "ADV.País.de.nacionalidad",
    "Nationality_Country" = "País.de.nacionalidad",
    "Number_of_Employees" = "Número.empleados",
    "BvD_Independence_Indicator" = "Indicador.independencia.BvD"
  )


colnames(DATA)
str(DATA)
DATA_Manipulada <- DATA %>%
  mutate(
    # Conversión de columnas a numérico
    Growth = parse_number(Growth, locale = locale(decimal_mark = ".")),
    Ln_Inflation = parse_number(Ln_Inflation, locale = locale(decimal_mark = ".")),
    Ln_Seniority = parse_number(Ln_Seniority, locale = locale(decimal_mark = ".")),
    Ln_Fixed_Assets = parse_number(Ln_Fixed_Assets, locale = locale(decimal_mark = ".")),
    Ln_Current_Assets = parse_number(Ln_Current_Assets, locale = locale(decimal_mark = ".")),
    Ln_Inventory = parse_number(Ln_Inventory, locale = locale(decimal_mark = ".")),
    Ln_Receivables = parse_number(Ln_Receivables, locale = locale(decimal_mark = ".")),
    Ln_Other_Assets = parse_number(Ln_Other_Assets, locale = locale(decimal_mark = ".")),
    Ln_Cash = parse_number(Ln_Cash, locale = locale(decimal_mark = ".")),
    Ln_Total_Assets = parse_number(Ln_Total_Assets, locale = locale(decimal_mark = ".")),
    Liquidity1 = parse_number(Liquidity1, locale = locale(decimal_mark = ".")),
    Liquidity1_Dummy = parse_number(Liquidity1_Dummy, locale = locale(decimal_mark = ".")),
    Ln_Non_Current_Liabilities = parse_number(Ln_Non_Current_Liabilities, locale = locale(decimal_mark = ".")),
    Ln_Current_Liabilities = parse_number(Ln_Current_Liabilities, locale = locale(decimal_mark = ".")),
    Ln_Total_Liabilities = parse_number(Ln_Total_Liabilities, locale = locale(decimal_mark = ".")),
    Ln_Equity = parse_number(Ln_Equity, locale = locale(decimal_mark = ".")),
    ROE = parse_number(ROE, locale = locale(decimal_mark = ".")),
    ROA = parse_number(ROA, locale = locale(decimal_mark = ".")),
    Collection_Period = parse_number(Collection_Period, locale = locale(decimal_mark = ".")),
    Credit_Period = parse_number(Credit_Period, locale = locale(decimal_mark = ".")),
    ROEE = parse_number(ROEE, locale = locale(decimal_mark = ".")),
    ROAA = parse_number(ROAA, locale = locale(decimal_mark = ".")),
    CollectionPeriod = parse_number(CollectionPeriod, locale = locale(decimal_mark = ".")),
    Payment_Period = parse_number(Payment_Period, locale = locale(decimal_mark = ".")),
    PMC_PMP = parse_number(PMC_PMP, locale = locale(decimal_mark = ".")),
    Net_Asset_Turnover = parse_number(Net_Asset_Turnover, locale = locale(decimal_mark = ".")),
    Inventory_Turnover = parse_number(Inventory_Turnover, locale = locale(decimal_mark = ".")),
    Solvency_Turnover = parse_number(Solvency_Turnover, locale = locale(decimal_mark = ".")),
    Asset_Turnover = parse_number(Asset_Turnover, locale = locale(decimal_mark = ".")),
    InventoryTurnover = parse_number(InventoryTurnover, locale = locale(decimal_mark = ".")),
    SolvencyTurnover = parse_number(SolvencyTurnover, locale = locale(decimal_mark = ".")),
    Liquidity_Ratio = parse_number(Liquidity_Ratio, locale = locale(decimal_mark = ".")),
    Leverage = parse_number(Leverage, locale = locale(decimal_mark = ".")),
    Profit_per_Employee = parse_number(Profit_per_Employee, locale = locale(decimal_mark = ".")),
    Operating_Revenue_per_Employee = parse_number(Operating_Revenue_per_Employee, locale = locale(decimal_mark = ".")),
    Levera = parse_number(Levera, locale = locale(decimal_mark = ".")),
    Profit_Employee = parse_number(Profit_Employee, locale = locale(decimal_mark = ".")),
    OperatingRevenue_Employee = parse_number(OperatingRevenue_Employee, locale = locale(decimal_mark = ".")),
    Shareholder_Direct_Percentage = parse_number(Shareholder_Direct_Percentage, locale = locale(decimal_mark = ".")),
    Shareholder_Total_Percentage = parse_number(Shareholder_Total_Percentage, locale = locale(decimal_mark = ".")),
    CSH_Direct_Percentage = parse_number(CSH_Direct_Percentage, locale = locale(decimal_mark = ".")),
 
    # Conversión de columnas a Date 
    Incorporation_Date = as.Date(Incorporation_Date, origin = "1899-12-30"),
    End_Date = as.Date(End_Date, origin = "1899-12-30"),

   # Conversión de columnas a character
    Country = as.character(Country),
    Identity = as.character(Identity),
    Legal_Form = as.character(Legal_Form),
    Legal_Form_Tabul = as.character(Legal_Form_Tabul),
   
   #Conversion de columnas a factor
    ADV_Gender= parse_factor(ADV_Gender,
                             levels = c("M","F","M\nM","M\nM\nM","M\nF"),
                             ordered = TRUE),
    BvD_Independence_Indicator= parse_factor(BvD_Independence_Indicator,
                                             levels = c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "U"),
                                             ordered = TRUE),
    Standard_Legal_Form = parse_factor(Standard_Legal_Form,
                                       levels = c("Public limited companies", "Private limited companies", "Partnerships", "Other legal forms"),
                                       ordered = FALSE))


str(DATA_Manipulada)
sapply(DATA_Manipulada, class) #mostrara el nombre de las variables con los tipos de datos 



#CREACION Y CALCULO DE LAS VARIABLES FALTANTES

DATA_Manipulada<- DATA_Manipulada %>%
  mutate(Debt = Total_Liabilities / Total_Assets,
         OpInc= log(Operating_Revenue),
         AssetT = Operating_Revenue / Total_Assets ,
         StockT = Operating_Revenue / Inventory,
         Age = Seniority / 365 )%>% view()


#selección de variables(existentes en la DATA) a utilizar para la Tabla 1
DATAM_SELECT <- DATA_Manipulada %>%
  select(ROE, ROA, Ln_Total_Assets,Debt, Growth, GDP_Var, Inflation, Gender, OpInc,
         StockT, AssetT, CollectionPeriod, 
         Payment_Period, Age, Legal_Form, Country) %>%
  rename(
    Size = Ln_Total_Assets,
    VarGDP = GDP_Var,
    Inflat = Inflation,
    ARP = CollectionPeriod,
    APP = Payment_Period,
    LForm = Legal_Form
  )

#aplica a todas las columnas numéricas, redondeando los valores a dos decimales.
DATA_SELECT <- DATAM_SELECT %>%
  mutate(across(where(is.numeric), ~ round(.x, 2))) %>%
  view()


#FILTAR OBSERVACION SEGUN EL PAIS
OB_ES<-DATA_SELECT %>% filter(Country=="1") #ESPAÑA
OB_IT<-DATA_SELECT %>% filter(Country=="0") #ITALIA

GENERAL <- DATA_SELECT %>% select (-c (Country, LForm))%>% view() 
ESPAÑA <-OB_ES %>% select (-c (Country, LForm))%>% view() 
ITALIA<- OB_IT %>% select (-c (Country, LForm))%>% view() 


#RESUMENES ESTADISTICO POR CRITERIOS (GENERAL, ESPAÑA, ITALIA)
GENERAL %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RE G")
ESPAÑA %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RE ES")
ITALIA %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RE IT")

#FORMA 2 

# obtener el resumen estadístico (EXCLUYENFO VALORES NO DESADOS INF)
# se convirtio a NA los valores INF, para que no interfieran en el resumen estadistico 
G <- GENERAL %>%
  mutate(across(everything(), ~ ifelse(is.infinite(.), NA, .)))
RE_G<- G %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RG")

E <- ESPAÑA %>%
  mutate(across(everything(), ~ ifelse(is.infinite(.), NA, .)))
RE_E <- E %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RE")

I <- ITALIA %>%
  mutate(across(everything(), ~ ifelse(is.infinite(.), NA, .)))
RE_I<- I %>% get_summary_stats() %>% select(variable, mean, sd, min, max)%>% view("RI")

RE_UNIDO_ES_IT <- full_join(RE_E, RE_I, by = "variable") %>% view()



#TABLA 3

LF_GENERAL <- DATA_SELECT %>% count(LForm) %>% rename("Total sample" = n)%>% view("LF_GENERAL") 
LF_ESPAÑA<- OB_ES %>% count(LForm) %>% rename(Spain = n) %>% view("LF_ESPAÑA")
LF_ITALIA<- OB_IT %>% count(LForm) %>% rename(Italy = n)%>% view("LF_ITALIA")

# Unir las tablas por 'LForm' (el tipo de empresa)
T_LEGAL_FORM <- LF_GENERAL %>%
  full_join(LF_ESPAÑA, by = "LForm") %>%
  full_join(LF_ITALIA, by = "LForm")  %>% view()
# Rellenar con ceros en caso de valores faltantes
T_LEGAL_FORM[is.na(T_LEGAL_FORM)] <- 0

DATA_Manipulada %>% distinct(Standard_Legal_Form)
tipo_empresa <- c("0" = "Public limited company", 
                  "1" = "Private limited company", 
                  "3" = "Cooperative", 
                  "4" = "Other legal forms")
# Reemplazar los códigos numéricos con los nombres de tipos de empresas
T_LEGAL_FORM <-T_LEGAL_FORM %>%
  mutate(LForm = tipo_empresa[as.character(LForm)])%>% 
  rename("Legal form" = LForm)

View(T_LEGAL_FORM)

