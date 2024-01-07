data sasep.out;
   dcl package score sc();
   dcl double "CityTier";
   dcl double "CouponUsed";
   dcl double "DaySinceLastOrder";
   dcl double "HourSpendOnApp";
   dcl double "OrderAmountHikeFromlastYear";
   dcl double "OrderCount";
   dcl double "SatisfactionScore";
   dcl double "Tenure";
   dcl nchar(5) "Complain";
   dcl nchar(6) "Gender";
   dcl nchar(8) "MaritalStatus";
   dcl nchar(18) "PreferedOrderCat";
   dcl nchar(12) "PreferredLoginDevice";
   dcl nchar(11) "PreferredPaymentMode";
   dcl double "P_ChurnTRUE" having label n'Predicted: Churn=TRUE';
   dcl double "P_ChurnFALSE" having label n'Predicted: Churn=FALSE';
   dcl nchar(32) "I_Churn" having label n'Into: Churn';
   dcl nchar(4) "_WARN_" having label n'Warnings';
   keep "P_ChurnTRUE" "P_ChurnFALSE" "I_Churn" "_WARN_";
    
   varlist allvars [_all_];
    
   method init();
      sc.setvars(allvars);
      sc.setKey(n'2811268DB06E83575ABD0C6737238F67CC1E4A8D');
   end;
    
   method run();
      set sasep.in;
      sc.scoreRecord();
   end;
enddata;
