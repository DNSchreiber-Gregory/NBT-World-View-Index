/******************************************************************************************************************

Program to combine files for Nature Biotechnology Project
* Note: need to convert xlsm to xlsx before import

Created by: Deanna Schreiber-Gregory

Creation Date: 5/31/2021

*******************************************************************************************************************/

proc import out=EnterpriseFile datafile='H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\CombinedFile.xlsx' dbms=xlsx replace;
sheet='EnterpriseFile';
getnames=yes;
run;

proc sort data=EnterpriseFile;
	by Country;
run;

proc import out=EducationFile datafile='H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\CombinedFile.xlsx' dbms=xlsx replace;
sheet='EducationFile';
getnames=yes;
run;

proc sort data=EducationFile;
	by Country;
run;

proc import out=EnterpriseSupportFile datafile='H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\CombinedFile.xlsx' dbms=xlsx replace;
sheet='EnterpriseSupportFile';
getnames=yes;
run;

proc sort data=EnterpriseSupportFile;
	by Country;
run;

proc import out=FoundationsFile datafile='H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\CombinedFile.xlsx' dbms=xlsx replace;
sheet='FoundationsFile';
getnames=yes;
run;

proc sort data=FoundationsFile;
	by Country;
run;

proc import out=IPProtectionFile datafile='H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\CombinedFile.xlsx' dbms=xlsx replace;
sheet='IPProtectionFile';
getnames=yes;
run;

proc sort data=IPProtectionFile;
	by Country;
run;

data CombinedFile;
	merge EducationFile EnterpriseFile EnterpriseSupportFile FoundationsFile IPProtectionFile;
	by Country;
run;

data CombinedFile;
	set CombinedFile;

length Public_Co_RD_Spend_2019_GDP 8.;
	Public_Co_RD_Spend_2019_GDP = Public_company_R_D_Spend_2019_pe * 1;
	label Public_Co_RD_Spend_2019_GDP = "Public company R and D Spend 2019 per GDP";
length Public_Co_Rev_2019_GDP 8.;
	Public_Co_Rev_2019_GDP = Public_company_revenue_2019_per * 1;
	label Public_Co_Rev_2019_GDP = "Public company revenue 2019 per GDP";
length Public_Co_Profit_2019_GDP 8.;	
	Public_Co_Profit_2019_GDP = Public_company_profit_2019_per_G * 1;
	label Public_Co_Profit_2019_GDP = "Public company profit 2019 per GDP";
length NumPublicBioCo_TotalPublicCos 8.;	
	NumPublicBioCo_TotalPublicCos = __PublicBioCo_Total_PublicCos * 1;
	label NumPublicBioCo_TotalPublicCos = "# PublicBioCo/Total PublicCos";
length OECD_Total_Biotech_Firms_by_Pop 8.;	
	OECD_Total_Biotech_Firms_by_Pop = OECD_Total_Biotech_firms_M_Pop * 1;
	label OECD_Total_Biotech_Firms_by_Pop = "OECD Total Biotech firms/M Pop";	
length CB_Perc_TotalCompanies 8.;	
	CB_Perc_TotalCompanies = CB_of_TotalCompanies * 1;
	label CB_Perc_TotalCompanies = "CB perc of TotalCompanies";	
length Employees_by_Pop 8.;	
	Employees_by_Pop = Employees_Pop * 1;	
	label Employees_by_Pop = "Employees/Pop";
length StIncoming_2018_Perc_StPop 8.;	
	StIncoming_2018_Perc_StPop = Incoming_students_2018_as___of_s * 1;
	label StIncoming_2018_Perc_StPop = "Incoming students 2018 as perc of student population";
length Change_StIncoming_13to18 8.;		
	Change_StIncoming_13to18 = CHANGE_IN_Incoming_students_2013 * 1;
	label Change_StIncoming_13to18 = "CHANGE IN Incoming students 2013-2018 as perc of student population";	
length StOutgoing_2018_Perc_StPop 8.;	
	StOutgoing_2018_Perc_StPop = Outgoing_students_as___of_studen * 1;
	label StOutgoing_2018_Perc_StPop = "Outgoing students as perc of student population";	
length Change_StOutgoing_13to18 8.;	
	Change_StOutgoing_13to18 = CHANGE_IN_outgoing_students_2013 * 1;
	label Change_StOutgoing_13to18 = "CHANGE IN outgoing students 2013-2018 as perc of student population";
length Researchers_Per_Mill 8.;		
	Researchers_Per_Mill = Researchers_per_Million * 1;
	label Researchers_Per_Mill = "Researchers per Million";	
length MF_BachDegPlus 8.;	
	MF_BachDegPlus = MF_BachPlus * 1;
	label MF_BachDegPlus = "Bachelors Degree Plus";
length Govt_Spend_Education_GDP 8.;		
	Govt_Spend_Education_GDP = GOVT_SPEND_ON_education__as___of * 1;
	label Govt_Spend_Education_GDP = "GOVT SPEND ON education, as perc of GDP";
length STEM_Grad_Perc_Graduates 8.;		
	STEM_Grad_Perc_Graduates = STEM_graduate__as___of_total_gra * 1;
	label STEM_Grad_Perc_Graduates = "STEM graduate, as perc of total graduates";
length FSTEM_Grad_Perc_FGraduates 8.;		
	FSTEM_Grad_Perc_FGraduates = Female_STEM_graduate__as___of_fe * 1;
	label FSTEM_Grad_Perc_FGraduates = "Female STEM graduate, as perc of female graduates";
length VC_Availability 8.;		
	VC_Availability = VAR2 * 1;	
	label VC_Availability = "VC Availability (Score, WEF)";
length VC_2019_Total_GDP 8.;	
	VC_2019_Total_GDP = Total_VC_19_GDP * 1;	
	label VC_2019_Total_GDP = "Total VC 19/GDP";
length VC_2019_Total_Biotech 8.;	
	VC_2019_Total_Biotech = VC_2019_Biotech_Total * 1;	
	label VC_2019_Total_Biotech = "VC 2019 Biotech/Total";
length VC_Growth_18to19 8.;	
	VC_Growth_18to19 = VC_Growth_2018_2019 * 1;
	label VC_Growth_18to19 = "VC Growth 2018-2019";	
length BiotechInv_2019_M_Pop 8.;	
	BiotechInv_2019_M_Pop = BiotechInvestors_2019_M_Pop * 1;
	label BiotechInv_2019_M_Pop = "BiotechInvestors 2019/M Pop";
length BiotechInv_TotalInv 8.;		
	BiotechInv_TotalInv = BiotechInv_Total_Investors * 1;
	label BiotechInv_TotalInv = "BiotechInv/Total Investors";	
