select * from jobs;
데이터베이스 정의
 : 데이터베이스는 원래 같은 데이터가 서로 다른 목적을 가진 여러 응용시스템에
   중복되어 사용될 수 있는 개념에 기초를 두고 있다. 데이터베이스는 어느 한
  조직의 여러 응용 시스템이 공용될 수 있도록 통합, 저장딘 운영 데이터의 집합이다.
 (1) 통합된 데이터(Integrated Data)  : 데이터베이스는 똑같은 데이터가 원칙적으로
     중복되어 저장되지 않는다는 것을 말하며, 데이터의 중복은 관리상 복잡한 부작용을
     초래한다.
 (2) 저장된 데이터(Stored Data) : 컴퓨터가 접근할 수 있는 기억장치에 저장된 
     데이터를 말한다. 주로 하드디스크에 저장되어 관리된다.
 (3) 운영데이터(Operational Data) : 존재 목적이 명확하며 유용성을 지니고 있는
     데이터를 말한다. 즉, 단순히 데이터를 모아둔 개념이 아닌 병원 관리를 위한
     데이터 구축과 같은 목적이 분명한 데이터야만 한다.
 (4) 공용 데이터(Shared Data) : 여러 사용자가 서로 다른 목적으로 사용하는
     공유 가능한 데이터이다.

데이터베이스의 특징
 (1) 실시간 접근성(Real-time Accessibility) : 다수의 사용자의 요구에 대해서
     처리 시간이 몇 초를 넘기지 말아야 한다는 의미이다.
 (2) 지속적인 변화(Continuos Evolution) : 데이터베이스에 저장된 데이터는
     최신 정보가 정확하게 저장되어 처리되어야 한다.
 (3) 동시 공유(Concurrent Sharing) : 동일한 데이터를 동시에 서로 다른 목적으로
     사용할 수 있어야 한다.
 (4) 내용에 대한 참조 : 데이터베이스 내에 있는 데이터 레코드들은 주소나 위치에
     의해 참조되는 것이 아니라 가지고 있는 값에 따라 참조해야 한다.

데이터베이스관리시스템
 : 기업이 지속적으로 유지 관리해야 하는 데이터의 집합을 데이터베이스(Database)라
   하며, 이러한 방대한 양의 데이터를 편리하게 저장하고 효율적으로 관리하고
   검색할 수 있는 환경을 제공해주는 시스템 소프트웨어를 데이터베이스 관리시스템
   (Database Management System)이라고 하며 일반적으로 약어로 DBMS라 부른다.
 
관계형 데이터베이스 시스템(Relational DataBase Management System)
 : 일련의 정형화된 데이터 항목의 집합체로, 데이터베이스를 만들거나 이용하기가
   쉬우며 무엇보다도 확장이 용이하다는 장점이 있다. 또한 처음 데이터베이스를
   만든 후 관련되는 응용 프로그램들을 변경하지 않고도 새로운 데이터 항목을
   데이터베이스에 추가할 수 있다는 장점이 있다.
   대표적인 RDMS로는 오라클,인포믹스, MySQL, Access, MS-SQL등이 있다.
   RDMS는 정보를 저장하기 위한 구조를 위해 테이블을 이용한다.
   테이블은 2차원 형태의 표처럼 볼수 있수 있도록 로우(ROW:행)와 
   컬럼(COLUMN:열)으로구성된다.

데이터베이스 관리시스템의 구성요소 : 저장장치(데이터사전,데이터베이스)와 
  이를 사용하기 위한 데이터베이스 관리시스템(자료정의, 질의처리, 저장관리, 
  트랜잭션관리),사용자(데이터베이스관리자, 응용프로그래머, 최종사용자)등으로 구성된다.
 
