/*  The english dataset  */
FILENAME REFFILE 'G:/MS Data Science/3rd semester/Questioner Data Analysis/WINE_SURVEY_RESPONSES_removedemptyrows.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.EN;
	GETNAMES=YES;
	SHEET="EN";
RUN;

PROC CONTENTS DATA=WORK.EN;
RUN;


/*create new dataset where 'day' is character*/
data WORK.EN;
    set WORK.EN;
    SWEET_WINE_NEW = put(SWEET_WINE, 14.);
   
    DROP SWEET_WINE;
    
run;
/*create new dataset where 'day' is character*/
data WORK.EN;
    set WORK.EN;
    SWEET_WINE = SWEET_WINE_NEW;
   
    DROP SWEET_WINE_NEW;
    
run;


/* gettting all character columns changinig the length and format for all */
proc sql;
select name into :vname_en separated by ' ' from dictionary.columns 
where LIBNAME='WORK' /*NEED TO BE CAPPED*/ 
AND MEMNAME='EN'/*NEED TO BE CAPPED*/  
AND type='char';

quit;

data CHANGE_SIZED_EN;

     length &vname_en  $ 100;
	 *format &vname char(100) $100; 	
     set WORK.EN;

run;

proc datasets lib =  WORK;
modify CHANGE_SIZED_EN;
format &vname_en $char100. ; 
run;
quit;

PROC CONTENTS DATA=CHANGE_SIZED_EN;
RUN;
/* PROC PRINT DATA=WORK.EN; RUN; */

/* data CONVERT_EN;  */
/* set WORK.EN(rename=(SUPERMARKET=var1)); */
/* SUPERMARKET = put(var1, 8.); */
/* drop var1; */
/* run;  */
/*  */
/* proc sql; */
/* alter table CONVERT_EN */
/* modify SUPERMARKET char(3) format=$2.; */
/* quit; */
/* PROC PRINT DATA=CONVERT_EN; RUN; */
/* data CONVERT_EN; */
/* set CONVERT_EN; */
/* label SUPERMARKET = "SUPERMARKET"; */
/* SUPERMARKET = tranwrd(SUPERMARKET, ".", "NA"); */
/* run; */




/*create new dataset where 'day' is character*/
/* data CONVERT_EN; */
/*     set WORK.EN; */
/*     SUPERMARKET = put(SUPERMARKET, 8.); */
/* run; */
/* proc sql; */
/* alter table CONVERT_EN */
/* modify SUPERMARKET char(3) format=2.; */
/* quit; */

/*view new dataset*/
/* proc print data=CONVERT_EN;  */


/* PROC PRINT DATA=CONVERT_EN; RUN; */




/*  The Italian dataset  */
FILENAME REFFILE 'G:/MS Data Science/3rd semester/Questioner Data Analysis/WINE_SURVEY_RESPONSES_removedemptyrows.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IT;
	GETNAMES=YES;
	SHEET="IT";
RUN;

PROC CONTENTS DATA=WORK.IT;
RUN;
/* PROC PRINT DATA=WORK.IT; RUN; */

/* gettting all character columns changinig the length and format for all */
proc sql;
select name into :vname separated by ' ' from dictionary.columns 
where LIBNAME='WORK' /*NEED TO BE CAPPED*/ 
AND MEMNAME='IT'/*NEED TO BE CAPPED*/  
AND type='char';

quit;

data CHANGE_SIZED_IT;

     length &vname $ 100;
	 *format &vname char(100) $100; 	
     set WORK.IT;

run;

proc datasets lib =  WORK;
modify CHANGE_SIZED_IT;
format &vname $char100. ; 
run;
quit;

PROC CONTENTS DATA=CHANGE_SIZED_IT;
RUN;
/* PROC  */
/* PRINT DATA=CHANGE_SIZED_IT;  */
/* RUN; */

/* END of convertion format */

/* gettting all character columns changinig the length and format for all */
data TRANSLATED_IT;
set CHANGE_SIZED_IT;
label WHITE_WINE = "WHITE_WINE";
label ROSE_WINE = "ROSE_WINE";
label RED_WINE =  "RED_WINE";
label SPARKLING_WINE = "SPARKLING_WINE";
label SWEET_WINE = "SWEET_WINE";
label WINE_TASTING = "WINE_TASTING";
label WINERY_VISIT = "WINERY_VISIT";
label WINE_COURSE = "WINE_COURSE";

