-- 1. Selecione o nome, cargo e localização dos departamentos onde os vendedores trabalham.
SELECT e.first_name, e.role, d.location FROM employee e
    INNER JOIN department d on d.dtp_nr = e.dtp_nr;

-- 2. Visualize departamentos com mais de cinco funcionários.
SELECT d.dtp_nr, department_name, COUNT(*) as employees FROM department d
    LEFT JOIN employee e on e.dtp_nr = d.dtp_nr
    GROUP BY d.dtp_nr
    HAVING COUNT(*) > 5;

-- 3. Exiba o nome, salário e nome do departamento dos funcionários que têm o mesmo
-- cargo que 'Mito Barchuk'.
SELECT e.first_name, e.salary, d.department_name FROM employee e
    INNER JOIN department d on d.dtp_nr = e.dtp_nr
    WHERE e.role = (SELECT role FROM employee WHERE first_name = 'Mito' AND last_name = 'Barchuk');

-- 4. Mostre os dados dos funcionários que trabalham no departamento de contabilidade, ordenados por nome.
SELECT * FROM employee
WHERE dtp_nr in (SELECT dtp_nr FROM department WHERE department_name = 'Contabilidade')
ORDER BY first_name;

-- 5. Mostre o nome do funcionário que tem o menor salário.
SELECT first_name FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 6. Mostre os dados do funcionário que tem o maior salário no departamento 'Vendas'.
SELECT first_name FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);