length Biotech_VCBC_GDP 8.;	
	Biotech_VCBC_GDP = BiotechVCBC_GDP * 1;
	label Biotech_VCBC_GDP = "BiotechVCBC/GDP";	
length GERD_Perc_GDP_2018 8.;	
	GERD_Perc_GDP_2018 = GERD_as___of_GDP_2018 * 1;
	label GERD_Perc_GDP_2018 = "GERD as perc of GDP 2018";	
length OECD_Biotech_RD_BERD 8.;	
	OECD_Biotech_RD_BERD = OECD_BiotechRnD_as___of_BERD * 1;
	label OECD_Biotech_RD_BERD = "OECD BiotechRnD as perc of BERD";
length Nature_LS_TotalShare 8.;		
	Nature_LS_TotalShare = Nature_Index_LS_ofTotalShare_201 * 1;
	label Nature_LS_TotalShare = "Nature Index LS perc ofTotalShare 2019";	
length Nature_Delta_LS_2019 8.;	
	Nature_Delta_LS_2019 = Nature_Index_Delta_LS__2019 * 1;	
	label Nature_Delta_LS_2019 = "Nature Index Delta LS perc 2019";
length RuleofLaw_2018 8.;	
	RuleofLaw_2018 = Rule_of_Law_2018 * 1;	
	label RuleofLaw_2018 = "Rule of Law 2018";
length RuleofLaw_Change13to18 8.;	
	RuleofLaw_Change13to18 = Rule_of_Law_Change_2013_2018 * 1;
	label RuleofLaw_Change13to18 = "Rule of Law Change 2013-2018";
length Reg_Quality_2018 8.;		
	Reg_Quality_2018 = Regulatory_Quality_2018 * 1;
	label Reg_Quality_2018 = "Regulatory Quality 2018";	
length Reg_Quality_Change13to18 8.;	
	Reg_Quality_Change13to18 = Regulatory_Quality_Change_2013_2 * 1;
	label Reg_Quality_Change13to18 = "Regulatory Quality Change 2013-2018";	
length Social_Safety_Freedom 8.;	
	Social_Safety_Freedom = Social__Safety_and_Freedom * 1;	
	label Social_Safety_Freedom = "Social, Safety and Freedom";
length Social_Safety_Freedom_Change 8.;	
	Social_Safety_Freedom_Change = Change_in_Social__Safety_and_Fre * 1;
	label Social_Safety_Freedom_Change = "Change in Social, Safety and Freedom 2013-2019";
length Cluster_Dev 8.;		
	Cluster_Dev = Cluster_Development * 1;	
	label Cluster_Dev = "Cluster Development";
length Diversity_Workforce 8.;	
	Diversity_Workforce = Diversity_of_Workforce * 1;	
	label Diversity_Workforce = "Diversity of Workforce";
length Stakeholder_Collab 8.;	
	Stakeholder_Collab = Stakeholder_collaboration * 1;	
	label Stakeholder_Collab = "Stakeholder collaboration";
length WEF_Perc_IP_Protection 8.;	
	WEF_Perc_IP_Protection = WEF_Perceived_IP_Protection * 1;	
	label WEF_Perc_IP_Protection = "WEF Perceived IP Protection";
length Share_World_Biotech_Patents 8.;	
	Share_World_Biotech_Patents = Share_of_world_biotech_patents_p * 1;
	label Share_World_Biotech_Patents = "Share of world biotech patents per M Pop, OECD";
length Year5_Trend_Share_Biotech 8.;		
	Year5_Trend_Share_Biotech = _5_year_trend_in_share_of_biotec * 1;
	label Year5_Trend_Share_Biotech = "5 year trend in share of biotech patents, OECD";
length Compound_Score_US_CoC 8.;		
	Compound_Score_US_CoC = Compound_Score_from_US_Chamber_o * 1;
	label Compound_Score_US_CoC = "Compound Score from US Chamber of Commerce";	
length ResTech_per_Mill 8.;	
	ResTech_per_Mill = Res_Tech_per_Million * 1;	
	label ResTech_per_Mill = "Res+Tech per Million";
length Patent_File_Residents_M_Pop 8.;	
	Patent_File_Residents_M_Pop = Patent_filed_by_residents_per_M * 1;
	label Patent_File_Residents_M_Pop = "Patent filed by residents per M Pop";	
length Patents_per_M_Pop_2018 8.;	
	Patents_per_M_Pop_2018 = Patents_per_M_Pop__2018 * 1;
	label Patents_per_M_Pop_2018 = "Patents per M Pop, 2018";	
length Perc_Biotech_Patents_2018 8.;	
	Perc_Biotech_Patents_2018 = __Biotech_Patents__2018 * 1;	
	label Perc_Biotech_Patents_2018 = " perc Biotech Patents, 2018";
length Perc_LifeScience_Patents_2018 8.;	
	Perc_LifeScience_Patents_2018 = __life_Science_Patents__2018 * 1;
	label Perc_LifeScience_Patents_2018 = " perc life Science Patents, 2018";

drop Public_company_R_D_Spend_2019_pe	Public_company_revenue_2019_per	Public_company_profit_2019_per_G	__PublicBioCo_Total_PublicCos	OECD_Total_Biotech_firms_M_Pop	CB_of_TotalCompanies	Employees_Pop	Incoming_students_2018_as___of_s	CHANGE_IN_Incoming_students_2013	Outgoing_students_as___of_studen	CHANGE_IN_outgoing_students_2013	Researchers_per_Million	MF_BachPlus	GOVT_SPEND_ON_education__as___of	STEM_graduate__as___of_total_gra	Female_STEM_graduate__as___of_fe	VAR2	Total_VC_19_GDP	VC_2019_Biotech_Total	VC_Growth_2018_2019	BiotechInvestors_2019_M_Pop	BiotechInv_Total_Investors	BiotechVCBC_GDP	GERD_as___of_GDP_2018	OECD_BiotechRnD_as___of_BERD	Nature_Index_LS_ofTotalShare_201	Nature_Index_Delta_LS__2019	Rule_of_Law_2018	Rule_of_Law_Change_2013_2018	Regulatory_Quality_2018	Regulatory_Quality_Change_2013_2	Social__Safety_and_Freedom	Change_in_Social__Safety_and_Fre	Cluster_Development	Diversity_of_Workforce	Stakeholder_collaboration	WEF_Perceived_IP_Protection	Share_of_world_biotech_patents_p	_5_year_trend_in_share_of_biotec	Compound_Score_from_US_Chamber_o	Res_Tech_per_Million	Patent_filed_by_residents_per_M	Patents_per_M_Pop__2018	__Biotech_Patents__2018	__life_Science_Patents__2018
;
run;


