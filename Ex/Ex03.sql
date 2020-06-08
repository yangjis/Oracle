--그룹함수를 배워보자.

select count(first_name)from employees;
select * from employees;
select avg(employee_id) from employees;
select max(employee_id) from employees;
select min(employee_id) from employees;
select sum(employee_id) from employees;

--avg(컬럼명): 평균을 구한다. 
select avg(salary), first_name from employees;
--금여의 평균 결과는 하나인데 이름은 하나로 표현할 수 없기 때문에 오라클은 에러를 출력한다.

select count(*) from employees;
select count(manager_id) from employees;
--특정 컬럼을 넣어주면 null값이 아닌 데이터가 들어있는 컬럼의 갯수만 카운트 해준다.

select count(commission_pct),
        count(*)
from employees;

--결과값이 로우 하나라면 그룹함수를 몇개라도 사용 가능.
select count(commission_pct),
        count(*),
        avg(salary)
from employees;

--이것은 에러. 각각 하나의 로우만 갖고있는데 월급은 하나 초과이기 때문에.
select count(commission_pct),
        count(*),
        avg(salary),
        salary
from employees;

select count(*)
from employees
where salary > 16000;

select count(*),
        count(manager_id)
from employees
where salary > 16000;

select sum(salary)
from employees;

--null은 계산에 참여하지 않는다
select avg(salary)
from employees
where salary > 16000;

--null을 0으로 변경하여 계산에 참여시킨다.
select avg(nvl(manager_id, 0))
from employees
where salary > 16000;

select max(salary)
    from employees;

--group by
select department_id, 
        avg(salary)
from employees
group by department_id
order by department_id asc;

select sum(salary),
        department_id
from employees
group by department_id
order by department_id asc;

select department_id, 
        count(*),
        sum(salary)
from employees
group by department_id;

select department_id, 
        job_id, 
        count(*), 
        sum(salary)
from employees
group by department_id, job_id
order by department_id asc;

--연봉(salary)의 합계가 20000이상인 부서의 부서 번호와, 인원수, 급여합계를 출력
select department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and department_id = 100
order by department_id asc; 

--case ~ end문: 자바의 if문과 같은 역활
select job_id,
        employee_id,
        salary,
        case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
            when job_id = 'SA_REP'      then salary + salary * 0.2
            when job_id = 'ST_CLERK'    then salary + salary * 0.3
            else salary
        end realSalary
from employees; 

select  salary,
        employee_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
             when job_id = 'SA_REP'     then salary + salary * 0.2
             when job_id = 'ST_CLERK'   then salary + salary * 0.3
             else salary
        end realSalary
from employees;

--decode문 : ==일때만 사용가능
select employee_id,
        salary,
        decode(job_id, 'AC_ACCOUNT', salary + salary * 0.1,
                        'SA_REP', salary + salary * 0.2,
                        'ST_CLERK', salary + salary * 0.3,
                salary) realSalary
from employees;

--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50이면 'A_TEAM'
--60~100이면 'B_TEAM' 110~150이면 'C_TEAM' 나머지는 '팀없음'으로 출력하세요.
select first_name, 
        department_id, 
        case when department_id >= 10 and department_id <= 50 then 'A_TEAM'
             when department_id >= 60 and department_id <= 100 then 'B_TEAM'
             when department_id >= 110 and department_id <= 150 then 'C_TEAM'
             else '팀없음'
        end realDepartment
from employees;

































