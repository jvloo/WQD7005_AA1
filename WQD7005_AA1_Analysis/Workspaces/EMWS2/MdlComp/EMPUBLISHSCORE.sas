drop _temp_;
if (P_Churntrue ge 0.62068965517241) then do;
_temp_ = dmran(1234);
b_Churn = floor(1 + 2*_temp_);
end;
else
if (P_Churntrue ge 0.31578947368421) then do;
b_Churn = 3;
end;
else
if (P_Churntrue ge 0.23509933774834) then do;
b_Churn = 4;
end;
else
if (P_Churntrue ge 0.18987341772151) then do;
b_Churn = 5;
end;
else
if (P_Churntrue ge 0.09615384615384) then do;
_temp_ = dmran(1234);
b_Churn = floor(6 + 3*_temp_);
end;
else
if (P_Churntrue ge 0.04730617608409) then do;
_temp_ = dmran(1234);
b_Churn = floor(9 + 11*_temp_);
end;
else
do;
b_Churn = 20;
end;