/******************************************************************************************************************************************/
/********************* Note: Assumptions Violations of Multi-variate procedures, Tested through Correlation Coefficients ******************/
/******************************************************** Score Creation Step *************************************************************/
/******************************************************************************************************************************************/

/* Step 1: Determine necessary weights of individual scores - see Excel Spreadsheet */

/* Step 2: Calculate Z-Scores 
	if data is highly positively skewed then use logarithmic transformation before z-score calculation
	if data is highly negatively skewed then use square transformation before z-score calculation
	if skewed data contains 0s that are causing the skew, add 1, recalculate skew to confirm direction, and then transform */


	/* Check for Skewness / non-normality  - recorded in aforementioned Excel Spreadsheet */

	proc univariate data=CombinedFile normal; 
		qqplot Public_Co_RD_Spend_2019_GDP	Public_Co_Rev_2019_GDP	Public_Co_Profit_2019_GDP	NumPublicBioCo_TotalPublicCos	OECD_Total_Biotech_Firms_by_Pop	CB_Perc_TotalCompanies	Employees_by_Pop	StIncoming_2018_Perc_StPop	Change_StIncoming_13to18	StOutgoing_2018_Perc_StPop	Change_StOutgoing_13to18	Researchers_Per_Mill	MF_BachDegPlus	Govt_Spend_Education_GDP	STEM_Grad_Perc_Graduates	FSTEM_Grad_Perc_FGraduates	VC_Availability	VC_2019_Total_GDP	VC_2019_Total_Biotech	VC_Growth_18to19	BiotechInv_2019_M_Pop	BiotechInv_TotalInv	Biotech_VCBC_GDP	GERD_Perc_GDP_2018	OECD_Biotech_RD_BERD	Nature_LS_TotalShare	Nature_Delta_LS_2019	RuleofLaw_2018	RuleofLaw_Change13to18	Reg_Quality_2018	Reg_Quality_Change13to18	Social_Safety_Freedom	Social_Safety_Freedom_Change	Cluster_Dev	Diversity_Workforce	Stakeholder_Collab	WEF_Perc_IP_Protection	Share_World_Biotech_Patents	Year5_Trend_Share_Biotech	Compound_Score_US_CoC	ResTech_per_Mill	Patent_File_Residents_M_Pop	Patents_per_M_Pop_2018	Perc_Biotech_Patents_2018	Perc_LifeScience_Patents_2018 /Normal(mu=est sigma=est color=red l=1);
	histogram;
	run;

	proc means data=CombinedFile n mean median skew; 
		var Public_Co_RD_Spend_2019_GDP	Public_Co_Rev_2019_GDP	Public_Co_Profit_2019_GDP	NumPublicBioCo_TotalPublicCos	OECD_Total_Biotech_Firms_by_Pop	CB_Perc_TotalCompanies	Employees_by_Pop	StIncoming_2018_Perc_StPop	Change_StIncoming_13to18	StOutgoing_2018_Perc_StPop	Change_StOutgoing_13to18	Researchers_Per_Mill	MF_BachDegPlus	Govt_Spend_Education_GDP	STEM_Grad_Perc_Graduates	FSTEM_Grad_Perc_FGraduates	VC_Availability	VC_2019_Total_GDP	VC_2019_Total_Biotech	VC_Growth_18to19	BiotechInv_2019_M_Pop	BiotechInv_TotalInv	Biotech_VCBC_GDP	GERD_Perc_GDP_2018	OECD_Biotech_RD_BERD	Nature_LS_TotalShare	Nature_Delta_LS_2019	RuleofLaw_2018	RuleofLaw_Change13to18	Reg_Quality_2018	Reg_Quality_Change13to18	Social_Safety_Freedom	Social_Safety_Freedom_Change	Cluster_Dev	Diversity_Workforce	Stakeholder_Collab	WEF_Perc_IP_Protection	Share_World_Biotech_Patents	Year5_Trend_Share_Biotech	Compound_Score_US_CoC	ResTech_per_Mill	Patent_File_Residents_M_Pop	Patents_per_M_Pop_2018	Perc_Biotech_Patents_2018	Perc_LifeScience_Patents_2018;
	run;

	/* Do transformation of value if significant skewness - if 0s present in the variable, can add 1 before transformation */


	data CombinedFile;
		set CombinedFile;

		nPublic_Co_RD_Spend_2019_GDP = log(Public_Co_RD_Spend_2019_GDP + 1);
		nPublic_Co_Rev_2019_GDP = log(Public_Co_Rev_2019_GDP + 1);
		nPublic_Co_Profit_2019_GDP = log(Public_Co_Profit_2019_GDP + 1);
		nNumPublicBioCo_TotalPublicCos = log(NumPublicBioCo_TotalPublicCos + 1);
		nOECD_Total_Biotech_Firms_by_Pop = OECD_Total_Biotech_Firms_by_Pop;
		nCB_Perc_TotalCompanies = CB_Perc_TotalCompanies;
		nEmployees_by_Pop = log(Employees_by_Pop + 1);

		nStIncoming_2018_Perc_StPop = log(StIncoming_2018_Perc_StPop + 1);
		nChange_StIncoming_13to18 = log(Change_StIncoming_13to18 + 1);
		nStOutgoing_2018_Perc_StPop = log(StOutgoing_2018_Perc_StPop + 1);
		nChange_StOutgoing_13to18 = Change_StOutgoing_13to18;
		nResearchers_Per_Mill = Researchers_Per_Mill;
		nMF_BachDegPlus = log(MF_BachDegPlus + 1);
		nGovt_Spend_Education_GDP = Govt_Spend_Education_GDP;
		nSTEM_Grad_Perc_Graduates = STEM_Grad_Perc_Graduates;
		nFSTEM_Grad_Perc_Fgraduates = FSTEM_Grad_Perc_Fgraduates;

		nVC_Availability = VC_Availability;
		nVC_2019_Total_GDP = VC_2019_Total_GDP;
		nVC_2019_Total_Biotech = log(VC_2019_Total_Biotech + 1);
		nVC_Growth_18to19 = log(VC_Growth_18to19 + 1);
		nBiotechInv_2019_M_Pop = log(BiotechInv_2019_M_Pop + 1);
		nBiotechInv_TotalInv = log(BiotechInv_TotalInv + 1);
		nBiotech_VCBC_GDP = Biotech_VCBC_GDP;
		nGERD_Perc_GDP_2018 = GERD_Perc_GDP_2018;
		nOECD_Biotech_RD_BERD = OECD_Biotech_RD_BERD;
		nNature_LS_TotalShare = Nature_LS_TotalShare;
		nNature_Delta_LS_2019 = Nature_Delta_LS_2019;

		nRuleofLaw_2018 = RuleofLaw_2018;
		nRuleofLaw_Change13to18 = RuleofLaw_Change13to18;
		nReg_Quality_2018 = Reg_Quality_2018;
		nReg_Quality_Change13to18 = Reg_Quality_Change13to18;
		nSocial_Safety_Freedom = Social_Safety_Freedom;
		nSocial_Safety_Freedom_Change = Social_Safety_Freedom_Change;
		nCluster_Dev = Cluster_Dev;
		nDiversity_Workforce = Diversity_Workforce;
		nStakeholder_Collab = Stakeholder_Collab;

		nWEF_Perc_IP_Protection = WEF_Perc_IP_Protection;
		nShare_World_Biotech_Patents = Share_World_Biotech_Patents;
		nYear5_Trend_Share_Biotech = log(Year5_Trend_Share_Biotech + 1);
		nCompound_Score_US_CoC = Compound_Score_US_CoC;
		nResTech_per_Mill = ResTech_per_Mill;
		nPatent_File_Residents_M_Pop = log(Patent_File_Residents_M_Pop + 1);
		nPatents_per_M_Pop_2018 = log(Patents_per_M_Pop_2018 + 1);
		nPerc_Biotech_Patents_2018 = Perc_Biotech_Patents_2018;
		nPerc_LifeScience_Patents_2018 = log(Perc_LifeScience_Patents_2018 + 1);