데이터베이스 시스템 사용자
 (1) 데이터베이스 관리자(DBA) : 데이터베이스 설계와 정의, 관리 및 운영등
     데이터베이스 시스템을 관리하고 제어하는 사용자이다.
 (2) 응용프로그래머(Application Programmer) : 응용 프로그래머는 데이터베이스를
     실제적으로 설계하며 최종 사용자들의 요구에 맞는 인터페이스와 응용프로그램을
     개발한다.
 (3) 최종사용자(End User) : 데이터베이스를 실질적으로 사용하는 사용자이다.
 
 --테이블에서 컬럼에 해당하는 데이터를 검색하라.
 SELECT column1, column2, column3 FROM table;
 
 SELECT job_title, min_salary, max_salary FROM jobs;
 
 --한 라인 주석
 /*여러 라인 주석*/
 
 --컬럼명, 테이블명에 별칭을 지정할 수 있다.
 --별칭(alias)명으로 한글이나 영문 공백을 사용할 때는 ""(따옴표)을 지정한다.
 
 SELECT salary * 10 as "b o n u s" FROM employees;
 
 --컬럼명들을 하나의 문장처럼 출력할 때 결합연산자(||)을 사용한다.
 SELECT last_name || '님의 연봉은' || salary || '입니다.' as name FROM employees;
 
 --distinct은 중복제거를 한 후 출력해 주는 명령어이다.
 --컬럼에 있는 모든 값들이 똑같을 때 중복제거가 가능!
 --첫번째 컬럼명 앞에 쓴다('select'뒤에)
 select distinct first_name from employees where first_name='David';
 select distinct first_name, salary from employees where first_name='David';
 
 --SELECT 입력순서
 SELECT 컬럼명, 컬럼명 FROM 테이블명 WHERE 컬럼명='값' GROUP BY 컬럼명 HAVING 컬럼명='값' ORDER BY 컬럼명;
 
 --SELECT 해석순서
 FROM 테이블명 
 WHERE 컬럼명='값' 
 GROUP BY 컬럼명 
 HAVING 컬럼명='값' 
 SELECT 컬럼명, 컬럼명 
 ORDER BY 컬럼명;
 
 --employees 테이블에서 salary이 3000미만일때의 first_name, salary을 출력하라.
 SELECT first_name, salary FROM employees WHERE salary < 3000;
 
 --employees테이블에서 first_name 컬럼의 값이 'David' 일 때의 first_name, salary을 출력하시오.
 SELECT first_name, salary FROM employees WHERE first_name = 'David';
 
 --employees 테이블에서 first_name 값이 'David'가 아닐 때의 first_name, salary을 출력하라
 select first_name, salary from employees where first_name <> 'David';
 
 select first_name, salary from employees where first_name != 'David';
 
 --employees 테이블에서 salary이 3000, 9000, 17000일 때 first_name, hire_date, salary을 출력하라
 SELECT first_name, hire_date, salary from employees where salary=3000 or salary=9000 or salary=17000;
 SELECT first_name, hire_date, salary from employees where salary IN(3000,9000,17000);
 
 --employees 테이블에서 salary이 3000부터 5000까지 일 때의 first_name, hire_date, salary을 출력하라
 select first_name, hire_date, salary from employees where salary>=3000 and salary <= 5000;
 
 select first_name, hire_date, salary from employees where salary between 3000 AND 5000;
 
 --employees 테이블에서 job_id 가 'IT_PROG'이 아닐 때 first_name, email, job_id을 출력하라.
 select first_name, email, job_id from employees where job_id != 'IT_PROG';
 
select first_name, email, job_id from employees where job_id <> 'IT_PROG';

select first_name, email, job_id from employees where not (job_id = 'IT_PROG');

--employee테이블에서 salary이 3000부터 5000까지 아닐때의 first_name, hire_date, salary을 출력하라.
select first_name, email, job_id, salary from employees where salary not between 3000 and 5000;
select first_name, email, job_id, salary from employees where not (salary>=3000 and salary<=5000); 

--employees 테이블에서 commission_pct이 null 일 때 first_name, salary, commission_pct을 출력하라.
select first_name, salary, commission_pct from employees where commission_pct is null;

--employees 테이블에서 commission_pct이 null 이 아닐 때 first_name, salary, commission_pct을 출력하라.
select first_name, salary, commission_pct from employees where commission_pct is not null;

--employees 테이블에서 first_name에 'der'이 포함이란 first_name, salary, email을 출력하라.
--like...%der('der'으로 끝나는) der%('der'로 끝나는) %der%('der'이 포함된)
select first_name, salary, email from employees where first_name like '%der%';

--employees 테이블에서 first_name의 값 중 A로 시작하고 두 번째 문자는 임의 문자이며 exander로 끝나는 first_name, salary, email을 출력하라.
select first_name, salary, email from employees where first_name like 'A_exander';