label WINE_KNOWLEDGE = 'WINE_KNOWLEDGE';
label BUYING_EXPERIENCE = 'BUYING_EXPERIENCE';
label WINE_BOTTLES = 'WINE_BOTTLES';
LABEL BOTTLE_BUDGET ='BOTTLE_BUDGET';
LABEL BUYING_REASON='BUYING_REASON';

LABEL BUYING_REASON='BUYING_REASON';
LABEL BUYING_REASON='BUYING_REASON';
LABEL BUYING_REASON='BUYING_REASON';
LABEL BUYING_REASON='BUYING_REASON';
LABEL ETNA_DOC = 'ETNA_DOC';
LABEL ETNA_BUYING ='ETNA_BUYING';
LABEL GENDER = 'GENDER';
LABEL EDUCATION = 'EDUCATION';
LABEL JOB = 'JOB';
LABEL LOCATION ='LOCATION';


WHITE_WINE = tranwrd(WHITE_WINE, "Mai assaggiato", "Never tasted");
ROSE_WINE = tranwrd(ROSE_WINE, "Mai assaggiato", "Never tasted");
RED_WINE = tranwrd(RED_WINE, "Mai assaggiato", "Never tasted");
SPARKLING_WINE = tranwrd(SPARKLING_WINE, "Mai assaggiato", "Never tasted");
SWEET_WINE = tranwrd(SWEET_WINE, "Mai assaggiato", "Never tasted");

WINE_TASTING = tranwrd(WINE_TASTING, "Si", "Yes");
WINERY_VISIT = tranwrd(WINERY_VISIT, "Si", "Yes");
WINE_COURSE = tranwrd(WINE_COURSE, "Si", "Yes");

WINE_KNOWLEDGE = tranwrd(WINE_KNOWLEDGE, "Nessuna", "None");
WINE_KNOWLEDGE = tranwrd(WINE_KNOWLEDGE, "Di base (conoscenza amatoriale)", "Basic (amateur knowledge level)");
WINE_KNOWLEDGE = tranwrd(WINE_KNOWLEDGE, "Media (conoscenza semi-professionale)", "Medium (semi-professional knowledge level)");
WINE_KNOWLEDGE = tranwrd(WINE_KNOWLEDGE, "Avanzata (conoscenza professionale)", "High (professional knowledge level)");
BUYING_EXPERIENCE = tranwrd(BUYING_EXPERIENCE, "Mai", "Never");
BUYING_EXPERIENCE = tranwrd(BUYING_EXPERIENCE, "1-2 volte al mese", "1-2 times per month");
BUYING_EXPERIENCE = tranwrd(BUYING_EXPERIENCE, "3-4 volte al mese", "3-4 times per month");
BUYING_EXPERIENCE = tranwrd(BUYING_EXPERIENCE, "5-6 volte al mese", "5-6 times per month");
BUYING_EXPERIENCE = tranwrd(BUYING_EXPERIENCE, "7+ volte al mese", "7+ times per month");


WINE_BOTTLES = tranwrd(WINE_BOTTLES, "Meno di una bottiglia", "Less than 1 bottle");
WINE_BOTTLES = tranwrd(WINE_BOTTLES, "bottiglie", "bottles");

BOTTLE_BUDGET = tranwrd(BOTTLE_BUDGET, "Meno di", "Less than");
BOTTLE_BUDGET = tranwrd(BOTTLE_BUDGET, "- medo di", "to less than");
BOTTLE_BUDGET = tranwrd(BOTTLE_BUDGET, "- meno di", "to less than");
BOTTLE_BUDGET = tranwrd(BOTTLE_BUDGET, "o più", "and more");

BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo, Per un regalo, Per un evento speciale/una festa, Per provare un nuovo vino", "Home consumption, To buy a gift, For a special event/party, To try a new wine");
BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo", "Home consumption");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un regalo", "To buy a gift");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un evento speciale/una festa", "For a special event/party");
BUYING_REASON = tranwrd(BUYING_REASON, "Per provare un nuovo vino", "To try a new wine");
BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo, Per un regalo", "Home consumption, To buy a gift");
BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo, Per un regalo, Per un evento speciale/una festa", "Home consumption, To buy a gift, For a special event/party");
BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo, Per un evento speciale/una festa", "Home consumption, For a special event/party");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un regalo, Per un evento speciale/una festa", "To buy a gift, For a special event/party");
BUYING_REASON = tranwrd(BUYING_REASON, "Consumo casalingo, Per provare un nuovo vino", "Home consumption, To try a new wine");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un regalo, Per un evento speciale/una festa, Per provare un nuovo vino", "To buy a gift, For a special event/party, To try a new wine");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un regalo, Per provare un nuovo vino", "To buy a gift, To try a new wine");
BUYING_REASON = tranwrd(BUYING_REASON, "Per un evento speciale/una festa, Per provare un nuovo vino", "For a special event/party, To try a new wine");

ETNA_DOC = tranwrd(ETNA_DOC, "Si", "Yes");
ETNA_DOC = tranwrd(ETNA_DOC, "Non lo so", "I don't know");

ETNA_BUYING = tranwrd(ETNA_BUYING, "Si", "Yes");
ETNA_BUYING = tranwrd(ETNA_BUYING, "Non lo so", "I don't know");

GENDER = tranwrd(GENDER, "Uomo", "Male");
GENDER = tranwrd(GENDER, "Donna", "Female");
GENDER = tranwrd(GENDER, "Preferisco non rispondere", "Prefer not to say");
EDUCATION = tranwrd(EDUCATION, "Scuola elementare o media inferiore", "Primary and medium school");
EDUCATION = tranwrd(EDUCATION, "Scuola media superiore (liceo o istituto tecnico)", "High school");
EDUCATION = tranwrd(EDUCATION, "Titolo universitario", "University degree");
LOCATION = tranwrd(LOCATION, "Sicilia", "Sicily");
LOCATION = tranwrd(LOCATION, "Altra regione in Italia (no Sicily)", "Other region in Italy (no Sicily)");
LOCATION = tranwrd(LOCATION, "Paese EU (no Italia)", "Foreign EU country (no Italy)");
LOCATION = tranwrd(LOCATION, "Paese extra EU", "Foreign not EU country (no Italy)");

JOB = tranwrd(JOB, "Studente", "Student");
JOB = tranwrd(JOB, "Impiegato", "Employee");
JOB = tranwrd(JOB, "Libero professionista", "Freelancer");
JOB = tranwrd(JOB, "Finanziere", "Financier");
JOB = tranwrd(JOB, "Docente", "Teacher");
JOB = tranwrd(JOB, "Lavoratore agricolo", "Employee");
JOB = tranwrd(JOB, "Dottorando di ricerca", "Researcher post doc");
JOB = tranwrd(JOB, "Imprenditore", "Entrepreneur");
JOB = tranwrd(JOB, "Dipendente", "Employee");
JOB = tranwrd(JOB, "Agente di commercio", "Trader");
JOB = tranwrd(JOB, "Disoccupato", "Unemployed");
JOB = tranwrd(JOB, "Casalinga/o", "Housewife/Housemen");
JOB = tranwrd(JOB, "Pensionato", "Retired");
JOB = tranwrd(JOB, "business owner", "Entrepreneur");

/*PROC CONTENTS DATA=TRANSLATED_IT;*/
/*RUN;*/
/*PROC PRINT DATA=TRANSLATED_IT;*/
/*RUN; */
/*PROC PRINT DATA= CHANGE_SIZED_EN;*/
/*RUN;*/

/* proc sql; */
/*     select * */
/*     from dictionary.columns */
/*     where libname = "WORK" */
/*     and memname = "TRANSLATED_IT" order by name asc; */
/* quit; */
/*  */
/* proc sql; */
/*     select count(*) */
/*     from dictionary.columns */
/*     where libname = "WORK" */
/*     and memname = "CHANGE_SIZED_EN" order by name asc;  */
/* quit; */

proc sql;
    select name
    into :my_column_order separated by " "
    from dictionary.columns
    where libname = "WORK"
    and memname = "TRANSLATED_IT"
    order by name;