run;

proc standard data=CombinedFile mean=50 std=5 out=zCombinedFile;
	var nPublic_Co_RD_Spend_2019_GDP nPublic_Co_Rev_2019_GDP nPublic_Co_Profit_2019_GDP nNumPublicBioCo_TotalPublicCos nOECD_Total_Biotech_Firms_by_Pop nCB_Perc_TotalCompanies nEmployees_by_Pop
		nStIncoming_2018_Perc_StPop nChange_StIncoming_13to18 nStOutgoing_2018_Perc_StPop nChange_StOutgoing_13to18 nResearchers_Per_Mill nMF_BachDegPlus nGovt_Spend_Education_GDP nSTEM_Grad_Perc_Graduates nFSTEM_Grad_Perc_Fgraduates
		nVC_Availability nVC_2019_Total_GDP nVC_2019_Total_Biotech nVC_Growth_18to19 nBiotechInv_2019_M_Pop nBiotechInv_TotalInv nBiotech_VCBC_GDP nGERD_Perc_GDP_2018 nOECD_Biotech_RD_BERD nNature_LS_TotalShare nNature_Delta_LS_2019
		nRuleofLaw_2018 nRuleofLaw_Change13to18 nReg_Quality_2018 nReg_Quality_Change13to18 nSocial_Safety_Freedom nSocial_Safety_Freedom_Change nCluster_Dev nDiversity_Workforce nStakeholder_Collab
		nWEF_Perc_IP_Protection nShare_World_Biotech_Patents nYear5_Trend_Share_Biotech nCompound_Score_US_CoC nResTech_per_Mill nPatent_File_Residents_M_Pop nPatents_per_M_Pop_2018 nPerc_Biotech_Patents_2018 nPerc_LifeScience_Patents_2018 ;
run;

proc means data=zCombinedFile;
	var nPublic_Co_RD_Spend_2019_GDP nPublic_Co_Rev_2019_GDP nPublic_Co_Profit_2019_GDP nNumPublicBioCo_TotalPublicCos nOECD_Total_Biotech_Firms_by_Pop nCB_Perc_TotalCompanies nEmployees_by_Pop
		nStIncoming_2018_Perc_StPop nChange_StIncoming_13to18 nStOutgoing_2018_Perc_StPop nChange_StOutgoing_13to18 nResearchers_Per_Mill nMF_BachDegPlus nGovt_Spend_Education_GDP nSTEM_Grad_Perc_Graduates nFSTEM_Grad_Perc_Fgraduates
		nVC_Availability nVC_2019_Total_GDP nVC_2019_Total_Biotech nVC_Growth_18to19 nBiotechInv_2019_M_Pop nBiotechInv_TotalInv nBiotech_VCBC_GDP nGERD_Perc_GDP_2018 nOECD_Biotech_RD_BERD nNature_LS_TotalShare nNature_Delta_LS_2019
		nRuleofLaw_2018 nRuleofLaw_Change13to18 nReg_Quality_2018 nReg_Quality_Change13to18 nSocial_Safety_Freedom nSocial_Safety_Freedom_Change nCluster_Dev nDiversity_Workforce nStakeholder_Collab
		nWEF_Perc_IP_Protection nShare_World_Biotech_Patents nYear5_Trend_Share_Biotech nCompound_Score_US_CoC nResTech_per_Mill nPatent_File_Residents_M_Pop nPatents_per_M_Pop_2018 nPerc_Biotech_Patents_2018 nPerc_LifeScience_Patents_2018 ;
run;

/* Step 3: apply weights from #1 to z-scores */

