/*
Zoe Rochelle
CSC342 Lab 1
*/

Create or Replace Procedure labfee_difference
(dept Char, Highest_OUT Out Number, Lowest_OUT Out Number, Difference_OUT Out Number)
IS
Highest Number; lowest Number;
Begin

IF DEPT IS NULL THEN
 select MAX(CLABFEE), MIN(CLABFEE)
 into Highest, Lowest
 from COURSE;
 Highest_OUT := Highest;
 Lowest_OUT := Lowest;
 Difference_OUT := Highest - Lowest;
 DBMS_OUTPUT.PUT_LINE('Department: None');
 DBMS_OUTPUT.PUT_LINE('max value: ' ||Highest_OUT);
 DBMS_OUTPUT.PUT_LINE('min value: ' ||Lowest_OUT);
 DBMS_OUTPUT.PUT_LINE('difference: ' ||Difference_OUT);
 
ELSE
 select MAX(CLABFEE), MIN(CLABFEE)
 into Highest, Lowest
 from COURSE
 where CDEPT = dept;
 Highest_OUT := Highest;
 Lowest_OUT := Lowest;
 Difference_OUT := Highest - Lowest;
 DBMS_OUTPUT.PUT_LINE('Department: ' ||dept);
 DBMS_OUTPUT.PUT_LINE('max value: ' ||Highest_OUT);
 DBMS_OUTPUT.PUT_LINE('min value: ' ||Lowest_OUT);
 DBMS_OUTPUT.PUT_LINE('difference: ' ||Difference_OUT);
 END IF;
End;
/

/* Execute with either of the following */
Variable c Number
Execute labfee_difference(NULL, :c, :c, :c);

Variable c Number
Execute labfee_difference('PHIL', :c, :c, :c);
