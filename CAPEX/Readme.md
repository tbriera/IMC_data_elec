# CAPEX data

## Sources

**For variable renewable + CSP** *($2019)*

IRENA (2020) Renewable Power Generation Costs in 2019 when data for 2014 is available. When it is not, the 2019 data is used to go "backwards" on the learning curve, assuming the relationship between the installed capacity and the investment costs hold for the 2014-2019 years. See the Capex_process.Rmd notebook for more details.

**For coal, gas, hydro and nuclear technologies** *($2019)* 

World Energy Outlook 2021 (IEA).

IMACLIM-R - WEO assumptions for technologies:
||WEO technology|
|---|---|
|IMACLIM-R Technology |SUB/ Steam Coal - Subcritical |
||PFC / Steam Coal - Supercritical|
||USC / Steam Coal - Ultrasupercritical|
||ICG / IGCC|
||GGT / Gas Turbine|
||GGC / CCGT|
||HYD / Hydropower - large-scale unit|
||NUC / Nuclear|

Cost addition (in $2019) for CCS:
|IMACLIM-R CCS Technology|IMACLIM-R Conventional Technology|Cost addition|
|---|---|---|
|PSS|PFC|3000|
|CGS|ICG|3000|
|UCS|USC|3000|
|GGS|GGC|2000|

Assumptions for regions:
|||WEO region/country||
|---|---|---|---|
||USA / United Stated||IND / India|
||CAN / United Stated||BRA / Brazil|
|IMACLIM-R region/country |EUR / Europe||MDE / Middle East|
||OECD / Japan||AFR / Africa|
||CIS / EUR||RAS / China|
||CHN / China||RAL / Brazil|


**For biomass technologies** *(€2015)*

JRC Technical Reports (2018) "Cost development of low carbon energy technologies" DOI:10.2760/490059, p.44 (Anaerobic digestion plant). Addition of $3000 ($2019) for biomass with CCS.

**For oil technologies** *($2014)*

POLES model assumptions