data wCombinedFile;
	set zCombinedFile;

		wPublic_Co_RD_Spend_2019_GDP = nPublic_Co_RD_Spend_2019_GDP * .0833;
		wPublic_Co_Rev_2019_GDP = nPublic_Co_Rev_2019_GDP * .0833;
		wPublic_Co_Profit_2019_GDP = nPublic_Co_Profit_2019_GDP * .0833;
		wNumPublicBioCo_TotalPublicCos = nNumPublicBioCo_TotalPublicCos * .25;
		wOECD_Total_Biotech_Firms_by_Pop = nOECD_Total_Biotech_Firms_by_Pop * 0;
		wCB_Perc_TotalCompanies = nCB_Perc_TotalCompanies * .25;
		wEmployees_by_Pop = nEmployees_by_Pop * .25;
		wStIncoming_2018_Perc_StPop = nStIncoming_2018_Perc_StPop * .10;
		wChange_StIncoming_13to18 = nChange_StIncoming_13to18 * .10;
		wStOutgoing_2018_Perc_StPop = nStOutgoing_2018_Perc_StPop * .10;
		wChange_StOutgoing_13to18 = nChange_StOutgoing_13to18 * .10;
		wResearchers_Per_Mill = nResearchers_Per_Mill * 0;
		wMF_BachDegPlus = nMF_BachDegPlus * .20;
		wGovt_Spend_Education_GDP = nGovt_Spend_Education_GDP * .20;
		wSTEM_Grad_Perc_Graduates = nSTEM_Grad_Perc_Graduates * .20;
		wFSTEM_Grad_Perc_Fgraduates = nFSTEM_Grad_Perc_Fgraduates * 0;
		wVC_Availability = nVC_Availability * .25;
		wVC_2019_Total_GDP = nVC_2019_Total_GDP * .25;
		wVC_2019_Total_Biotech = nVC_2019_Total_Biotech * .25;
		wVC_Growth_18to19 = nVC_Growth_18to19 * 0;
		wBiotechInv_2019_M_Pop = nBiotechInv_2019_M_Pop * 0;
		wBiotechInv_TotalInv = nBiotechInv_TotalInv * .25;
		wBiotech_VCBC_GDP = nBiotech_VCBC_GDP * 0;
		wGERD_Perc_GDP_2018 = nGERD_Perc_GDP_2018 * 0;
		wOECD_Biotech_RD_BERD = nOECD_Biotech_RD_BERD * 0;
		wRuleofLaw_2018 = nRuleofLaw_2018 * .0833;
		wRuleofLaw_Change13to18 = nRuleofLaw_Change13to18 * .0833;
		wReg_Quality_2018 = nReg_Quality_2018 * .0833;
		wReg_Quality_Change13to18 = nReg_Quality_Change13to18 * .0833;
		wSocial_Safety_Freedom = nSocial_Safety_Freedom * .0833;
		wSocial_Safety_Freedom_Change = nSocial_Safety_Freedom_Change * .0833;
		wCluster_Dev = nCluster_Dev * .1667;
		wDiversity_Workforce = nDiversity_Workforce * .1667;
		wStakeholder_Collab = nStakeholder_Collab * .1667;
		wWEF_Perc_IP_Protection = nWEF_Perc_IP_Protection * .1667;
		wShare_World_Biotech_Patents = nShare_World_Biotech_Patents * 0;
		wYear5_Trend_Share_Biotech = nYear5_Trend_Share_Biotech * 0;
		wCompound_Score_US_CoC = nCompound_Score_US_CoC * .1667;
		wResTech_per_Mill = nResTech_per_Mill * .1667;
		wPatent_File_Residents_M_Pop = nPatent_File_Residents_M_Pop * .0833;
		wPatents_per_M_Pop_2018 = nPatents_per_M_Pop_2018 * .0833;
		wPerc_Biotech_Patents_2018 = nPerc_Biotech_Patents_2018 * 0;
		wPerc_LifeScience_Patents_2018 = nPerc_LifeScience_Patents_2018 * .1667;
		wNature_LS_TotalShare = nNature_LS_TotalShare * .0833;
		wNature_Delta_LS_2019 = nNature_Delta_LS_2019 * .0833;

		keep Country wPublic_Co_RD_Spend_2019_GDP wPublic_Co_Rev_2019_GDP wPublic_Co_Profit_2019_GDP wNumPublicBioCo_TotalPublicCos wOECD_Total_Biotech_Firms_by_Pop wCB_Perc_TotalCompanies wEmployees_by_Pop
		wStIncoming_2018_Perc_StPop wChange_StIncoming_13to18 wStOutgoing_2018_Perc_StPop wChange_StOutgoing_13to18 wResearchers_Per_Mill wMF_BachDegPlus wGovt_Spend_Education_GDP wSTEM_Grad_Perc_Graduates wFSTEM_Grad_Perc_Fgraduates
		wVC_Availability wVC_2019_Total_GDP wVC_2019_Total_Biotech wVC_Growth_18to19 wBiotechInv_2019_M_Pop wBiotechInv_TotalInv wBiotech_VCBC_GDP wGERD_Perc_GDP_2018 wOECD_Biotech_RD_BERD wNature_LS_TotalShare wNature_Delta_LS_2019
		wRuleofLaw_2018 wRuleofLaw_Change13to18 wReg_Quality_2018 wReg_Quality_Change13to18 wSocial_Safety_Freedom wSocial_Safety_Freedom_Change wCluster_Dev wDiversity_Workforce wStakeholder_Collab
		wWEF_Perc_IP_Protection wShare_World_Biotech_Patents wYear5_Trend_Share_Biotech wCompound_Score_US_CoC wResTech_per_Mill wPatent_File_Residents_M_Pop wPatents_per_M_Pop_2018 wPerc_Biotech_Patents_2018 wPerc_LifeScience_Patents_2018;

run;

/* Step 4: Calculate weighted score for an area
	- sum nation's weighted values for ranking indicators in that area
	- subtract minimum score (from total ranking) from each score to make 0 the lowest score) */

data wsCombinedFile;
	set wCombinedFile;

	if (not missing(wPublic_Co_RD_Spend_2019_GDP) and not missing(wPublic_Co_Rev_2019_GDP) and not missing(wPublic_Co_Profit_2019_GDP) and not missing(wNumPublicBioCo_TotalPublicCos)
		 and not missing(wCB_Perc_TotalCompanies) and not missing(wEmployees_by_Pop)) 
			then EnterpriseSum = (wPublic_Co_RD_Spend_2019_GDP + wPublic_Co_Rev_2019_GDP + wPublic_Co_Profit_2019_GDP + wNumPublicBioCo_TotalPublicCos + wCB_Perc_TotalCompanies + wEmployees_by_Pop);
	else EnterpriseSum=.;

	if (not missing(wStIncoming_2018_Perc_StPop) and not missing(wChange_StIncoming_13to18) and not missing(wStOutgoing_2018_Perc_StPop) and not missing(wChange_StOutgoing_13to18)
		and not missing(wGovt_Spend_Education_GDP) and not missing(wSTEM_Grad_Perc_Graduates) )
			then EducationSum = (wStIncoming_2018_Perc_StPop + wChange_StIncoming_13to18 + wStOutgoing_2018_Perc_StPop + wChange_StOutgoing_13to18 + wGovt_Spend_Education_GDP + wSTEM_Grad_Perc_Graduates);
	else EducationSum=.;

	if (not missing(wVC_Availability) and not missing(wVC_2019_Total_GDP) and not missing(wVC_2019_Total_Biotech) and not missing(wBiotechInv_TotalInv))
			then EnterpriseSuppSum = (wVC_Availability + wVC_2019_Total_GDP + wVC_2019_Total_Biotech + wBiotechInv_TotalInv);
	else EnterpriseSuppSum = .;

	if (not missing(wRuleofLaw_2018) and not missing(wRuleofLaw_Change13to18) and not missing(wReg_Quality_2018) and not missing(wReg_Quality_Change13to18) and not missing(wSocial_Safety_Freedom) and not missing(wSocial_Safety_Freedom_Change)
		and not missing(wCluster_Dev) and not missing(wDiversity_Workforce) and not missing(wStakeholder_Collab))
			then FoundationSum = (wRuleofLaw_2018 + wRuleofLaw_Change13to18 + wReg_Quality_2018 + wReg_Quality_Change13to18 + wSocial_Safety_Freedom + wSocial_Safety_Freedom_Change + wCluster_Dev + wDiversity_Workforce + wStakeholder_Collab);
	else FoundationSum = .;

	if (not missing(wWEF_Perc_IP_Protection) and not missing(wCompound_Score_US_CoC) and not missing(wResTech_per_Mill) and not missing(wPatent_File_Residents_M_Pop)
		and not missing(wPatents_per_M_Pop_2018) and not missing(wPerc_LifeScience_Patents_2018)  and not missing(wNature_LS_TotalShare) and not missing(wNature_Delta_LS_2019))
			then IPProtectionSum = (wWEF_Perc_IP_Protection + wCompound_Score_US_CoC + wResTech_per_Mill + wPatent_File_Residents_M_Pop + wPatents_per_M_Pop_2018 + wPerc_LifeScience_Patents_2018 + wNature_LS_TotalShare + wNature_Delta_LS_2019);
	else IPProtectionSum = .;