--employees 테이블에서 job_id을 오름차순으로 first_name, email, job_id을 출력.
--오름차순(asc) / 내림차순(desc)
select first_name, email, job_id from employees order by job_id asc;

--employees 테이블에서 부서를 오름차순하고 사원명을 내림차순으로 department_id, first_name, salary를 출력하시오.
select department_id, first_name, salary from employees order by department_id asc, first_name desc;

-- employees 테이블에서 가장 최근 입사 순으로 사원의 first_name, salary, hire_date을 출력하시오.
select first_name, salary, hire_date from employees order by hire_date desc;

-- employees 테이블에서 직업이 'FI_ACCOUNT'인 사원들의 연봉이 높은순으로 first_name, job_id, salary을 출력하시오.
select first_name, job_id, salary from employees where job_id='FI_ACCOUNT' order by salary desc;

--////////////////////////////////////
--문제--
--/////////////////////////////////////

--급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
select employee_id, first_name from employees where salary<=17000;

--연봉이 5000이상이고 직업이 'IT_PROG'이 사원의 사원명(first_name), 연봉, 
--직업을 출력하시오.
select first_name, salary, job_id from employees where salary>=5000 and job_id='IT_PROG';

--부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서, 이메일을 출력하시오.
select first_name, department_id, email from employees where department_id in(10, 40, 50);

--사원명(first_name)이 even이 포함된 사원명,연봉,입사일을 출력하시오.
select first_name, salary, hire_date from employees where first_name like '%even%';

--사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,연봉,입사일을 출력하시오.
select first_name, salary, hire_date from employees where first_name like '_teve_';

--연봉이 17000이하이고 커미션이 널이 아닐때의 사원명(first_name), 연봉, 
-- 커미션을 출력하시오.
select first_name, salary, commission_pct from employees where salary<=17000 and commission_pct is not null;


================================
집합연산자(set operator)
 - 둘 이상의 query결과를 하나의 결과로 조합한다.
 -select의 인자 갯수가 같아야 한다. 첫번째 select가 2개이면 두번째 select도 2개여야 한다.
 - 타입이 일치해야 한다.  예를 들어 character이면 character이여야 한다.
집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
===============================================


--union(합집합)
SELECT department_id, first_name, last_name from employees where department_id=20 
union all 
SELECT department_id, first_name, last_name from employees where department_id=20;



create table emp01
as
select department_id, first_name, last_name
from employees
where department_id in(20,40,60);

select * from emp01;

create table emp02
as
select department_id, first_name, last_name
from employees
where department_id in(20,50,80);

select * from emp02;

select department_id, first_name, last_name from emp01 
union 
select department_id, first_name, last_name from emp02;

--intersect(교집합)
select department_id, first_name, last_name from emp01 
intersect
select department_id, first_name, last_name from emp02;

--ㅡminus(차집합)
select department_id, first_name, last_name from emp01 
minus
select department_id, first_name, last_name from emp02;


========================================
SQL(structured query language)함수
1. 단일행함수 : 행 하나당 하나의 결과를 출력한다
              (문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수)
2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다
               (합계, 평균, 최대, 최소, 갯수) 
========================================
--select문에서는 반드시 테이블명을 명시해야한다. 
--하지만 select절에 식이나 특정함수를 이용해서 결과값을
--가져올때 사용 할 수 있는 dual이라는 테이블을 제공하고있다.

SELECT 3+2
FROM dual;
	
SELECT sysdate
FROM dual;

--문자함수
--단어의 첫글자만 대문자로 변경해주는 함수이다.
select initcap('Korea hello')
FROM dual;

--모든 문자를 대문자로 변경해주는 함수이다.
select upper('korea')
from dual;

select upper(first_name), upper(last_name)
from employees;

--모든 문자를 소문자로 변경해주는 함수이다.
select lower('KOREA')
from dual;

select first_name, lower(first_name)
from employees;

--employees 테이블에서 first_name에서 대소문자 구분없이 'ja'가 포함이 된 first_name, salary을 출력하라
select first_name, salary from employees where lower(first_name) like '%ja%';

--문자의 길이를 리턴해주는 함수이다.
select length('korea') from dual;

select length('한국') from dual;

select lengthb('korea') from dual;

select lengthb('한국') from dual;

create table user1(data varchar2(5));

insert into user1(data) values('korea');

insert into user1(data) values('한국');


