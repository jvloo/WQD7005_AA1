if NAME="Churn" then do;
ROLE="TARGET";
LEVEL="NOMINAL";
ORDER="";
end;
if NAME="CustomerID" then do;
ROLE="ID";
LEVEL="INTERVAL";
ORDER="";
end;
drop DROP;