run;

data wsCombinedFile;
	set wsCombinedFile;

	keep Country EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc means data=wsCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc standard data=wsCombinedFile mean=50 std=5 out=zwsCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

data zwsCombinedFile;
	set zwsCombinedFile;
	if (not missing(EnterpriseSum) and not missing(EducationSum) and not missing(EnterpriseSuppSum) and not missing(FoundationSum) and not missing(IPProtectionSum))
		then FinalRank = (EnterpriseSum + EducationSum + EnterpriseSuppSum + FoundationSum + IPProtectionSum);
	else FinalRank = .;

proc export 
 data=zwsCombinedFile
 dbms=xlsx 
 outfile="H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\Weighted FinalRank Group 1 &sysdate..xlsx" 
 replace;
run;

data g2wCombinedFile;
	set zCombinedFile;

		wPublic_Co_RD_Spend_2019_GDP = nPublic_Co_RD_Spend_2019_GDP * .0833;
		wPublic_Co_Rev_2019_GDP = nPublic_Co_Rev_2019_GDP * .0833;
		wPublic_Co_Profit_2019_GDP = nPublic_Co_Profit_2019_GDP * .0833;
		wNumPublicBioCo_TotalPublicCos = nNumPublicBioCo_TotalPublicCos * .25;
		wOECD_Total_Biotech_Firms_by_Pop = nOECD_Total_Biotech_Firms_by_Pop * 0;
		wCB_Perc_TotalCompanies = nCB_Perc_TotalCompanies * .25;
		wEmployees_by_Pop = nEmployees_by_Pop * .25;
		wStIncoming_2018_Perc_StPop = nStIncoming_2018_Perc_StPop * .10;
		wChange_StIncoming_13to18 = nChange_StIncoming_13to18 * .10;
		wStOutgoing_2018_Perc_StPop = nStOutgoing_2018_Perc_StPop * .10;
		wChange_StOutgoing_13to18 = nChange_StOutgoing_13to18 * .10;
		wResearchers_Per_Mill = nResearchers_Per_Mill * 0;
		wMF_BachDegPlus = nMF_BachDegPlus * .20;
		wGovt_Spend_Education_GDP = nGovt_Spend_Education_GDP * .20;
		wSTEM_Grad_Perc_Graduates = nSTEM_Grad_Perc_Graduates * .20;
		wFSTEM_Grad_Perc_Fgraduates = nFSTEM_Grad_Perc_Fgraduates * 0;
		wVC_Availability = nVC_Availability * .3333;
		wVC_2019_Total_GDP = nVC_2019_Total_GDP * .3333;
		wVC_2019_Total_Biotech = nVC_2019_Total_Biotech * .3333;
		wVC_Growth_18to19 = nVC_Growth_18to19 * 0;
		wBiotechInv_2019_M_Pop = nBiotechInv_2019_M_Pop * 0;
		wBiotechInv_TotalInv = nBiotechInv_TotalInv * 0;
		wBiotech_VCBC_GDP = nBiotech_VCBC_GDP * 0;
		wGERD_Perc_GDP_2018 = nGERD_Perc_GDP_2018 * 0;
		wOECD_Biotech_RD_BERD = nOECD_Biotech_RD_BERD * 0;
		wRuleofLaw_2018 = nRuleofLaw_2018 * .0833;
		wRuleofLaw_Change13to18 = nRuleofLaw_Change13to18 * .0833;
		wReg_Quality_2018 = nReg_Quality_2018 * .0833;
		wReg_Quality_Change13to18 = nReg_Quality_Change13to18 * .0833;
		wSocial_Safety_Freedom = nSocial_Safety_Freedom * .0833;
		wSocial_Safety_Freedom_Change = nSocial_Safety_Freedom_Change * .0833;
		wCluster_Dev = nCluster_Dev * .1667;
		wDiversity_Workforce = nDiversity_Workforce * .1667;
		wStakeholder_Collab = nStakeholder_Collab * .1667;
		wWEF_Perc_IP_Protection = nWEF_Perc_IP_Protection * .1667;
		wShare_World_Biotech_Patents = nShare_World_Biotech_Patents * 0;
		wYear5_Trend_Share_Biotech = nYear5_Trend_Share_Biotech * 0;
		wCompound_Score_US_CoC = nCompound_Score_US_CoC * .1667;
		wResTech_per_Mill = nResTech_per_Mill * .1667;
		wPatent_File_Residents_M_Pop = nPatent_File_Residents_M_Pop * .0833;
		wPatents_per_M_Pop_2018 = nPatents_per_M_Pop_2018 * .0833;
		wPerc_Biotech_Patents_2018 = nPerc_Biotech_Patents_2018 * 0;
		wPerc_LifeScience_Patents_2018 = nPerc_LifeScience_Patents_2018 * .1667;
		wNature_LS_TotalShare = nNature_LS_TotalShare * .0833;
		wNature_Delta_LS_2019 = nNature_Delta_LS_2019 * .0833;

		keep Country wPublic_Co_RD_Spend_2019_GDP wPublic_Co_Rev_2019_GDP wPublic_Co_Profit_2019_GDP wNumPublicBioCo_TotalPublicCos wOECD_Total_Biotech_Firms_by_Pop wCB_Perc_TotalCompanies wEmployees_by_Pop
		wStIncoming_2018_Perc_StPop wChange_StIncoming_13to18 wStOutgoing_2018_Perc_StPop wChange_StOutgoing_13to18 wResearchers_Per_Mill wMF_BachDegPlus wGovt_Spend_Education_GDP wSTEM_Grad_Perc_Graduates wFSTEM_Grad_Perc_Fgraduates
		wVC_Availability wVC_2019_Total_GDP wVC_2019_Total_Biotech wVC_Growth_18to19 wBiotechInv_2019_M_Pop wBiotechInv_TotalInv wBiotech_VCBC_GDP wGERD_Perc_GDP_2018 wOECD_Biotech_RD_BERD wNature_LS_TotalShare wNature_Delta_LS_2019
		wRuleofLaw_2018 wRuleofLaw_Change13to18 wReg_Quality_2018 wReg_Quality_Change13to18 wSocial_Safety_Freedom wSocial_Safety_Freedom_Change wCluster_Dev wDiversity_Workforce wStakeholder_Collab
		wWEF_Perc_IP_Protection wShare_World_Biotech_Patents wYear5_Trend_Share_Biotech wCompound_Score_US_CoC wResTech_per_Mill wPatent_File_Residents_M_Pop wPatents_per_M_Pop_2018 wPerc_Biotech_Patents_2018 wPerc_LifeScience_Patents_2018;