--문자열 결합을 해주는 함수이다.
select 'oracle' || 'java' from dual;

select concat('oracle','java') from dual;

select * from user1;


--특정범위의 문자를 추출해주는 함수이다.
--substr('문자',시작위치, 갯수) / 1부터 시작한다(자바와 다르다)
select substr('oracle test', 2, 4) from dual;

select substr('오라클 테스트', 4, 4) from dual;

select substrb('oracle test', 2, 4) from dual;

select substrb('오라클 테스트', 4, 4) from dual;

--특정문자의 인덱스를 추출해주는 함수이다.
select instr('korea', 'or') from dual;

select instr('한국자바', '자') from dual;

--특정문자의 바이트 인덱스를 추출해주는 함수이다.
select instrb('korea', 'or') from dual;

select instrb('한국자바', '자') from dual;

--주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수이다.
select lpad('korea', 8, '*') from dual;

--주어진 문자열에서 오른쪽으로 특정문자를 채우는 함수이다.
select rpad('korea', 8, '*') from dual;


--주어진 문자열에서 왼쪽의 특정문자를 삭제하는 함수이다.
select ltrim('***korea', '*') from dual;

--주어진 문자열에서 오른쪽의 특정문자를 삭제하는 함수이다.
select rtrim('korea***', '*') from dual;

--주어진 문자열에서 특정문자를 다른 문자로 변경해주는 함수이다.
select replace('oracle test', 'test', 'sample') from dual;

--주어진 문자열에서 조건에 맞는 문자가 포함되어 있을 때 출력해주는 함수이다.
select 'korea' from dual where 'korea' like '%a%' or 'korea' like '%b%' or 'korea' like '%c%';
select 'korea' from dual where regexp_like('korea','[abc]');

select first_name, salary from employees where first_name like 'D%';
select first_name, salary from employees where regexp_like(first_name, '^D');
select first_name, salary from employees where regexp_like(first_name, 'd$');


select '123 korea' from dual where regexp_like('1234 korea','[0-9]');


--employees 테이블에서 first_name의 컬럼에 'le' 또는 'A'가 포함된 데이터를 출력.
select first_name from employees where regexp_like(first_name,'le|A');



------------------------
숫자함수
------------------------
--3.55을 소수점 1의 자리까지 구하시오(반올림)
select round(3.55,1) from dual;

--2535.598을 십의 자리까지 구하시오(반올림)
select round(2535.598, -1) from dual;

--256.78을 무조건 올림한다.(올림)
select ceil(256.78) from dual;

--289.78에서 소수이하는 무조건 버린다.(버림)
select floor(289.78) from dual;

--2의 3승 (거듭제곱)
select power(2,3)from dual;

--25의 제곱근
select sqrt(25) from dual;

--나머지
select mod(10, 3) from dual;



------------------------
날짜함수
------------------------

-- 현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
select sysdate from dual;

-- 두 날짜 월의 차를 반환, 앞에 있는 값이 크면 +로 리턴하고 반대이면 -으로 리턴
select months_between('2013-01-01', '2013-09-30') from dual;

-- 첫 번째 인자의 달에 두번째 인자값을 더한 날짜를 반환
select add_months(sysdate, 10) from dual;

-- 첫 번째 인자의 기준으로 앞으로 다가올 날짜를 두 번째에서 지정한 요일의 날짜를 구함
select next_day(sysdate,'일요일') from dual;

--현재 날짜를 기준으로 달의 마지막 일을 구함
select last_day(sysdate) from dual;


--------------------
to_char()
1 숫자->문자
2 날짜->문자
--------------------
--숫자 -> 문자
--첫번째 인자값을 두번째 인자값의 형식으로 변환해주는 함수
select to_char(2532, '999,999.99') from dual;

select to_char(2532, '009,999.00') from dual;

select to_char(2532, '$999,999.99') from dual;

--각 나라의 통화를 표현해 줄 때 L기호를 사용한다.
select to_char(2532, 'L999,999.99') from dual;

--날짜 -> 문자
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day') from dual;

select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy') from dual;

select to_char(sysdate, 'yyyy-mon-dd hh:mi:ss dy') from dual;

select to_char(sysdate, 'yyyy-mon-dd hh24:mi:ss dy') from dual;


---------------------
to_number()
문자->숫자
---------------------
select to_number('253') from dual;

