****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_Churn  $    5; 
LENGTH I_Churn  $    5; 
LENGTH U_Churn  $    5; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Churntrue = 'Predicted: Churn=true' ;
      P_Churntrue  = 0;
label P_Churnfalse = 'Predicted: Churn=false' ;
      P_Churnfalse  = 0;
label Q_Churntrue = 'Unadjusted P: Churn=true' ;
      Q_Churntrue  = 0;
label Q_Churnfalse = 'Unadjusted P: Churn=false' ;
      Q_Churnfalse  = 0;
label R_Churntrue = 'Residual: Churn=true' ;
label R_Churnfalse = 'Residual: Churn=false' ;
label F_Churn = 'From: Churn' ;
label I_Churn = 'Into: Churn' ;
label U_Churn = 'Unnormalized Into: Churn' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_5 $      5; DROP _ARBFMT_5; 
_ARBFMT_5 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_18 $     18; DROP _ARBFMT_18; 
_ARBFMT_18 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8; 
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_11 $     11; DROP _ARBFMT_11; 
_ARBFMT_11 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


_ARBFMT_5 = PUT( Churn , $5.);
 %DMNORMCP( _ARBFMT_5, F_Churn );

 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 0.7988017274;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   256 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.119933732;
    END;
  END;

********** LEAF     2  NODE   258 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0036035617;
      END;
    END;
  END;

********** LEAF     3  NODE   259 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0404882867;
      END;
    END;
  END;

********** LEAF     4  NODE   261 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.092280488;
    END;
  END;

********** LEAF     5  NODE   263 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006025827;
      END;
    END;
  END;

********** LEAF     6  NODE   264 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0440462477;
      END;
    END;
  END;

********** LEAF     7  NODE   266 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.068444301;
    END;
  END;

********** LEAF     8  NODE   268 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001024987;
      END;
    END;
  END;

********** LEAF     9  NODE   269 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0394159711;
      END;
    END;
  END;

********** LEAF    10  NODE   271 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.059799081;
    END;
  END;

********** LEAF    11  NODE   273 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002555132;
      END;
    END;
  END;

********** LEAF    12  NODE   274 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0376555997;
      END;
    END;
  END;

********** LEAF    13  NODE   276 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.054989083;
    END;
  END;

********** LEAF    14  NODE   278 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0430161806;
      END;
    END;
  END;

********** LEAF    15  NODE   279 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0063298996;
      END;
    END;
  END;

********** LEAF    16  NODE   281 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.046985403;
    END;
  END;

********** LEAF    17  NODE   283 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' ,'MOBILE' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0355588451;
      END;
    END;
  END;

********** LEAF    18  NODE   284 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001678246;
      END;
    END;
  END;

********** LEAF    19  NODE   286 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.035192821;
    END;
  END;

********** LEAF    20  NODE   288 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0404496109;
      END;
    END;
  END;

********** LEAF    21  NODE   289 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0018539455;
      END;
    END;
  END;

********** LEAF    22  NODE   291 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.035257824;
    END;
  END;

********** LEAF    23  NODE   293 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
      Tenure  <                 10.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0051009536;
      END;
    END;
  END;

********** LEAF    24  NODE   294 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
                      10.5 <= Tenure  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0350603616;
      END;
    END;
  END;

********** LEAF    25  NODE   296 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.028895511;
    END;
  END;

********** LEAF    26  NODE   298 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008298032;
      END;
    END;
  END;

********** LEAF    27  NODE   299 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0313118102;
      END;
    END;
  END;

********** LEAF    28  NODE   301 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.027862184;
    END;
  END;

********** LEAF    29  NODE   303 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001567694;
      END;
    END;
  END;

********** LEAF    30  NODE   304 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0315789523;
      END;
    END;
  END;

********** LEAF    31  NODE   306 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.029209977;
    END;
  END;

********** LEAF    32  NODE   308 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0273800928;
      END;
    END;
  END;