run;

data g2wsCombinedFile;
	set g2wCombinedFile;

	if (not missing(wPublic_Co_RD_Spend_2019_GDP) and not missing(wPublic_Co_Rev_2019_GDP) and not missing(wPublic_Co_Profit_2019_GDP) and not missing(wNumPublicBioCo_TotalPublicCos)
		 and not missing(wCB_Perc_TotalCompanies) and not missing(wEmployees_by_Pop)) 
			then EnterpriseSum = (wPublic_Co_RD_Spend_2019_GDP + wPublic_Co_Rev_2019_GDP + wPublic_Co_Profit_2019_GDP + wNumPublicBioCo_TotalPublicCos + wCB_Perc_TotalCompanies + wEmployees_by_Pop);
	else EnterpriseSum=.;

	if (not missing(wStIncoming_2018_Perc_StPop) and not missing(wChange_StIncoming_13to18) and not missing(wStOutgoing_2018_Perc_StPop) and not missing(wChange_StOutgoing_13to18)
		and not missing(wGovt_Spend_Education_GDP) and not missing(wSTEM_Grad_Perc_Graduates) )
			then EducationSum = (wStIncoming_2018_Perc_StPop + wChange_StIncoming_13to18 + wStOutgoing_2018_Perc_StPop + wChange_StOutgoing_13to18 + wGovt_Spend_Education_GDP + wSTEM_Grad_Perc_Graduates);
	else EducationSum=.;

	if (not missing(wVC_Availability) and not missing(wVC_2019_Total_GDP) and not missing(wVC_2019_Total_Biotech))
			then EnterpriseSuppSum = (wVC_Availability + wVC_2019_Total_GDP + wVC_2019_Total_Biotech);
	else EnterpriseSuppSum = .;

	if (not missing(wRuleofLaw_2018) and not missing(wRuleofLaw_Change13to18) and not missing(wReg_Quality_2018) and not missing(wReg_Quality_Change13to18) and not missing(wSocial_Safety_Freedom) and not missing(wSocial_Safety_Freedom_Change)
		and not missing(wCluster_Dev) and not missing(wDiversity_Workforce) and not missing(wStakeholder_Collab))
			then FoundationSum = (wRuleofLaw_2018 + wRuleofLaw_Change13to18 + wReg_Quality_2018 + wReg_Quality_Change13to18 + wSocial_Safety_Freedom + wSocial_Safety_Freedom_Change + wCluster_Dev + wDiversity_Workforce + wStakeholder_Collab);
	else FoundationSum = .;

	if (not missing(wWEF_Perc_IP_Protection) and not missing(wResTech_per_Mill) and not missing(wPatent_File_Residents_M_Pop)
		and not missing(wPatents_per_M_Pop_2018) and not missing(wCompound_Score_US_CoC) and not missing(wPerc_LifeScience_Patents_2018)  and not missing(wNature_LS_TotalShare) and not missing(wNature_Delta_LS_2019))
			then IPProtectionSum = (wWEF_Perc_IP_Protection + wCompound_Score_US_CoC + wResTech_per_Mill + wPatent_File_Residents_M_Pop + wPatents_per_M_Pop_2018 + wPerc_LifeScience_Patents_2018 + wNature_LS_TotalShare + wNature_Delta_LS_2019);
	else IPProtectionSum = .;
run;

data g2wsCombinedFile;
	set g2wsCombinedFile;

	keep Country EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc means data=g2wsCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc standard data=g2wsCombinedFile mean=50 std=5 out=g2zwsCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

data g2zwsCombinedFile;
	set g2zwsCombinedFile;
	if (not missing(EducationSum) and not missing(EnterpriseSuppSum) and not missing(FoundationSum) and not missing(IPProtectionSum))
		then FinalRank = (EducationSum + EnterpriseSuppSum + FoundationSum + IPProtectionSum);
	else FinalRank = .;
run;

proc export 
 data=g2zwsCombinedFile
 dbms=xlsx 
 outfile="H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\Weighted FinalRank Group 2 &sysdate..xlsx" 
 replace;
run;

/* Unweighted Rankings */
data uwCombinedFile;
	set zCombinedFile;

	if (not missing(nPublic_Co_RD_Spend_2019_GDP) and not missing(nPublic_Co_Rev_2019_GDP) and not missing(nPublic_Co_Profit_2019_GDP) and not missing(nNumPublicBioCo_TotalPublicCos)
		 and not missing(nCB_Perc_TotalCompanies) and not missing(nEmployees_by_Pop)) 
			then EnterpriseSum = (nPublic_Co_RD_Spend_2019_GDP + nPublic_Co_Rev_2019_GDP + nPublic_Co_Profit_2019_GDP + nNumPublicBioCo_TotalPublicCos + nCB_Perc_TotalCompanies + nEmployees_by_Pop);
	else EnterpriseSum=.;

	if (not missing(nStIncoming_2018_Perc_StPop) and not missing(nChange_StIncoming_13to18) and not missing(nStOutgoing_2018_Perc_StPop) and not missing(nChange_StOutgoing_13to18)
		and not missing(nGovt_Spend_Education_GDP) and not missing(nSTEM_Grad_Perc_Graduates) )
			then EducationSum = (nStIncoming_2018_Perc_StPop + nChange_StIncoming_13to18 + nStOutgoing_2018_Perc_StPop + nChange_StOutgoing_13to18 + nGovt_Spend_Education_GDP + nSTEM_Grad_Perc_Graduates);
	else EducationSum=.;

	if (not missing(nVC_Availability) and not missing(nVC_2019_Total_GDP) and not missing(nVC_2019_Total_Biotech) and not missing(nBiotechInv_TotalInv))
			then EnterpriseSuppSum = (nVC_Availability + nVC_2019_Total_GDP + nVC_2019_Total_Biotech + nBiotechInv_TotalInv);
	else EnterpriseSuppSum = .;

	if (not missing(nRuleofLaw_2018) and not missing(nRuleofLaw_Change13to18) and not missing(nReg_Quality_2018) and not missing(nReg_Quality_Change13to18) and not missing(nSocial_Safety_Freedom) and not missing(nSocial_Safety_Freedom_Change)
		and not missing(nCluster_Dev) and not missing(nDiversity_Workforce) and not missing(nStakeholder_Collab))
			then FoundationSum = (nRuleofLaw_2018 + nRuleofLaw_Change13to18 + nReg_Quality_2018 + nReg_Quality_Change13to18 + nSocial_Safety_Freedom + nSocial_Safety_Freedom_Change + nCluster_Dev + nDiversity_Workforce + nStakeholder_Collab);
	else FoundationSum = .;

	if (not missing(nWEF_Perc_IP_Protection) and not missing(nCompound_Score_US_CoC) and not missing(nResTech_per_Mill) and not missing(nPatent_File_Residents_M_Pop)
		and not missing(nPatents_per_M_Pop_2018) and not missing(nPerc_LifeScience_Patents_2018) and not missing(nNature_LS_TotalShare) and not missing(nNature_Delta_LS_2019))
			then IPProtectionSum = (nWEF_Perc_IP_Protection + nCompound_Score_US_CoC + nResTech_per_Mill + nPatent_File_Residents_M_Pop + nPatents_per_M_Pop_2018 + nPerc_LifeScience_Patents_2018 + nNature_LS_TotalShare + nNature_Delta_LS_2019);
	else IPProtectionSum = .;