---------------------
to_date()
문자->날짜
---------------------
select to_date('2013-10-14', 'yy-mm-dd') from dual;

--hire_date(입사일)을 이용해서 '홍길동님은 2003년 1월 3일에 입사했습니다'로 출력하는 query를 작성하시오.
select first_name || '님은 ' || to_char(hire_date, 'yyyy') || '년 ' || to_char(hire_date, 'mon') || ltrim(to_char(hire_date, 'dd'), '0') || '일에 입사했습니다.'
from employees;


--------------------
일반함수
nvl()
--------------------
--nvl(컬럼, 대체값) : 첫 번째 인자값이 null이면 0으로 대체해서 출력한다.
--대체할 값이 숫자이면 두 번째 인자값에 숫자를 지정한다.
--대체할 값이 문자이면 두 번째 인자값에 문자를 지정한다.
--대체할 값이 날짜이면 두 번째 인자값에 날짜를 지정한다.

--commission_pct 컬럼의 값이 null인 경우 0으로 대체해서 출력한다.
select first_name, commission_pct, nvl(commission_pct, 0) from employees;

--nvl2(컬럼, 대체1, 대체2) : 컬럼의 값이 null 아니면 대체1로, null이면 대체2로 출력한다.
select commission_pct, nvl2(commission_pct, commission_pct, -1) from employees;


------------------------------
일반함수
decode()
------------------------------
--decode(컬럼, 조건1, 값1, 조건2, 값2, 조건3, 값3, 그 밖의 값)
--department_id 값이 10이면 'AA', 20이면 'BB', 30이면 'CC' 그 밖의 값은 'DD'
--java의 switch-case 문과 비슷
select first_name, department_id, decode(department_id, 10, 'AA', 20, 'BB', 30, 'CC', 'DD') as code 
from employees 
where department_id <= 50;


------------------------------
일반함수
case()
------------------------------
case when 조건1 then 결과1
	   when 조건2 then 결과1
	   when 조건3 then 결과1
	   else 결과n
end

자바의 다중 if~else 제어문과 비슷하다.

select first_name, department_id,
		  case
		  when department_id=10 then 'AA'
		  when department_id=20 then 'BB'
		  when department_id=30 then 'CC'
		  else 'DD'
		  end as code
from employees
where department_id <= 50;


--입사일에서 월이 1-3이면 '1사분기', 4-6이면 '2사분기', 7-9이면 '3사분기', 10-12이면 '4사분기' 로 처리를 하고 
--사원명(first_name), 입사일(hire_date), 분기로 출력하시오.
select first_name as "사원명", hire_date as "입사일",
		case
		when to_char(hire_date, 'mm')<=3 then '1사분기'
		when to_char(hire_date, 'mm')<=6 then '2사분기'
		when to_char(hire_date, 'mm')<=9 then '3사분기'
		else '4사분기'
		end as "분기"
from employees;




-----------------------
그룹함수
-----------------------
--max(컬럼) : 최대값
select max(salary) from employees;

--min(컬럼) : 최소값
select min(salary) from employees;

--count(컬럼) : 갯수
select count(salary) from employees;

select count(*) from employees;

--sum(컬럼) : 합계
select sum(salary) from employees;

--avg(컬럼) : 평균
select avg(salary) from employees;



--그룹함수는 단순컬럼과 함께 사용할 수 없다.(출력되는 레코드수가 다르기 때문이다)
select first_name, count(*) from employees;

--그룹함수와 단순컬럼을 사용하기 위해서는 단순컬럼을 그룹화 해야 한다.(group by 절 사용)
select department_id, count(*) from employees group by department_id order by department_id;

--Null이 아닌 부서별의 직원수를 출력하시오
select department_id, count(*)
from employees
where department_id is not null --개별 컬럼의 조건
group by department_id
having department_id <= 50 --group의 조건
order by department_id;


--부서별 최소연봉, 최대연봉을 출력하시오.(부서별 오름차순)
select department_id, min(salary), max(salary)
from employees
group by department_id;
order by department_id asc;

--직업별(job_id) 연봉합계를 출력하시오.
select job_id, sum(salary)
from employees
group by job_id
order by job_id;

