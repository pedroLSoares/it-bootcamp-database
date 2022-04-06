-- ## INSERT DATA ##

INSERT INTO author (name, nationality)VALUES
                          ('J.K. Rowling', 'British'),
                          ('Machado de Assis', 'Brasileiro'),
                          ('Stephen King', 'American'),
                          ('William Shakespeare', 'English'),
                          ('Dante Alighieri', 'Italian');

INSERT INTO book (title, publisher, area) VALUES
                            ('Harry Potter and the philosopher''s stone', 'Bloomsbury', 'Fantasy'),
                            ('Harry Potter and the Chamber of Secrets ', 'Bloomsbury', 'Fantasy'),
                            ('The Merchant of Venice', 'Simon & Schuster', 'Poetry'),
                            ('Divine Comedy', 'Simon & Schuster', 'Poetry'),
                            ('Doctor Sleep', 'Scribner', 'Drama');

INSERT INTO author_book VALUES
                               (1,1),
                               (2,1),
                               (3,4),
                               (4,5),
                               (5,3);

INSERT INTO student (name, last_name, address, career, age) VALUES
                            ('Pedro', 'Levada', 'Jundiaí', 'IT', 23),
                            ('Jonas', 'Silva', 'Campinas', 'Medic', 27),
                            ('Mark', 'William', 'New York', 'IT', 16),
                            ('Marina', 'Luísa', 'Paraná', 'Teacher', 21),
                            ('Henrique', 'Gomes', 'Jundiaí', 'architect', 33);

INSERT INTO loan VALUES
                (1, 1, '2021-12-22 00:00:00', '2022-01-04 00:00:00', true),
                (2, 4, '2022-02-15 00:00:00', null, false),
                (4, 3, '2022-03-05 00:00:00', '2022-03-20 00:00:00', true);


-- 1. Listar os dados dos autores.
SELECT * FROM author;

-- 2. Listar nome e idade dos alunos
SELECT name, age FROM student;

-- 3. Quais alunos pertencem à carreira de informática?
SELECT * FROM student WHERE career = 'IT';

-- 4. Quais autores são de nacionalidade francesa ou italiana?
SELECT * FROM author where nationality in ('Italian', 'French');

-- 5. Que livros não são da área da internet?
SELECT * FROM book where area != 'Internet';

-- 6. Listar os livros da editora Salamandra.
SELECT * FROM book where publisher = 'Salamandra';

-- 7. Listar os dados dos alunos cuja idade é maior que a média.
SELECT * FROM student WHERE age > (SELECT AVG(age) FROM student);

-- 8. Listar os nomes dos alunos cujo sobrenome começa com a letra G.
SELECT name FROM student WHERE last_name like 'g%';

-- 9. Listar os autores do livro "O Universo: Guia de Viagem". (Apenas nomes
-- devem ser listados.)
SELECT name FROM author WHERE id in
        (SELECT id_author FROM author_book where id_book in (
           SELECT id FROM book WHERE titlee = 'O Universo: Guia de Viagem'
         ));

-- 10. Listar autores que tenham nacionalidade italiana ou argentina.
SELECT * FROM author WHERE nationality in ('Italian', 'Argentine');

-- 11. Que livros foram emprestados ao leitor “Filippo Galli”?
SELECT * FROM loan
    LEFT JOIN book on book.id = loan.idBook
    LEFT JOIN student on student.id = loan.idStudent
    WHERE student.name = 'Filippo Galli';

-- 12. Listar o nome do aluno mais novo.
SELECT name from student WHERE age = (SELECT min(age) FROM student);

-- 13. Listar os nomes dos alunos a quem os livros de Banco de Dados foram
-- emprestados.
SELECT name from student
    LEFT JOIN loan on loan.idStudent = student.id
    WHERE loan.idBook in (SELECT id FROM book WHERE area = 'Database');

-- 14. Listar os livros que pertencem ao autor J.K. Rowling.
SELECT * FROM book
    LEFT JOIN author_book on author_book.id_book = book.id
    WHERE author_book.id_author in (SELECT id FROM author WHERE name = 'J.K. Rowling');

-- 15. Listar os títulos dos livros que deveriam ser devolvidos até 16/07/2021.
SELECT book.title FROM loan
    INNER JOIN book on book.id = loan.idBook
    WHERE loan.devolution_date < '2022-07-16';