run;

data uwCombinedFile;
	set uwCombinedFile;

	keep Country EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc means data=uwCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc standard data=uwCombinedFile mean=50 std=5 out=zuwCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

data zuwCombinedFile;
	set zuwCombinedFile;
	if (not missing(EnterpriseSum) and not missing(EducationSum) and not missing(EnterpriseSuppSum) and not missing(FoundationSum) and not missing(IPProtectionSum))
		then FinalRank = (EnterpriseSum + EducationSum + EnterpriseSuppSum + FoundationSum + IPProtectionSum);
	else FinalRank = .;

proc export 
 data=zuwCombinedFile
 dbms=xlsx 
 outfile="H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\Unweighted FinalRank Group 1 &sysdate..xlsx" 
 replace;
run;

data g2uwCombinedFile;
	set zCombinedFile;

	if (not missing(nPublic_Co_RD_Spend_2019_GDP) and not missing(nPublic_Co_Rev_2019_GDP) and not missing(nPublic_Co_Profit_2019_GDP) and not missing(nNumPublicBioCo_TotalPublicCos)
		 and not missing(nCB_Perc_TotalCompanies) and not missing(nEmployees_by_Pop)) 
			then EnterpriseSum = (nPublic_Co_RD_Spend_2019_GDP + nPublic_Co_Rev_2019_GDP + nPublic_Co_Profit_2019_GDP + nNumPublicBioCo_TotalPublicCos + nCB_Perc_TotalCompanies + nEmployees_by_Pop);
	else EnterpriseSum=.;

	if (not missing(nStIncoming_2018_Perc_StPop) and not missing(nChange_StIncoming_13to18) and not missing(nStOutgoing_2018_Perc_StPop) and not missing(nChange_StOutgoing_13to18)
		and not missing(nGovt_Spend_Education_GDP) and not missing(nSTEM_Grad_Perc_Graduates) )
			then EducationSum = (nStIncoming_2018_Perc_StPop + nChange_StIncoming_13to18 + nStOutgoing_2018_Perc_StPop + nChange_StOutgoing_13to18 + nGovt_Spend_Education_GDP + nSTEM_Grad_Perc_Graduates);
	else EducationSum=.;

	if (not missing(nVC_Availability) and not missing(nVC_2019_Total_GDP) and not missing(nVC_2019_Total_Biotech))
			then EnterpriseSuppSum = (nVC_Availability + nVC_2019_Total_GDP + nVC_2019_Total_Biotech);
	else EnterpriseSuppSum = .;

	if (not missing(nRuleofLaw_2018) and not missing(nRuleofLaw_Change13to18) and not missing(nReg_Quality_2018) and not missing(nReg_Quality_Change13to18) and not missing(nSocial_Safety_Freedom) and not missing(nSocial_Safety_Freedom_Change)
		and not missing(nCluster_Dev) and not missing(nDiversity_Workforce) and not missing(nStakeholder_Collab))
			then FoundationSum = (nRuleofLaw_2018 + nRuleofLaw_Change13to18 + nReg_Quality_2018 + nReg_Quality_Change13to18 + nSocial_Safety_Freedom + nSocial_Safety_Freedom_Change + nCluster_Dev + nDiversity_Workforce + nStakeholder_Collab);
	else FoundationSum = .;

	if (not missing(nWEF_Perc_IP_Protection)and not missing(nResTech_per_Mill) and not missing(nPatent_File_Residents_M_Pop)
		and not missing(nPatents_per_M_Pop_2018) and not missing (nCompound_Score_US_CoC) and not missing(nPerc_LifeScience_Patents_2018) and not missing(nNature_LS_TotalShare) and not missing(nNature_Delta_LS_2019))
			then IPProtectionSum = (nWEF_Perc_IP_Protection + nCompound_Score_US_CoC + nResTech_per_Mill + nPatent_File_Residents_M_Pop + nPatents_per_M_Pop_2018 + nPerc_LifeScience_Patents_2018 + nNature_LS_TotalShare + nNature_Delta_LS_2019);
	else IPProtectionSum = .;
run;

data g2uwCombinedFile;
	set g2uwCombinedFile;

	keep Country EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc means data=g2uwCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

proc standard data=g2uwCombinedFile mean=50 std=5 out=g2zuwCombinedFile;
	var EnterpriseSum EducationSum EnterpriseSuppSum FoundationSum IPProtectionSum;
run;

data g2zuwCombinedFile;
	set g2zuwCombinedFile;
	if (not missing(EducationSum) and not missing(EnterpriseSuppSum) and not missing(FoundationSum) and not missing(IPProtectionSum))
		then FinalRank = (EducationSum + EnterpriseSuppSum + FoundationSum + IPProtectionSum);
	else FinalRank = .;
run;

proc export 
 data=g2zuwCombinedFile
 dbms=xlsx 
 outfile="H:\[Client] Springer Nature\[2021.04] World View Data - Biotechnology Project\Nature Biotechnology Files\Unweighted FinalRank Group 2 &sysdate..xlsx" 
 replace;
run;
