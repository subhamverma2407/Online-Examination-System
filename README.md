# Online-Examination-System
This is a small basic JSP project which will conduct an online examination of students.

# Student Panel
1. Here student can login and register to the system.
2. They can give exams 
3. Update their profile.
4. View their marks.

# Teacher Panel
1. Teacher can register and login to the system.
2. Update their profile.
3. Add and delete Question.
4. Start and stop the Exam.

# Admin Panel

1. Admin can login into the system.
2. Add or remove Teacher.
3. Add or remove Student.
4. Reset Exam.
5. View marks of students.

# Database Schema

# Student Table

 Name                                      Null?    Type
 ----------------------------------------- -------- -------------
 UNAME                                              VARCHAR2(30)
 USID                                      NOT NULL VARCHAR2(30)
 PASS                                               VARCHAR2(30)
 BRANCH                                             VARCHAR2(20)
 DOB                                                VARCHAR2(12)
 PHNO                                               NUMBER(12)
 EMAIL                                              VARCHAR2(50)
 STATUS                                    NOT NULL NUMBER(1)
 RESULT                                             NUMBER(3)
 
 # Teacher table
  Name                                      Null?    Type
 ----------------------------------------- -------- ------------
 TNAME                                              VARCHAR2(30)
 TID                                       NOT NULL VARCHAR2(10)
 PASS                                               VARCHAR2(30)
 DOB                                                VARCHAR2(10)
 PHNO                                               NUMBER(12)
 EMAIL                                              VARCHAR2(50)
 
 # Admin Table
  Name                                      Null?    Type
 ----------------------------------------- -------- ------------
 AID                                                VARCHAR2(10)
 PASS                                               VARCHAR2(20)
 
 # EXAMQUE(Questions and answers)
 
  Name                                      Null?    Type
 ----------------------------------------- -------- -------------
 QID                                       NOT NULL NUMBER(2)
 QUE                                                VARCHAR2(200)
 OPT1                                               VARCHAR2(200)
 OPT2                                               VARCHAR2(200)
 OPT3                                               VARCHAR2(200)
 OPT4                                               VARCHAR2(200)
 ANS                                                VARCHAR2(200)
 
 # EXAM(For exam status)
  Name                                      Null?    Type
 ----------------------------------------- -------- ---------
 EXAMSTATE                                 NOT NULL NUMBER(1)