============================================
조인(join) : 한개 이상의 테이블에서 원하는 데이터를 추출해주는 쿼리문이다.
join은 oracle제품에서 사용되는 oracle용 join이 있고 모든 제품에서 공통적으로
 사용되는 표준(ansi) join이 있다.
==============================================

1 cartesian product(카티션 곱) 조인 : 테이블 행의 갯수만큼 출력해주는 조인이다.
  employees테이블의 행의 갯수가 10이고, job테이블의 행의 갯수가 5개 이면 총 50개의 결과를 출력한다.
(1) oracle용 cartesian product
  select e.department_id, e.first_name, e.job_id, j.job_title
  from employees e ,jobs j;
  
(2) ansi용 cartesian product
  select e.department_id, e.first_name, e.job_id, j.job_title
  from employees e cross join jobs j;
  
	
 2 equi join
  가장 많이 사용되는 조인방법으로 조인 대상이 되는 두 테이블에서 공통적으로
  존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 방법이다.
  (1)oracle용 equi join
   select e.first_name, e.salary, e.job_id, j.job_title
   from employees e, jobs j
   where e.job_id=j.job_id;
   
  (2)ansi용 equi join
    select e.first_name, e.salary, e.job_id, j.job_title
    from employees e join jobs j
    on  (e.job_id=j.job_id);
    
--employees와 departments 테이블에서 사원번호(employee_id), 부서번호(department_id), 부서명(department_name)을 검색하시오.
select e.employee_id, e.department_id, d.department_name
from employees e, departments d
where e.department_id=d.department_id;

--employees와 jobs테이블에서 사원번호(employee_id), 직업번호(job_id), 직업명(job_title)을 검색하시오.
select e.employee_id, e.job_id, j.job_title
from employees e, jobs j
where e.job_id = j.job_id;


--job_id가 'FI_MGR'인 사원이 속한 연봉(salary)의 최소값(min_salary),
--최대값(max_salary)을 출력하시오. 
select e.job_id, e.salary, j.min_salary, j.max_salary
from employees e, jobs j
where e.job_id=j.job_id and e.job_id = 'FI_MGR';
 
  
    
--부서가 'Seattle'에 있는 부서에서 근무하는  
--직원들의 first_name, hire_date, department_name, city 
--출력하는 SELECT문장을 작성하여라(결과 18행) 
select e.first_name, e.hire_date, d.department_name, l.city
from employees e, departments d, locations l
where l.city = 'Seattle' and e.department_id = d.department_id and l.location_id = d.location_id;

    
--20번 부서의 이름과 그 부서에 근무하는 사원의 이름을 출력하시오.(결과2행) 
select d.department_name, e.first_name
from employees e, departments d
where e.department_id = d.department_id and d.department_id = 20;
 
    
 --1400,1500 번 위치의 도시 이름과 그곳에 있는 부서의 이름을 출력하시오.(결과2행)
 select l.city, d.department_name
 from locations l, departments d
 where l.location_id = d.location_id and l.location_id in (1400,1500);
 
 
 3. non_equi join
 (=)연산자를 제외한 >=, <=, >, < 등의 연산자를 이용해서 조건을 지정하는 조인방법이다.  
 (1)oracle용 non_equi join 
 select e.first_name, e.salary, j.job_title
 from employees e, jobs j
 where e.job_id=j.job_id
  and e.salary>=j.min_salary
  and e.salary<=j.max_salary;
  
 (2)ansi용 non_equi join
 select e.first_name, e.salary, j.job_title
 from employees e  join  jobs j
  on e.job_id=j.job_id 
    and e.salary>=j.min_salary
    and e.salary<=j.max_salary;
    
    
 4 outer join
  한쪽 테이블에는 데이터가 있고 다른 반대쪽에는 데이터가 없는 경우에 데이터가 있는 
  테이블의 내용을 모두 가져오는 조인이다. 
 
  oracle용 outer join  
  select e.first_name, e.employee_id, d.department_id
  from employees e, departments d
  where e.department_id=d.department_id(+)
  order by e.employee_id;
  
  ansi용 outer join
  select e.first_name, e.employee_id, d.department_id
  from employees e  left outer join departments d
  on( e.department_id=d.department_id)
  order by e.employee_id;
 
  
  
  select e.employee_id, e.first_name, nvl(d.department_name, '<미배치>')
  from employees e, departments d
  where e.department_id=d.department_id(+)
  order by e.employee_id;
  
  
  
  
  5 self join
  하나의 테이블을 두개의 테이블로 설정해서 사용하는 조인방법이다. 
  oracle용  self join
  select 
  e.employee_id as "사원번호",
  e.first_name as "사원이름",
  e.manager_id as "관리자번호",
  m.first_name as "관리자명"
  from employees e, employees m
  where e.manager_id=m.employee_id;  
  
 ansi용 self join
  select e.employee_id, e.first_name, e.manager_id, m.first_name
  from employees e join employees m
  on ( e.manager_id=m.employee_id); 
  
  select employee_id, first_name, manager_id from employees;
  
  --사원테이블에서 manager가 null값 일 때에도 결과가 나오도록 사원의 매니저를 출력하시오(Lex 사원의 매니저는 Steven입니다.)
  select e.first_name || '사원의 매니저는 '|| nvl(m.first_name, '자신') || '입니다.' as "결과"
  from  employees e, employees m
  where e.manager_id = m.employee_id(+);
  
  
  
  
  --------------------------------------------
