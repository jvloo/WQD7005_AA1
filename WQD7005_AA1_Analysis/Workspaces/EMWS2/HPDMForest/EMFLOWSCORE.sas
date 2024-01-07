%macro em_hpfst_score;
 
  %if %sysfunc(exist(work._score_temp)) %then %do;
     proc delete data=work._score_temp;
     run;
  %end;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
 
%let hpvvn= %sysfunc(getoption(VALIDVARNAME));
options validvarname=V7;
  proc hp4score data=&hpfst_score_input(keep=
CityTier
Complain
CouponUsed
DaySinceLastOrder
Gender
HourSpendOnApp
MaritalStatus
OrderAmountHikeFromlastYear
OrderCount
PreferedOrderCat
PreferredLoginDevice
PreferredPaymentMode
SatisfactionScore
Tenure
  ); 
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
    score file="D:\Study\WQD7005 Data Mining\_final\AA1\WQD7005_AA1_Analysis\Workspaces\EMWS2\HPDMForest\OUTMDLFILE.bin" out=work._outtemp;
  %end;
  %else %do;
    score file="&EM_USER_OUTMDLFILE" out=work._outtemp;
  %end;
    PERFORMANCE  DETAILS nthreads=1;
  run;
 
options validvarname=&hpvvn;
  data work._score_temp;
     merge &hpfst_score_input work._outtemp;
  run;
 
  proc delete data=work._outtemp;
  run;
 
  data &hpfst_score_output;
    set work._score_temp;
%mend;
 
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: Churn;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
length F_Churn $5;
label  F_Churn = 'From: Churn';
_format200= PUT( Churn, $5. );
F_Churn=dmnorm(_format200,32); ;
_format200= ' ' ;
length _p_ 8;
_p_= 0 ;
drop _p_ ;
if P_Churntrue - _p_ > 1e-8 then do ;
   _p_= P_Churntrue ;
   _format200='TRUE';
end;
if P_Churnfalse - _p_ > 1e-8 then do ;
   _p_= P_Churnfalse ;
   _format200='FALSE';
end;
I_Churn=dmnorm(_format200,32); ;
length U_Churn $5;
label U_Churn = 'Unnormalized Into: Churn';
format U_Churn $5.;
if I_Churn='TRUE' then
U_Churn='TRUE';
if I_Churn='FALSE' then
U_Churn='FALSE';
*------------------------------------------------------------*;
*Computing Residual Vars: Churn;
*------------------------------------------------------------*;
Length R_Churntrue 8;
Label R_Churntrue='Residual: Churn=true';
Length R_Churnfalse 8;
Label R_Churnfalse='Residual: Churn=false';
if 
 F_Churn ne 'TRUE'
and F_Churn ne 'FALSE'
 then do;
R_Churntrue=.;
R_Churnfalse=.;
end;
else do;
R_Churntrue= - P_Churntrue;
R_Churnfalse= - P_Churnfalse;
select(F_Churn);
when('TRUE')R_Churntrue= R_Churntrue+1;
when('FALSE')R_Churnfalse= R_Churnfalse+1;
otherwise;
end;
end;
