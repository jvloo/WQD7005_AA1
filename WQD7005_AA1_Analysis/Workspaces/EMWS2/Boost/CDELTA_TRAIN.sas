if upcase(NAME) = "CITYTIER" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "COMPLAIN" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "COUPONUSED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DAYSINCELASTORDER" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOURSPENDONAPP" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MARITALSTATUS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "ORDERAMOUNTHIKEFROMLASTYEAR" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "ORDERCOUNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PREFEREDORDERCAT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PREFERREDLOGINDEVICE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PREFERREDPAYMENTMODE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_CHURNFALSE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_CHURNTRUE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "SATISFACTIONSCORE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "TENURE" then do;
ROLE = "INPUT";
end;