quit;

/* %put &amp;=my_column_order.; */


data CHANGE_SIZED_EN_ORDERED;
    retain  &my_column_order;
    set CHANGE_SIZED_EN;
run;
/*PROC PRINT DATA= CHANGE_SIZED_EN_ORDERED;*/
/*RUN;*/

data work.TRANSLATED_IT_ORDERED;
    retain &my_column_order;
    set work.TRANSLATED_IT;
run;
/*PROC PRINT DATA= TRANSLATED_IT_ORDERED;*/
/*RUN;*/

PROC SQL;
create table COMBINED_DATA_SET as
select *
from WORK.CHANGE_SIZED_EN_ORDERED
UNION ALL
select *
from WORK.TRANSLATED_IT_ORDERED;
quit; 

PROC CONTENTS DATA=WORK.COMBINED_DATA_SET;
RUN;
/*PROC PRINT DATA=COMBINED_DATA_SET; */
/*RUN;*/

/* calling the custom macro created in order to 
convert all numeric columns variables to characters
*/
/*macro to convert all numeric to char*/
%macro vars(dsn);
  %let list=;
  %let type=;
  %let dsid=%sysfunc(open(&dsn));
  %let cnt=%sysfunc(attrn(&dsid,nvars));
   %do i = 1 %to &cnt;
    %let list=&list %sysfunc(varname(&dsid,&i));
    %let type=&type %sysfunc(vartype(&dsid,&i));
   %end;
  %let rc=%sysfunc(close(&dsid));
  data CONVERTED_NUMERIC_TO_CHAR(drop=
    %do i = 1 %to &cnt;
     %let temp=%scan(&list,&i);
       _&temp
    %end;);
   set &dsn(rename=(
    %do i = 1 %to &cnt;
     %let temp=%scan(&list,&i);
       &temp=_&temp
    %end;));
    %do j = 1 %to &cnt;
     %let temp=%scan(&list,&j);
   /** Change C to N for numeric to character conversion  **/
     %if %scan(&type,&j) = N %then %do;
   /** Also change INPUT to PUT for numeric to character  **/
      &temp=PUT(_&temp,8.);
     %end;
     %else %do;
      &temp=_&temp;
     %end;
    %end;
  run;
%mend vars;
/*macro to convert all numeric to char*/
%vars(COMBINED_DATA_SET);

/* End of convesion */

/* Converting the empty and not answered values to NA */
data CONVERTED_NUMERIC_TO_CHAR;

   set CONVERTED_NUMERIC_TO_CHAR;

   array change _character_;

            do over change;

            if change='' then change='NA';
            if compbl(change)=' . ' then change='NA';

            end;

   run ;
   
/*END of Converting the empty and not answered values to NA */
/*PROC PRINT DATA=CONVERTED_NUMERIC_TO_CHAR; */
/*RUN;*/




%let DSIn    = CONVERTED_NUMERIC_TO_CHAR;     /* name of input data set */
%let VarList = BUYING_EXPERIENCE WINE_BOTTLES; /* name of categorical variables */
 
proc freq data=&DSIn;
   tables &VarList;
run;

/* define a macro to create dummy variables */
%macro DummyVars(DSIn,    /* the name of the input data set */
                 VarList, /* the names of the categorical variables */
                 DSOut);  /* the name of the output data set */
   /* 1. add a fake response variable */
   data AddFakeY / view=AddFakeY;
      set &DSIn;
      _Y = 0;      /* add a fake response variable */
   run;
   /* 2. Create the design matrix. Include the original variables, if desired */
   proc glmselect data=AddFakeY NOPRINT outdesign(addinputvars)=&DSOut(drop=_Y);
      class      &VarList;   
      model _Y = &VarList /  noint selection=none;
   run;
%mend;
/* test macro on the Age and Sex variables of the Sashelp.Class data */
%DummyVars(CONVERTED_NUMERIC_TO_CHAR, BUYING_EXPERIENCE WINE_BOTTLES, DATA_SET_LATENT_CLASS);
/*PROC PRINT DATA=DATA_SET_LATENT_CLASS; */
/*RUN;*/
/* _GLSMOD is a macro variable that contains the names of the dummy variables */
proc print data=DATA_SET_LATENT_CLASS noobs; 
   VAR  &_GLSMod;