********** LEAF    33  NODE   309 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('FASHION' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0010330507;
      END;
    END;
  END;

********** LEAF    34  NODE   311 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.027367146;
    END;
  END;

********** LEAF    35  NODE   313 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_8 = PUT( MaritalStatus , $8.);
     %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0021333367;
      END;
    END;
  END;

********** LEAF    36  NODE   314 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_8 = PUT( MaritalStatus , $8.);
     %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_8 NOTIN (
        'SINGLE' ,'DIVORCED' ,'MARRIED' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0271560176;
      END;
    END;
  END;

********** LEAF    37  NODE   316 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.025910249;
    END;
  END;

********** LEAF    38  NODE   318 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0372510055;
      END;
    END;
  END;

********** LEAF    39  NODE   319 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'OTHERS' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0018877495;
      END;
    END;
  END;

********** LEAF    40  NODE   321 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.041148669;
    END;
  END;

********** LEAF    41  NODE   323 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006297966;
      END;
    END;
  END;

********** LEAF    42  NODE   324 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0228663349;
      END;
    END;
  END;

********** LEAF    43  NODE   326 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.023440408;
    END;
  END;

********** LEAF    44  NODE   328 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.024591575;
      END;
    END;
  END;

********** LEAF    45  NODE   329 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       3.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0009216638;
      END;
    END;
  END;

********** LEAF    46  NODE   331 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.0206697;
    END;
  END;

********** LEAF    47  NODE   333 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
      Tenure  <                 10.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0011058994;
      END;
    END;
  END;

********** LEAF    48  NODE   334 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
                      10.5 <= Tenure  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0290837413;
      END;
    END;
  END;

********** LEAF    49  NODE   336 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.035083113;
    END;
  END;

********** LEAF    50  NODE   338 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0221900493;
      END;
    END;
  END;

********** LEAF    51  NODE   339 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       1.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006773125;
      END;
    END;
  END;

********** LEAF    52  NODE   341 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.03018128;
    END;
  END;

********** LEAF    53  NODE   343 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
      OrderCount  <                  4.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderCount  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0168412859;
      END;
    END;
  END;

********** LEAF    54  NODE   344 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
                       4.5 <= OrderCount  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013665539;
      END;
    END;
  END;

********** LEAF    55  NODE   346 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.018971908;
    END;
  END;

********** LEAF    56  NODE   348 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
      Tenure  <                 10.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00044053;
      END;
    END;
  END;

********** LEAF    57  NODE   349 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
                      10.5 <= Tenure  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0304028252;
      END;
    END;
  END;

********** LEAF    58  NODE   351 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.022696341;
    END;
  END;

********** LEAF    59  NODE   353 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0280259689;
      END;
    END;
  END;

********** LEAF    60  NODE   354 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       3.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000068033;
      END;
    END;
  END;

********** LEAF    61  NODE   356 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.023472204;
    END;
  END;

********** LEAF    62  NODE   358 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0209645381;
      END;
    END;
  END;

********** LEAF    63  NODE   359 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       1.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000201284;
      END;
    END;
  END;

********** LEAF    64  NODE   361 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.021740242;
    END;
  END;

********** LEAF    65  NODE   363 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0348929239;
      END;
    END;
  END;

********** LEAF    66  NODE   364 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'OTHERS' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000228607;
      END;
    END;
  END;

********** LEAF    67  NODE   366 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.015080443;
    END;
  END;

********** LEAF    68  NODE   368 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ,'MOBILE PHONE' ) 
        THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'MOBILE PHONE' ,'OTHERS' ,'MOBILE' ,
        'FASHION' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0264069199;
      END;
    END;
  END;

********** LEAF    69  NODE   369 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'FASHION' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008861148;
      END;
    END;
  END;

********** LEAF    70  NODE   371 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.031839982;
    END;
  END;

********** LEAF    71  NODE   373 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0181646616;
      END;
    END;
  END;

********** LEAF    72  NODE   374 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       1.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007834701;
      END;
    END;
  END;

********** LEAF    73  NODE   376 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.014384958;
    END;
  END;

********** LEAF    74  NODE   378 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ,'FASHION' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'FASHION' ,'OTHERS' ,'MOBILE' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0274398832;
      END;
    END;
  END;

********** LEAF    75  NODE   379 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002830458;
      END;
    END;
  END;

********** LEAF    76  NODE   381 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.026371677;
    END;
  END;

********** LEAF    77  NODE   383 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,
      'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE PHONE' ,'MOBILE' ,
        'FASHION' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0193838304;
      END;
    END;
  END;

********** LEAF    78  NODE   384 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'FASHION' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010720235;
      END;
    END;
  END;

********** LEAF    79  NODE   386 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.018720479;
    END;
  END;

********** LEAF    80  NODE   388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
      OrderAmountHikeFromlastYear  <                 17.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderAmountHikeFromlastYear  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0054336542;
      END;
    END;
  END;

********** LEAF    81  NODE   389 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
                      17.5 <= OrderAmountHikeFromlastYear  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0273346177;
      END;
    END;
  END;

********** LEAF    82  NODE   391 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.024608761;
    END;
  END;

********** LEAF    83  NODE   393 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  2.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0290495355;
      END;
    END;
  END;

********** LEAF    84  NODE   394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       2.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0008732502;
      END;
    END;
  END;

********** LEAF    85  NODE   396 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.021108687;
    END;
  END;

********** LEAF    86  NODE   398 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
      OrderAmountHikeFromlastYear  <                 17.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderAmountHikeFromlastYear  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.008182188;
      END;
    END;
  END;

********** LEAF    87  NODE   399 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
                      17.5 <= OrderAmountHikeFromlastYear  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0282090133;
      END;
    END;
  END;

********** LEAF    88  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.014816433;
    END;
  END;

********** LEAF    89  NODE   403 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('DEBIT CARD' ,'COD' ,'E WALLET' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'DEBIT CARD' ,'COD' ,'E WALLET' ,'CREDIT CARD' ,'UPI' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0057510063;
      END;
    END;
  END;

********** LEAF    90  NODE   404 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CREDIT CARD' ,'UPI' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0232857574;
      END;
    END;
  END;

********** LEAF    91  NODE   406 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.016363383;
    END;
  END;

********** LEAF    92  NODE   408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
      Tenure  <                 10.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002039926;
      END;
    END;
  END;

********** LEAF    93  NODE   409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
                      10.5 <= Tenure  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0257158679;
      END;
    END;
  END;

********** LEAF    94  NODE   411 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.026152183;
    END;
  END;

********** LEAF    95  NODE   413 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
      OrderCount  <                  2.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderCount  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0191042232;
      END;
    END;
  END;

********** LEAF    96  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
                       2.5 <= OrderCount  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008734689;
      END;
    END;
  END;

********** LEAF    97  NODE   416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.016196053;
    END;
  END;

********** LEAF    98  NODE   418 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'DEBIT CARD' ,'CREDIT CARD' ,'COD' ,'E WALLET' ,'UPI' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0178480375;
      END;
    END;
  END;

********** LEAF    99  NODE   419 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( Complain , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Complain  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_5 NOTIN (
      'TRUE' ,'FALSE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('COD' ,'E WALLET' ,'UPI' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010180676;
      END;
    END;
  END;

********** LEAF   100  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.015250441;
    END;
  END;

********** LEAF   101  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0284979795;
      END;
    END;
  END;

********** LEAF   102  NODE   424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000702883;
      END;
    END;
  END;

********** LEAF   103  NODE   428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ,'DIVORCED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001998326;
      END;
    END;
  END;

********** LEAF   104  NODE   429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ,'DIVORCED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       3.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.034887053;
      END;
    END;
  END;

********** LEAF   105  NODE   430 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0228956566;
      END;
    END;
  END;

********** LEAF   106  NODE   431 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       1.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000593644;
      END;
    END;
  END;

********** LEAF   107  NODE   433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.019059571;
    END;
  END;

********** LEAF   108  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0271280369;
      END;
    END;
  END;

********** LEAF   109  NODE   436 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0016075676;
      END;
    END;
  END;

********** LEAF   110  NODE   438 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
    SatisfactionScore  <                  2.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0197051634;
    END;
  END;

********** LEAF   111  NODE   440 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.028790746;
      END;
    END;
  END;

********** LEAF   112  NODE   441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0037262248;
      END;
    END;
  END;

********** LEAF   113  NODE   445 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
      OrderAmountHikeFromlastYear  <                 13.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.012555966;
      END;
    END;
  END;

********** LEAF   114  NODE   446 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderAmountHikeFromlastYear ) AND 
                      13.5 <= OrderAmountHikeFromlastYear  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderAmountHikeFromlastYear  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0145117621;
      END;
    END;
  END;

********** LEAF   115  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('COD' ,'E WALLET' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.02764378;
    END;
  END;

********** LEAF   116  NODE   448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.020808921;
    END;
  END;

********** LEAF   117  NODE   450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  2.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0172120108;
      END;
    END;
  END;

********** LEAF   118  NODE   451 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       2.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009487986;
      END;
    END;
  END;

********** LEAF   119  NODE   453 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
    SatisfactionScore  <                  2.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0206199968;
    END;
  END;

********** LEAF   120  NODE   455 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('TRUE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.02580774;
      END;
    END;
  END;

********** LEAF   121  NODE   456 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_5 = PUT( Complain , $5.);
     %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('FALSE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Complain  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_5 NOTIN (
        'TRUE' ,'FALSE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.001333835;
      END;
    END;
  END;

********** LEAF   122  NODE   460 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PreferredLoginDevice , $12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferredLoginDevice  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        'MOBILE PHONE' ,'COMPUTER' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0135776558;
      END;
    END;
  END;

********** LEAF   123  NODE   461 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PreferredLoginDevice , $12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('COMPUTER' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010848169;
      END;
    END;
  END;

********** LEAF   124  NODE   459 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('COD' ,'E WALLET' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.022109909;
    END;
  END;

********** LEAF   125  NODE   463 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.016891096;
    END;
  END;

********** LEAF   126  NODE   465 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ,'MOBILE PHONE' ) 
        THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'MOBILE PHONE' ,'OTHERS' ,'MOBILE' ,
        'FASHION' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0168076253;
      END;
    END;
  END;

********** LEAF   127  NODE   466 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'FASHION' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009168328;
      END;
    END;
  END;

********** LEAF   128  NODE   470 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(CityTier ) AND 
    CityTier  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  2.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0309883967;
      END;
    END;
  END;

********** LEAF   129  NODE   471 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(CityTier ) AND 
    CityTier  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       2.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0030938213;
      END;
    END;
  END;

********** LEAF   130  NODE   469 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(CityTier ) AND 
                     1.5 <= CityTier  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.014449446;
    END;
  END;

********** LEAF   131  NODE   473 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
    SatisfactionScore  <                  2.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0198867532;
    END;
  END;

********** LEAF   132  NODE   475 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_8 = PUT( MaritalStatus , $8.);
     %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.029089438;
      END;
    END;
  END;

********** LEAF   133  NODE   476 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(SatisfactionScore ) AND 
                     2.5 <= SatisfactionScore  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_8 = PUT( MaritalStatus , $8.);
     %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_8 NOTIN (
        'SINGLE' ,'DIVORCED' ,'MARRIED' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.004386866;
      END;
    END;
  END;

********** LEAF   134  NODE   478 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.014375143;
    END;
  END;

********** LEAF   135  NODE   480 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
      OrderCount  <                  2.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OrderCount  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0161057906;
      END;
    END;
  END;

********** LEAF   136  NODE   481 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('DIVORCED' ,'MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OrderCount ) AND 
                       2.5 <= OrderCount  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003839919;
      END;
    END;
  END;

********** LEAF   137  NODE   483 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
    DaySinceLastOrder  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.015186707;
    END;
  END;

********** LEAF   138  NODE   485 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
      CityTier  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CityTier  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0137317634;
      END;
    END;
  END;

********** LEAF   139  NODE   486 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(DaySinceLastOrder ) AND 
                     1.5 <= DaySinceLastOrder  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( DaySinceLastOrder  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(CityTier ) AND 
                       1.5 <= CityTier  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007895541;
      END;
    END;
  END;

********** LEAF   140  NODE   488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.010570459;
    END;
  END;

********** LEAF   141  NODE   490 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     3.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' ,'MOBILE' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0199654718;
      END;
    END;
  END;

********** LEAF   142  NODE   491 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     3.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005022658;
      END;
    END;
  END;

********** LEAF   143  NODE   495 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
      SatisfactionScore  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( SatisfactionScore  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0223176826;
      END;
    END;
  END;

********** LEAF   144  NODE   496 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('DEBIT CARD' ,'CREDIT CARD' ,'UPI' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PreferredPaymentMode  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'DEBIT CARD' ,'CREDIT CARD' ,'UPI' ,'COD' ,'E WALLET' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(SatisfactionScore ) AND 
                       3.5 <= SatisfactionScore  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009079693;
      END;
    END;
  END;

********** LEAF   145  NODE   494 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( PreferredPaymentMode , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('COD' ,'E WALLET' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.021246542;
    END;
  END;

********** LEAF   146  NODE   500 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ,'DIVORCED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'GROCERY' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0101527861;
      END;
    END;
  END;

********** LEAF   147  NODE   501 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('SINGLE' ,'DIVORCED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('OTHERS' ,'MOBILE' ,'FASHION' ,'MOBILE PHONE' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'GROCERY' ,'OTHERS' ,'MOBILE' ,'FASHION' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019405315;
      END;
    END;
  END;

********** LEAF   148  NODE   502 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
      Tenure  <                 13.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Tenure  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0050042769;
      END;
    END;
  END;

********** LEAF   149  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_8 = PUT( MaritalStatus , $8.);
   %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('MARRIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( MaritalStatus  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_8 NOTIN (
      'SINGLE' ,'DIVORCED' ,'MARRIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Tenure ) AND 
                      13.5 <= Tenure  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.03716596;
      END;
    END;
  END;

********** LEAF   150  NODE   505 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
    Tenure  <                  1.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.01105639;
    END;
  END;

********** LEAF   151  NODE   507 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PreferedOrderCat  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_18 NOTIN (
        'LAPTOP & ACCESSORY' ,'OTHERS' ,'GROCERY' ,'FASHION' ,'MOBILE' ,
        'MOBILE PHONE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0204893537;
      END;
    END;
  END;

********** LEAF   152  NODE   508 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Tenure ) AND 
                     1.5 <= Tenure  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Tenure  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_18 = PUT( PreferedOrderCat , $18.);
     %DMNORMIP( _ARBFMT_18);
      IF _ARBFMT_18 IN ('MOBILE' ,'MOBILE PHONE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010658659;
      END;
    END;
  END;

_ARB_F_ = 2.0 * _ARB_F_;
IF _ARB_BADF_ NE 0 THEN P_Churnfalse  = 0.8316831683;
ELSE IF _ARB_F_ > 45.0 THEN P_Churnfalse  = 1.0;
ELSE IF _ARB_F_ < -45.0 THEN P_Churnfalse  = 0.0;
ELSE P_Churnfalse  = 1.0/(1.0 + EXP( - _ARB_F_));
P_Churntrue  = 1.0 - P_Churnfalse ;
*****  CREATE Q_: POSTERIORS WITHOUT PRIORS ****;
Q_Churntrue  = P_Churntrue ;
Q_Churnfalse  = P_Churnfalse ;

*****  I_ AND U_ VARIABLES *******************;
 DROP _ARB_I_ _ARB_IP_;
 _ARB_IP_ = -1.0;
 IF _ARB_IP_ + 1.0/32768.0 < P_Churntrue THEN DO;
   _ARB_IP_ = P_Churntrue ;
   _ARB_I_  = 1;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_Churnfalse THEN DO;
   _ARB_IP_ = P_Churnfalse ;
   _ARB_I_  = 2;
   END;
 SELECT( _ARB_I_);
  WHEN( 1) DO;
    I_Churn  = 'TRUE' ;
    U_Churn  = 'true' ;
     END;
  WHEN( 2) DO;
    I_Churn  = 'FALSE' ;
    U_Churn  = 'false' ;
     END;
   END;

*****  RESIDUALS R_ *************;
IF  F_Churn  NE 'TRUE' 
AND F_Churn  NE 'FALSE'  THEN DO; 
        R_Churntrue  = .;
        R_Churnfalse  = .;
 END;
 ELSE DO;
       R_Churntrue  =  -P_Churntrue ;
       R_Churnfalse  =  -P_Churnfalse ;
       SELECT( F_Churn  );
          WHEN( 'TRUE'  ) R_Churntrue  = R_Churntrue  +1;
          WHEN( 'FALSE'  ) R_Churnfalse  = R_Churnfalse  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

