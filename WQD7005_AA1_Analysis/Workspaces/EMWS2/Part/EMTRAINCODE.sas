*------------------------------------------------------------*;
* Part: Retrieving stratification variable(s) levels;
*------------------------------------------------------------*;
proc freq data=EMWS2.FIMPORT_train noprint;
format
Churn $5.
;
table
Churn
/out=WORK.Part_FREQ(drop=percent);
run;
proc sort data=WORK.Part_FREQ;
by descending count;
run;
* Part: Retrieving levels that meet minimum requirement;
data WORK.Part_FREQ2(keep = count);
set WORK.Part_FREQ;
where (.01 * 70 * count) >= 3;
run;
*------------------------------------------------------------*;
* Part: Create stratified partitioning;
*------------------------------------------------------------*;
data
EMWS2.Part_TRAIN(label="")
EMWS2.Part_VALIDATE(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS2.FIMPORT_train;
length _Pformat1 $55;
drop _Pformat1;
_Pformat1 = strip(put(Churn, $5.));
if
_Pformat1 = 'false'
then do;
if (4682+1-_C000003)*_genvalue_ <= (3277 - _C000001) then do;
_C000001 + 1;
output EMWS2.Part_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS2.Part_VALIDATE;
end;
_C000003+1;
end;
else if
_Pformat1 = 'true'
then do;
if (948+1-_C000006)*_genvalue_ <= (664 - _C000004) then do;
_C000004 + 1;
output EMWS2.Part_TRAIN;
end;
else do;
_C000005 + 1;
output EMWS2.Part_VALIDATE;
end;
_C000006+1;
end;
run;