run;
/* Taking the columns names from the dataset */

proc sql outobs=12;
    select  name
    into :LATENT_CLASS_ITEMS separated by " "
    from dictionary.columns
    where libname = "WORK"
    and memname = "DATA_SET_LATENT_CLASS";
   
quit;

/*create new dataset with missing values replaced by zero*/
data DATA_SET_LATENT_CLASS_NEW;
   set DATA_SET_LATENT_CLASS;
   array variablesOfInterest _numeric_;
   do over variablesOfInterest;
      if variablesOfInterest=1 then variablesOfInterest=2;
      else if variablesOfInterest=0 then variablesOfInterest=1;
      
   end;
run;



/*view new dataset*/
/*proc print data=DATA_SET_LATENT_CLASS_NEW;*/

data DATA_SET_LATENT_CLASS_NEW; 
set  DATA_SET_LC_RENAMED; 
rename BUYING_EXPERIENCE_1_2_times_per = Item1 
       BUYING_EXPERIENCE_3_4_times_per = Item2 
       BUYING_EXPERIENCE_5_6_times_per = Item3 
       BUYING_EXPERIENCE_7__times_per_m = Item4
		BUYING_EXPERIENCE_Never = Item5 
       WINE_BOTTLES_1_3_bottles = Item6 
       WINE_BOTTLES_10_12_bottles = Item7 
       WINE_BOTTLES_12__bottles = Item8 
		WINE_BOTTLES_4_6_bottles = Item9 
       WINE_BOTTLES_7_9_bottles = Item10 
       WINE_BOTTLES_Less_than_1_bottle = Item11 
       WINE_BOTTLES_NA = Item12;

RUN;

proc print data=DATA_SET_LC_RENAMED;

* * 4-class model;
* 4-class model;
/* Mean and std of the data items 1 to 12*/

proc means data = DATA_SET_LC_RENAMED mean std;
  var Item1 - item12;
run;
/* GENERATING THE IDS FOR EACH RECORD AND OBSERVATION IN THE DATASET */

data DATA_SET_LC_RENAMED;
  set DATA_SET_LC_RENAMED;
  id=_n_;
run;
PROC PRINT DATA=DATA_SET_LC_RENAMED; 
RUN;

/* END OF GENERATING THE IDS COLUMNS*/
/*END of MEAN And STD*/
/*outest = wine_post&nc OUTPARAM = wine&nc  outpost=wine.outposts1&nc  OUTPARAM = test*/

	%macro wine_proclca(nc);
	proc lca data=DATA_SET_LC_RENAMED orig_weights OUTPARAM = test&nc outest=lca1_outests1&nc outpost = lca1_post&nc;
	 id id ;
	 nstarts 300 ;
	 nclass &nc ;
	 cores 4 ;
	 items Item1 Item2 Item3 Item4 Item5 Item6 Item7 Item8 Item9 Item10 Item11 Item12;
	 categories 2 2 2 2 2 2 2 2 2 2 2 2;
	 seed 1232 ;
	 rho prior=1;
	run ;
	%mend wine_proclca;

%wine_proclca(2) ; 
%wine_proclca(3) ; 
%wine_proclca(4) ; 
%wine_proclca(5);



%macro it (nc) ;
data lca1_outests1&nc ;
set lca1_outests1&nc ;
nclass=&nc ;
run ;
%mend ;
%it (2) ; %it(3) ; %it(4) ; %it(5) ;
data lca1_allfit_alc;
 set lca1_outests12 - lca1_outests15 ;
run ;
proc print data=lca1_allfit_alc noobs label ;
label nclass="Number of Classes"
 log_likelihood="LL" degrees_of_freedom="DF";
var nclass LOG_LIKELIHOOD DEGREES_OF_FREEDOM G_SQUARED AIC BIC CAIC ABIC
 ENTROPY ;
run ;



