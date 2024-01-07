if upcase(NAME) = "COUPONUSED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOURSPENDONAPP" then do;
ROLE = "REJECTED";
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
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
