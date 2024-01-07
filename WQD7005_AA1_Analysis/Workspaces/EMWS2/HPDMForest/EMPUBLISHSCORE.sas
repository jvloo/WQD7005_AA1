%macro em_hpfst_score;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
  %if %symexist(hpfst_id_vars)=0 %then %let hpfst_id_vars = _ALL_;
 
  %let hpvvn= %sysfunc(getoption(VALIDVARNAME));
  options validvarname=V7;
  proc hp4score data=&hpfst_score_input;
  id &hpfst_id_vars;
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
    score file="D:\Study\WQD7005 Data Mining\_final\AA1\WQD7005_AA1_Analysis\Workspaces\EMWS2\HPDMForest\OUTMDLFILE.bin" out=&hpfst_score_output;
  %end;
  %else %do;
    score file="&EM_USER_OUTMDLFILE" out=&hpfst_score_output;
  %end;
    PERFORMANCE  DETAILS;
  run;
 
  options validvarname=&hpvvn;
 
  data &hpfst_score_output;
    set &hpfst_score_output;
%mend;
 
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: Churn;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
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
