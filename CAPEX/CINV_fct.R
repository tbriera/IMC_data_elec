################################################################################
################################################################################
################### Capex process functions ####################################
################################################################################
################################################################################

#The two functions CIV_paste and CINV_Compute are mean to be executed one after
#the other to create a technology-specific dataset (to be merge together therefter)

#function to paste 2019 CINV to the right region
CINV_paste <- function(data,techno,costs){
  #data: a df with at least Technology and Region columns
  #techno: a string of character corresponding to the renewable techno under study
  #costs: a 12x1 vector of costs (here 2019 costs)
  data %>% filter(Technology == techno) %>% mutate(CINV_2019 = case_when(
    Region == Reg_IMC[1] ~ costs[1],
    Region == Reg_IMC[2] ~ costs[2],
    Region == Reg_IMC[3] ~ costs[3],
    Region == Reg_IMC[4] ~ costs[4],
    Region == Reg_IMC[5] ~ costs[5],
    Region == Reg_IMC[6] ~ costs[6],
    Region == Reg_IMC[7] ~ costs[7],
    Region == Reg_IMC[8] ~ costs[8],
    Region == Reg_IMC[9] ~ costs[9],
    Region == Reg_IMC[10] ~ costs[10],
    Region == Reg_IMC[11] ~ costs[11],
    Region == Reg_IMC[12] ~ costs[12]
  ))}
#Compute CINV costs for WND, CPV and RPV based on step 1 & step 2 (see the intro)
CINV_Compute <- function(data,techno,costs_base){
    #data: same as CINV_paste
    #techno : same as CINV_paste
    # costs_base: a 12x1 vector of base costs
  
  #Step one: get IRENA (2020a) 2014 costs (0 if not available)
  for (i in 1:length(Reg_IMC)){
    for(j in 1:length(Reg_IMC)){
      if (data$Region[i] == Reg_IMC[j]){
        data$CINV_base_IRENA[i] <- costs_base[j]
      } else{}
    }
  }
  #Step two: Compute CINV_base based on learning curve formula
  
  #We compute CINV_base from the learning curve. If the cost reduction is greater
  #than the greatest observed in IRENA WEO data (IRENA 2020b), then we apply the IRENA cost reduction to the IEA 2019 data.
  data <- data %>% mutate(CINV_base = round(CINV_2019*(Q/Qref)^(-log(1-PR)/log(2)),0)) %>% 
    mutate(CINV_base = case_when(
      CINV_base*(1-cost_red_max[[techno]]) < CINV_2019 ~ CINV_base,
      CINV_base*(1-cost_red_max[[techno]]) > CINV_2019 ~ CINV_2019/(1-cost_red_max[[techno]])
    )) 
  
  #CINV base is replaced by hardcoded data from IRENA when available (= if step 1 yields results
  #then the processed data from step 2 is replaced by step 1's data)
  data$CINV_base <- ifelse(data$CINV_base_IRENA > 0, data$CINV_base_IRENA, data$CINV_base)
  data #to get the final output of the function
}
  
  