CREATE TABLE "department" (
                              "dtp_nr" varchar (24),
                              "department_name" varchar(255) NOT NULL,
                              "location" varchar(255) NOT NULL,
                              PRIMARY KEY ("dtp_nr")
);

CREATE TABLE "employee" (
                          "cod_func" varchar(24) NOT NULL ,
                          "first_name" varchar(255) NOT NULL,
                          "last_name" varchar(255) NOT NULL,
                          "role" varchar(100) NOT NULL,
                          "discharge_date" timestamp NULL DEFAULT NULL,
                          "salary" numeric(16,2) NOT NULL,
                          "commission" numeric(16,2) NOT NULL,
                          "dtp_nr" varchar (24),
                          PRIMARY KEY ("cod_func"),
                          CONSTRAINT "dtp_nr_foreign" FOREIGN KEY ("dtp_nr") REFERENCES "department" ("dtp_nr")
);



INSERT INTO department VALUES ('D-000-1', 'Software', 'Los Tigres'), ('D-000-2', 'Sistemas', 'Guadalupe'), ('D-000-3', 'Contabilidade', 'La Roca'), ('D-000-4', 'Vendas', 'Plata');

INSERT INTO employee VALUES
                            ('E-0001', 'César', 'Piñero', 'Vendedor', '2018-05-12 00:00:00', 80000, 15000, 'D-000-4'),
                            ('E-0002', 'Yosep', 'Kowaleski', 'Analista', '2015-07-14 00:00:00', 140000, 0, 'D-000-2'),
                            ('E-0003', 'Mariela', 'Barrios', 'Diretor', '2014-06-05 00:00:00', 185000, 0, 'D-000-3'),
                            ('E-0004', 'Jonathan', 'Aguilera', 'Vendedor', '2015-06-03 00:00:00', 85000, 10000, 'D-000-4'),
                            ('E-0005', 'Daniel', 'Brezezicki', 'Vendedor', '2018-03-03 00:00:00', 83000, 10000, 'D-000-4'),
                            ('E-0006', 'Mito', 'Barchuk', 'Presidente', '2014-06-05 00:00:00', 190000, 0, 'D-000-3'),
                            ('E-0007', 'Emilio', 'Galarza', 'Desenvolvedor', '2014-08-02 00:00:00', 60000, 10000, 'D-000-1');
