**LELO NXUMALO
clear all
set mem 10000
cd "C:***\WB Enterprise Surveys\" 
set more off
use "Zimbabwe-2016-full data.dta", clear
*encode  countryname, gen(countryname2)

rename	a4a	industry
rename	d3a	dom_sales
rename	d3b	ind_exp
rename	d3c	dir_exp
rename m1a obstacle
rename d30a transport
rename c30b telco
rename j30a tax
rename j30b taxadmin
rename e30 informality
rename j30e pol_instab
rename l30a lab_regs
rename zimj30 indig
rename l30b labour
rename c30a electr
rename i30 crime
rename h30 courts
rename j30f corruption
rename k30 finance


tabulate stratificationregioncode
tabstat dom_sales ind_exp dir_exp, by(stratificationregioncode) stat(mean) //direction of trade
tabstat dom_sales ind_exp dir_exp if stratificationregioncode==2, by( industry ) stat(mean) //Harare
tabstat dom_sales ind_exp dir_exp if stratificationregioncode==1, by( industry ) stat(mean) //Bulawayo


tab obstacle, sort
tab obstacle if stratificationregioncode==1, sort
tab obstacle if stratificationregioncode==2, sort

graph hbar (count) id, over(obstacle) nofill //overall
graph bar (count) id, over(transport) nofill //transport
graph bar (count) id, over( telco ) nofill //telecoms
graph bar (count) id, over( tax ) nofill //tax rates
graph bar (count) id, over( taxadmin ) nofill //tax admin
graph bar (count) id, over( informality ) nofill //informality
graph bar (count) id, over( pol_instab ) nofill //pol instability
graph hbar (count) id, over( lab_regs ) nofill //labor regulations
graph bar (count) id, over( indig ) nofill //indiginization
graph bar (count) id, over( labour ) nofill //inadequately educated labour
graph bar (count) id, over( electr ) nofill //electricity
graph bar (count) id, over( crime ) nofill //crime
graph bar (count) id, over( courts ) nofill //courts
graph bar (count) id, over( corruption ) nofill //corruption
graph bar (count) id, over( finance ) nofill //corruption





