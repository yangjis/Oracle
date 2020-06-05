--initcap(컬럼명): 영어의 첫 글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
select email,
        initcap(email), 
        department_id
from employees
where department_id = 100;

--원하는 단어를 넣어 initcap을 실행해 볼 수 있다
select initcap('aaaaa')
from dual; --가상테이블을 만듦.

--lower(컬럼명)/upper(컬럼명): 입력되는 값을 전부 소문자/대문자로 변경하는 함수
select first_name,
        lower(first_name),
        upper(first_name)
from employees
where department_id = 100;

--원하는 단어를 넣어 lower/upper을 실행해 볼 수 있다
select
    lower('DDDDD'),
    upper('ddddd')
from dual;

--substr(컬럼명, 시작위치, 글자수): 주어진 문자열에서 특정길이의 문자열을 구하는 함수.
select first_name,
        substr(first_name,1,3),
        substr(first_name,-3,2)
from employees
where department_id = 100;

--원하는 단어를 넣어 substr을 실행해 볼 수 있다, 첫번째 글자는 0번째 자리이다.
select substr('abcdefg',0,3)
from dual;

--lpad(컬럼명, 자리수, '채울문자'),rpad(컬럼명, 자리수, '채울문자')
--lpad():왼쪽 공백에 특별한 문자로 채우기
--rpad():오른쪽 공백에 특별한 문자로 채우기
select first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees;

--replace(컬럼명, 문자1, 문자2):컬럼명에서 문자1을 문자2로 바꾸는 함수
select first_name,
        replace(first_name, 'a', '*')
from employees
where department_id = 100;

select first_name,
        replace(first_name, 'a','*'),
        substr(first_name,2,3),
        replace(first_name, substr(first_name,2,3),'***')
from employees
where department_id = 100;

--ltrim, rtrim, trim.: 치환.
select ltrim('                a                   ') || '---------',
        rtrim('                a                  ') || '--------',
        trim('                      a               ') || '-------'
from dual;

--round(m,n): 소수점 아래 n자리까지 반올림
select round(123.3456,2)"r2",
        round(123.3456,0)"r0",
        round(123.3456,-1)"r-1"
from dual;

--trunc(숫자, 출력을 원하는 자리수)
select trunc(123.346,2)as r2
from dual;

select trunc(123.349, 2) as r2,
        trunc(123.349, 0)as r0,
        trunc(123.349,-2)as "r-2"
from dual;

--sysdate: 현재 날짜 시간 반환        
select sysdate
from dual;

select sysdate,
        first_name
from employees;

--month_between(d1, d2): d1날짜와 d2날짜의 개월수를 출력하는 함수
select months_between(sysdate, hire_date)
from employees
where department_id = 110;

select  sysdate,
        hire_date,
        round(months_between(sysdate, hire_date),2)"months_between"
from employees
where department_id = 110;

--last_day, 숫자가 줄어듬
select last_day('20/06/06'),
        last_day(sysdate)
from dual;

--to_char(숫자, '출력모양')숫자형 -> 문자형으로 변환하기
select first_name, to_char(salary*12, '$999,999')"SAL"
from employees
where department_id = 110;

select first_name, 
        to_char(salary*12, '$999,999')"SAL",
        to_char(salary*12, '$999999,999'),
        to_char(salary*12, '$99999')
from employees
where department_id = 110;

select to_char(9876, '99999')
from dual;

--to_char(n, fmt)
select sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

--NVL(컬럼명, null일때 값)/NVL2(컬럼명, null이 아닐때 값, null일때 값)
select commission_pct, 
        nvl(commission_pct,0) 
from employees;

--NVL2
select first_name,
        commission_pct, 
        nvl(commission_pct,0),
        salary * nvl(commission_pct,0),
        nvl2(commission_pct, 100,0)
from employees;



