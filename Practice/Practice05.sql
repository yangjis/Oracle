/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)*/
select first_name, 
        manager_id, 
        commission_pct, 
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

/*문제2. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 
전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)*/
select employee_id,
        first_name,
        salary,
        to_char(hire_date, 'YYYY-MM-DD DAY'),
        replace(phone_number, '.','-'),
        department_id
from employees
where (department_id, salary)in(select department_id,
                                        max(salary) salary
                                from employees
                                group by department_id)
order by salary desc;

/*문제3
2005년 이후 입사자중 매니저별로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별로 평균급여가 5000이상 중에 
매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여를 출력합니다.
매니저별평균급여의 내림차순으로 정렬하고 매니저별평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.
(18건)*/
select e.employee_id,
        e.first_name,
        round(m.mAvg,1) mAvg,
        m.mMin,
        m.mMax
from employees e, (select manager_id, max(salary)mMax, avg(salary)mAvg, min(salary)mMin 
                    from employees 
                    where hire_date >= '2005/01/01'
                    group by manager_id
                    having manager_id is not null)m
where e.employee_id = m.manager_id
and m.mAvg >= 5000
order by mAvg desc;

/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 
매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)*/
select e.employee_id,
        e.first_name,
        d.department_name,
        m.first_name
from employees e, departments d, employees m
where e.manager_id = m.employee_id
and e.department_id = d.department_id(+);

/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요*/
--방법1
select e.employee_id,
        e.first_name,
        d.department_name,
        e.salary,
        e.hire_date
from  (select rownum rn,
            first_name,
            salary,
            hire_date,
            employee_id,
            department_id
        from (select first_name,
                     salary,
                     hire_date,
                     employee_id,
                     department_id
              from employees
              where hire_date > '2004/12/31'
              order by hire_date asc))e,
        departments d
where e.department_id = d.department_id
and e.rn >=11 
and e.rn <=20
order by rn asc ;

--방법2
select e.employee_id,
        e.first_name,
        d.department_name,
        e.salary,
        e.hire_date
from employees e, departments d
where e.department_id = d.department_id
and e.employee_id in(select employee_id
                     from(select rownum rn,
                                 employee_id
                          from(select employee_id
                               from employees
                               where hire_date > '2004-12-31'
                               order by hire_date asc))
                    where rn >= 11
                    and rn <= 20);



/*문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?*/
--방법1
select e.first_name||' '||e.last_name, 
        e.salary, 
        d.department_name
from (select max(hire_date) mH from employees)s, 
       employees e,
       departments d
where s.mH = e.hire_date
and e.department_id = d.department_id;

--방법2
select e.first_name||' '||e.last_name, 
        e.salary, 
        d.department_name
from employees e,
     departments d
where e.hire_date = (select hire_date
                    from(select rownum rn,
                                hire_date
                            from (select hire_date
                                  from employees
                                  order by hire_date desc))
                    where rn = 1)
and d.department_id = e.department_id;
 
/*문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과  
업무(job_title), 연봉(salary)을 조회하시오.*/
--방법1
select e.employee_id,
        e.last_name,
        e.first_name,
        e.salary,
        s.mSalary,
        j.job_title
from employees e, 
    (select rownum,
            department_id,
            mSalary
     from(select department_id, 
                 avg(salary) mSalary
           from employees 
           group by department_id
           order by mSalary desc)
      where rownum = 1)s,
    jobs j
where s.department_id = e.department_id
and j.job_id = e.job_id;


--방법2
select e.employee_id, e.last_name,e.first_name,e.salary,j.job_title
from employees e, jobs j
where j.job_id = e.job_id
and e.department_id = (select department_id
                       from(select rownum, department_id
                            from(select department_id,
                                 avg(salary) aSalary
                                 from employees
                                 group by department_id
                                 order by aSalary desc)
                        where rownum = 1));



/*문제8.
평균 급여(salary)가 가장 높은 부서는?*/
--방법1
select d.department_name
from (select rownum,
            department_id,
            mSalary
     from(select department_id, 
                 avg(salary) mSalary
           from employees 
           group by department_id
           order by mSalary desc)
      where rownum = 1)s,
    departments d
where d.department_id = s.department_id;


--방법2
select department_name
from departments 
where department_id = (select department_id 
                       from(select rownum,
                                   department_id
                            from(select department_id, 
                                        avg(salary) mSalary
                                from employees 
                                group by department_id
                                order by mSalary desc)
                            where rownum = 1));



/*문제9.
평균 급여(salary)가 가장 높은 지역은?*/
select region_name
from(select rownum, region_name
    from (select  r.region_name region_name,
                  avg(e.salary) mSalary
          from employees e, 
          departments d, 
          locations l, 
          countries c, 
          regions r
          where e.department_id = d.department_id
          and d.location_id = l.location_id
          and l.country_id = c.country_id
          and c.region_id = r.region_id
          group by d.location_id, r.region_name
          order by mSalary desc)
where rownum = 1);

/*문제10.
평균 급여(salary)가 가장 높은 업무는?*/
--방법1
select j.job_title
from(select rownum,
            job_id     
    from(select job_id, 
                avg(salary) mSalary
                from employees 
                group by job_id
                order by mSalary desc)
        where rownum = 1)e,
        jobs j
where j.job_id = e.job_id;

--방법2
select job_title
from jobs
where job_id = (select job_id
                from(select rownum rn,
                            job_id
                     from(select job_id, 
                                 avg(salary) salary
                         from employees 
                         group by job_id
                         order by salary desc))
                where rn = 1);
        