proc lca data=DATA_SET_LC_RENAMED orig_weights OUTPARAM = test4 outseeds=test4_outseeds;
	 id id ;
	 nstarts 300 ;
	 title " WINE Use: 4 Classes LCA" ;	
	 nclass 4;
	 cores 4 ;
	 items Item1 Item2 Item3 Item4 Item5 Item6 Item7 Item8 Item9 Item10 Item11 Item12;
	 categories 2 2 2 2 2 2 2 2 2 2 2 2;
	 seed 1232 ;
	 rho prior=1;
	run ;


%INCLUDE 'G:\MS Data Science\3rd semester\Questioner Data Analysis\LcaGraphicsV2-vbywrj\LcaGraphicsV2.sas';
%ItemResponsePlot(paramdataset=test4);

/*Model indentification*/
%IdentificationPlot(seedsdataset=test4_outseeds) ;

proc freq data = lca1_post4; 
table BEST;
run;


PROC LCA DATA=DATA_SET_LC_RENAMED;
		Title '3-Class Modal 12 items';
		NCLASS 3;
		ITEMS Item1 Item2 Item3 Item4 Item5 Item6 Item7 Item8 Item9 Item10 Item11 Item12;
		CATEGORIES 2 2 2 2 2 2 2 2 2 2 2 2;
		SEED 353554;
		
RUN;


/*
* 4-class model;
PROC LCA DATA=DATA_SET_LATENT_CLASS_NEW;
		Title '4-Class Modal 2 items';
		NCLASS 4;
		ITEMS WINE_BOTTLES_1_3_bottles WINE_BOTTLES_10_12_bottles WINE_BOTTLES_12__bottles WINE_BOTTLES_4_6_bottles WINE_BOTTLES_7_9_bottles WINE_BOTTLES_Less_than_1_bottle WINE_BOTTLES_NA;
		CATEGORIES 2 2 2 2 2 2 2;
		SEED 657865;
		
RUN;


 Update combined dataset and convert the buying experience and wines bottles into the numeric categories 




Work without converting the columns in to pivot and it gives the problem of 
%macro label_encode(dataset,var,newvar);
   proc sql noprint;
     select distinct(&var)
     into:val1-
     from &dataset;
 select count(distinct(&var))  into:mx from &dataset;
 quit;
 data COMBINED_DATA_SET_CAT_TO_NUM;
     set &dataset;
   %do i=1 %to &mx;
     if &var="&&&val&i" then &newvar=&i;
   %end;
   run;
 %mend;
 
%label_encode(CONVERTED_NUMERIC_TO_CHAR,BUYING_EXPERIENCE,BUYING_EXPERIENCE_NEW) ;
%label_encode(COMBINED_DATA_SET_CAT_TO_NUM,WINE_BOTTLES,WINE_BOTTLES_NEW) ;

proc sql;
     select distinct BUYING_EXPERIENCE,BUYING_EXPERIENCE_NEW
    
     from COMBINED_DATA_SET_CAT_TO_NUM;
 
 quit;
 
 proc sql;
     select distinct WINE_BOTTLES,WINE_BOTTLES_NEW
    
     from COMBINED_DATA_SET_CAT_TO_NUM;
 
 quit;
 
*/
/*proc sql;*/
/*     select distinct BUYING_EXPERIENCE*/
/*    */
/*     from CONVERTED_NUMERIC_TO_CHAR;*/
/* */
/* quit;*/
/* */
/* proc sql;*/
/*     select distinct WINE_BOTTLES*/
/*    */
/*     from CONVERTED_NUMERIC_TO_CHAR;*/
/* */
/* quit;*/
/* */


 /*
 * * 4-class model;
 * * 4-class model;
* 4-class model;
PROC LCA DATA=COMBINED_DATA_SET_CAT_TO_NUM;
		Title '3-Class Modal 2 items';
		NCLASS 3;
		ITEMS BUYING_EXPERIENCE_NEW;
		CATEGORIES 5;
		SEED 857829;
		
RUN;
 */
 /*
* 4-class model;
PROC LCA DATA=COMBINED_DATA_SET_CAT_TO_NUM;
		Title '3-Class Modal 2 items';
		NCLASS 3;
		ITEMS  WINE_BOTTLES_NEW;
		CATEGORIES 7;
		SEED 857829;
		
RUN;
*/

