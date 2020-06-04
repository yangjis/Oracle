SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID, 
        FIRST_NAME, 
        LAST_NAME 
FROM EMPLOYEES;

SELECT FIRST_NAME, 
        PHONE_NUMBER,
        HIRE_DATE, 
        SALARY 
FROM EMPLOYEES;

SELECT FIRST_NAME, 
        LAST_NAME, 
        SALARY,
        PHONE_NUMBER,
        EMAIL,
        HIRE_DATE 
FROM EMPLOYEES;

SELECT FIRST_NAME, 
        PHONE_NUMBER, 
        HIRE_DATE, 
        SALARY 
FROM EMPLOYEES;

SELECT FIRST_NAME,
        LAST_NAME,
        SALARY,
        PHONE_NUMBER,
        EMAIL,
        HIRE_DATE
FROM EMPLOYEES;

SELECT EMPLOYEE_ID as empNo, 
        FIRST_NAME "E-name", 
        SALARY "연봉" 
FROM EMPLOYEES;

SELECT EMPLOYEE_ID AS empNo, 
        FIRST_NAME "E-name",
        salary AS "급여"
FROM EMPLOYEES;

SELECT FIRST_NAME "이름", 
        PHONE_NUMBER "전화번호", 
        HIRE_DATE "입사일",
        SALARY "급여" 
FROM EMPLOYEES;

SELECT FIRST_NAME "사원이름", 
        LAST_NAME "성", 
        SALARY "급여", 
        PHONE_NUMBER "전화번호",
        EMAIL "이메일",
         HIRE_DATE "입사일"
FROM EMPLOYEES;

--연결 연산자
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME || LAST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME ||' '||LAST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME ||' hire date is'||HIRE_DATE  empInfo FROM EMPLOYEES;
SELECT FIRST_NAME ||''' hire date is'''||HIRE_DATE FROM EMPLOYEES;    

--산술연산자
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, 
        SALARY*12 
FROM EMPLOYEES;

SELECT FIRST_NAME, 
        SALARY, --월급
        SALARY*12 --연봉
FROM EMPLOYEES;

SELECT FIRST_NAME,
        SALARY,
        SALARY * 12,
        (SALARY +300)*12, --한달에 한 번 상여금 300만원을 1년동안
        SALARY/30 --일급
FROM EMPLOYEES;

--글자타입은 계산 불가.
SELECT JOB_ID*12
FROM employees;

SELECT FIRST_NAME ||'-'|| LAST_NAME "성명",
        SALARY "급여",
        SALARY*12 "연봉",
        SALARY*12+5000 "연봉2",
        PHONE_NUMBER "전화번호"
FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10;

--연봉이 15000이상인 사원들의 이름과 연봉 출력
SELECT FIRST_NAME, 
        salary
from EMPLOYEES
WHERE salary >= 15000;

--07/01/01일 이후에 입사한 사원들의 이름과 입사일을 출력
SELECT FIRST_NAME, 
        HIRE_DATE
from employees
where HIRE_DATE > '07/01/01';

--이름이 Lex인 직원의 연봉을 출력
select salary
from employees
where first_name = 'Lex';

--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 출력
select first_name, 
        salary
from employees
where salary >= 14000  
and salary <= 17000;

--연봉이 14000이하이거나 17000이상인 사원의 이름과 연봉을 출력(둘 중 하나만 만족해도 출력)
select first_name, 
        salary
from employees
where salary >= 14000  
or salary <= 17000;

--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력
select first_name, 
        HIRE_DATE
from employees
where HIRE_DATE >= '04/01/01'
and HIRE_DATE <= '05/12/31';

--between절 사용하여 위에 명령문과 같은 결과를 출력.
--하지만 between절 보다는 위의 명령문이 조금 더 빠름.
select first_name, 
        HIRE_DATE
from employees
where HIRE_DATE between '04/01/01' and '05/12/31';

--IN연산자를 사용해보자.
--first_name이 Neena, Lex, John인 사람을 검색해보자
select first_name, 
        last_name, 
        salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--위에 IN연산자를 풀어 쓸경우 아래와 같음.
select first_name, 
        last_name, 
        salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

--연봉이 2100, 3100, 4100, 5100인 사원의 이름과 연봉을 출력
select first_name,
        salary
from employees
where salary in (2100,3100,4100,5100);

--Like연산자로 비슷한것들 모두 찾기
--%:임의의 길이의 문자열(공백 문자 가능)
--_:한글자 길이
select first_name, 
       last_name, salary
from employees
where first_name like 'L%';

--이름에 am을 포함한 사원의 이름과 연봉을 출력
select first_name,
        salary
from employees
where first_name like '%am%' ;

--이름의 두번째 글자가 a인 사원의 이름과 연봉을 출력
select first_name,
        salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a인 사원의 이름
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력
select first_name
from employees
where first_name like '__a_';

--Null: 아무런 값도 정해지지 않았음을 의미(0이 아님), not null이나 기본키에는 사용할 수 없음.
select first_name, 
        salary, 
        commission_pct, 
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--수당이 null인 사람의 이름과 급여와 수당을 출력.
select first_name, 
        salary, 
        commission_pct
from employees
where commission_pct is null;

--수당이 있는 사원의 이름과 연봉 커미션비율을 출력.
select first_name, 
        salary*commission_pct
from employees
WHERE commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력
select first_name
from employees
where manager_id is null
and commission_pct is null;

--order by절을 사용해서 정렬하기
--내림차순
select first_name, 
        salary
from employees
order by salary desc;

--오름차순
select first_name, 
        salary
from employees
order by salary asc;

--급여가 같은경우 이름에 앞글자가 a부터 시작한다.
select first_name, 
        salary
from employees
order by salary asc, first_name asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력
select department_id,
        salary, 
        first_name
from employees
order by department_id desc;

--급여가 1000이상인 직원의 이름, 급여를 출력하고 급여가 큰직원부터 정렬
select first_name, 
        salary
from employees
where salary >= 1000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같은 급여가 높은 사람부터 부서번호 급여 이름을 출력
select department_id,
        salary,first_name
from employees
order by department_id asc, salary desc;