서브쿼리
외부 쿼리 (주쿼리)
 :일반 쿼리를 의미합니다.
스칼라 서브쿼리
 :SELECT 절에 쿼리가 사용되는 경우로, 함수처럼 레코드당 정확히 하나의 값만을 반환하는 서브쿼리입니다.
인라인 뷰
 :FROM 절에 사용되는 쿼리로, 원하는 데이터를 조회하여 가상의 집합을 만들어 조인을 수행하거나 가상의 집합을 다시 조회할 때 사용합니다.
서브 쿼리
 :HERE,HAVING 절에 사용되는 쿼리입니다.
//////////////
서브쿼리는 하나의 select문장의 절 안에 포함된 또 하나의 select문장이다.
서브쿼리를 포함하고 있는 쿼리문을 메인쿼리, 포함된 또 하나의 쿼리를 서브쿼리라 한다.
서브쿼리는 비교연산자의 오른쪽에 기술해야 하고 반드시 괄호 안에 넣어야한다.
서브쿼리는 메인쿼리가 실행되기 이전에 한번만 실행이 된다.
서브쿼리는 단일행 서브쿼리와 다중행 서브쿼리로 나눈다.
단일행 서브쿼리는 오직 하나의 로우(행)로 반환되는 서브쿼리의 결과는 메인쿼리로
   보내는데 메인 쿼리의 where 절에서는 단일행 비교연산자인 =, >,>=, <, <=, <>를
   사용해야 한다.
다중행 서브쿼리는 다중행연산자(in, any(some), all, exists)와 함께 사용해야한다.
   in : 메인쿼리의 비교조건('='연산자로 비교할 경우)이 서브쿼리의 결과 중에서
         하나라도 일치하면 참이다.
   any,some : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면
          참이다.
   all : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참이다.
   exists : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도
          존재하면 참이다.
//////////
서브 쿼리 사용:SELECT, FROM, WHERE, HAVING, INSERT문의 VALUES, UPDATE문의 SET, CREATE문
/////////
서브쿼리와 조인 비교
		서브쿼리						
결과 집합	외부쿼리(메인쿼리) 레벨로 결과 집합이 생성		
컬럼 사용	외부쿼리의 컬럼을 사용할 수 있지만 서브쿼리의 컬럼을 외부에서 사용할 수 없다.

                조인
결과 집합	조인되는 테이블간의 곱 레벨이 집합이 생성
컬럼 사용	조인되는 테이블의 컬럼을 모두 사용할 수 있다.
//////
**결과 집합이 하나의 테이블 레벨이고 다른 테이블을 체크의 용도로 사용한다면 조인이 아닌 서브쿼리를 사용해야 합니다.
---------------------------------------------------------------  
  

--Lex가 근무하는 부서명을 출력하시오.
select department_id
from employees
where first_name = 'Lex';

select department_name
from departments
where department_id=90;

select department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name='Lex';

select department_name
from deparments
where department_id=(select department_id from employees where first_name='Lex');



-- Lex와 같은 부서에 근무하는 사원 이름과 부서번호를 출력하시오.

select department_id
from employees
where first_name='Lex';

select first_name, department_id
from employees
where department_id=90;

select a.first_name, e.department_id
from employees a, employees e
where a.department_id=e.department_id
and e.first_name='Lex';