CREATE TABLE "PACIENTE" ( 
	"DNI" VARCHAR(10) NOT NULL , 
	"NOMBRE" VARCHAR(45) NOT NULL , 
	"APELLIDO" VARCHAR(45) NOT NULL , 
	"NACIMIENTO" VARCHAR(45) NOT NULL , 
	"SSOCIAL" VARCHAR(13) NOT NULL , 
	"TELEFONO" INT NOT NULL , 
	"EMAIL" VARCHAR(45) NOT NULL , 
	"PASSWORD" VARCHAR(45) NOT NULL , 
	PRIMARY KEY ("DNI"));
INSERT INTO "PACIENTE" VALUES 
('42367894P', 'Eduardo', 'Ortega Naranjo','1993-10-13','786589451235T', 635987412, 'hola@gmail.com', '1234'),
('45652178Q', 'Timon', 'Berkowitz','1994-11-08','786580000035T', 985632147, 'timon@gmail.com', '1234');



CREATE TABLE "MEDICO" ( 
	"COLEGIADO" VARCHAR(10) NOT NULL , 
	"NOMBRE" VARCHAR(20) NOT NULL , 
	"APELLIDO" VARCHAR(20) NOT NULL , 
	"DNI" VARCHAR(10) NOT NULL , 
	"TELEFONO" INT NOT NULL , 
	"EMAIL" VARCHAR(25) NOT NULL , 
	"PASSWORD" VARCHAR(30) NOT NULL , 
	"LOCALIZACION" VARCHAR(20) NOT NULL , 
	"ESPECIALIDAD" VARCHAR(20) NOT NULL , 
	"MINUTOSCONSULTA" INT NOT NULL , 
	PRIMARY KEY ("COLEGIADO"));
INSERT INTO "MEDICO" VALUES 
('555000000', 'Gregory', 'House', '42300094P', 635987412, 'house@gmail.com', '1234', 'California', 'Medicina Interna', 30),
('333000000', 'Pumba', 'Smith', '42300111P', 635000772, 'pumba@gmail.com', '1234', 'Tafira', 'Nutricion', 30);



CREATE TABLE "HISTORIAL" ( 
	"ID" INT NOT NULL , 
        "FECHACREACION" VARCHAR(45) NOT NULL , 
        "PACIENTE" VARCHAR(10) NOT NULL , 
	"ALERGIAS" VARCHAR(255) NOT NULL , 
	PRIMARY KEY ("ID"),
        FOREIGN KEY ("PACIENTE") REFERENCES "PACIENTE"("DNI"));
INSERT INTO "HISTORIAL" VALUES 
(0, '2017-04-03', '45652178Q', 'no conocidas'),
(1, '2017-04-03', '42367894P', 'polem');



CREATE TABLE "HISTORIA" ( 
	"ID" INT NOT NULL , 
        "FECHACREACION" VARCHAR(45) NOT NULL , 
        "MEDICO" VARCHAR(10) NOT NULL , 
	"DESCRIPCION" VARCHAR(255) NOT NULL , 
        "HISTORIAL" INT NOT NULL , 
	PRIMARY KEY ("ID"),
        FOREIGN KEY ("HISTORIAL") REFERENCES "HISTORIAL"("ID"),
        FOREIGN KEY ("MEDICO") REFERENCES "MEDICO"("COLEGIADO"));
INSERT INTO "HISTORIA" VALUES 
(0, '2017-04-13', '333000000', 'dolor estomacal', 0),
(1, '2017-04-25', '555000000', 'dificultad para respirar', 1);



CREATE TABLE "HORARIO" ( 
	"ID" INT NOT NULL , 
        "MEDICO" VARCHAR(10) NOT NULL , 
        "DIASEMANA" VARCHAR(9) NOT NULL , 
	"HORAINICIO" VARCHAR(5) NOT NULL , 
        "HORAFIN" VARCHAR(5) NOT NULL , 
	PRIMARY KEY ("ID"),
        FOREIGN KEY ("MEDICO") REFERENCES "MEDICO"("COLEGIADO"));
INSERT INTO "HORARIO" VALUES 
(0, '333000000', 'LUNES' , '10:00', '15:00'),
(1, '333000000', 'MARTES', '14:00', '18:00'),
(2, '555000000', 'LUNES' , '09:00', '14:00'),
(3, '555000000', 'MARTES', '14:00', '18:00'),
(4, '333000000', 'JUEVES', '10:00', '15:00');



CREATE TABLE "CITA" ( 
	"ID" INT NOT NULL , 
        "FECHA" VARCHAR(45) NOT NULL ,
        "PACIENTE" VARCHAR(10) NOT NULL , 
        "MEDICO" VARCHAR(10) NOT NULL , 
	"HORA" VARCHAR(5) NOT NULL , 
	PRIMARY KEY ("ID"),
        FOREIGN KEY ("PACIENTE") REFERENCES "PACIENTE"("DNI"),
        FOREIGN KEY ("MEDICO") REFERENCES "MEDICO"("COLEGIADO"));
INSERT INTO "CITA" VALUES 
(0, '2017-04-13', '45652178Q', '333000000', '10:00'),
(1, '2017-04-25', '42367894P', '555000000', '14:00');

INSERT INTO "PACIENTE" VALUES 
('12345678A', 'Poco', 'Yo','2007-02-29','123456789124Q', 928789456, 'pocoyo@gmail.com', '1234'),
('14725836R', 'África', 'Romero','1978-06-12','963147753159V', 928456684, 'africa@gmail.com', '1234'),
('42986175P', 'Aarón', 'Castillo de la Fuente','1969-11-18','159753468122W', 928743691, 'aarón@gmail.com', '1234'),
('80940193L', 'Arantxa', 'Etxebarria','1984-01-26','789127893146X', 928129472, 'arantxa@gmail.com', '1234'),
('32368475T', 'Aurora', 'Fuentes','1956-08-11','761349861456Y', 649751345, 'aurora@gmail.com', '1234'),
('58165170X', 'Amparo', 'Benitez','1998-08-14','156789413540V', 657984613, 'amparo@gmail.com', '1234'),
('27372480L', 'Rafael', 'Abreu','1987-05-24','854135087312W', 891279992, 'rafael@gmail.com', '1234'),
('09446393V', 'Rafaela', 'Acosta','1999-11-01','632611881645Z', 671668665, 'rafaela@gmail.com', '1234'),
('55572935J', 'Raimundo', 'Álvarez','1974-03-18','849374429436B', 642545476, 'raimundo@gmail.com', '1234'),
('00967871P', 'Ramiro', 'Alves','1995-09-03','839195674900M', 745950019, 'ramiro@gmail.com', '1234'),
('77835974H', 'Ramón', 'Antúnez','1981-03-15','889790753110B', 643491640, 'ramon@gmail.com', '1234'),
('24145949C', 'Salomé', 'Bermúdez','1963-11-12','770343493564L', 856493028, 'salome@gmail.com', '1234'),
('06769102H', 'Raúl', 'Bulchandani Bulchandani','1994-06-17','694306178103P', 626028149, 'raul@gmail.com', '1234'),
('79889691L', 'Sergio', 'Pulido Santana','1991-02-22','743807251566U', 830329593, 'sergio@gmail.com', '1234'),
('38011485Y', 'Daniel Alejandro', 'Álamo Hernández','1992-01-08','722028084436O', 898155764, 'daniel@gmail.com', '1234'),
('16015425L', 'Álvaro', 'Suárez Marrero','1993-05-27','751627212787Y', 766423251, 'alvaro@gmail.com', '1234'),
('60099683Q', 'Aythami', 'López Déniz','1990-07-21','897383073355O', 799646589, 'aythami@gmail.com', '1234'),
('11062755P', 'Samuel', 'Blanco','1973-02-25','725459508804E', 858483791, 'samuel@gmail.com', '1234');

INSERT INTO "MEDICO" VALUES
('789456123', 'Olga', 'Quintana', '71699942H', 845512038, 'olga@gmail.com', '1234', 'Guía', 'Traumatólogo', 30),
('856016410', 'Úrsula', 'Espinosa', '22067439C', 699525106, 'ursula@gmail.com', '1234', 'Agaete', 'Ginecología', 30),
('822384592', 'Unai', 'Belmonte', '06621263T', 898905004, 'unai@gmail.com', '1234', 'Firgas', 'Pediatría', 30),
('812902893', 'Ulises', 'Salcedo', '06054002B', 899337914, 'ulises@gmail.com', '1234', 'Chipiona', 'Neumología', 30),
('631063011', 'Tatiana', 'Sanchez', '16874623Y', 781017496, 'tatiana@gmail.com', '1234', 'Lanjarón', 'Oftalmología', 30),
('876757541', 'Teodoro', 'Soler', '59011930W', 742702187, 'teodoro@gmail.com', '1234', 'Valencia', 'Urología', 30),
('661241086', 'Tomás', 'Suárez', '77361441K', 698204749, 'tomas@gmail.com', '1234', 'Puebla de San Miguel', 'Dermatólogo', 30),
('665745989', 'Rafa', 'Acosta', '65224706H', 765144694, 'rafa@gmail.com', '1234', 'Benidorm', 'Otorrinolaringología', 30);

INSERT INTO "HISTORIAL" VALUES 
(2, '2017-04-03', '14725836R', 'Tos'),
(3, '2017-04-03', '80940193L', 'Conjestión Nasal'),
(4, '2017-04-03', '58165170X', 'Alérgica'),
(5, '2017-04-03', '09446393V', 'Dermatitis'),
(6, '2017-04-03', '00967871P', 'Urticaria'),
(7, '2017-04-03', '24145949C', 'Mantequilla'),
(8, '2017-04-03', '79889691L', 'Medicamentos'),
(9, '2017-04-03', '77835974H', 'Picadura de abeja'),
(10, '2017-04-03', '11062755P', 'Náuseas y vómitos'),
(11, '2017-04-03', '12345678A', 'no conocidas'),
(12, '2017-04-03', '42986175P', 'no conocidas'),
(13, '2017-04-03', '32368475T', 'no conocidas'),
(14, '2017-04-03', '27372480L', 'no conocidas'),
(15, '2017-04-03', '55572935J', 'no conocidas'),
(16, '2017-04-03', '06769102H', 'no conocidas'),
(17, '2017-04-03', '38011485Y', 'no conocidas'),
(18, '2017-04-03', '16015425L', 'no conocidas'),
(19, '2017-04-03', '60099683Q', 'no conocidas');

INSERT INTO "HISTORIA" VALUES 
(2, '2017-04-25', '812902893', 'Asma', 2),
(3, '2017-04-25', '665745989', 'Rinitis', 3),
(4, '2017-04-25', '631063011', 'Conjuntivitis', 4),
(5, '2017-04-25', '661241086', 'Dermatitis', 5),
(6, '2017-04-25', '661241086', 'Alergia a las picaduras de insectos', 9),
(7, '2017-04-25', '333000000', 'Alergia a los alimentos', 7),
(8, '2017-04-25', '555000000', 'Alergia a los medicamentos', 8),
(9, '2017-04-25', '555000000', 'Anafilaxia', 10);

INSERT INTO "HORARIO" VALUES 
(5, '789456123', 'LUNES', '08:30', '14:30'),
(6, '789456123', 'MIÉRCOLES', '08:30', '14:30'),
(7, '789456123', 'JUEVES', '08:30', '14:30'),
(8, '856016410', 'MARTES', '10:30', '14:30'),
(9, '856016410', 'MARTES', '16:00', '18:00'),
(10, '856016410', 'JUEVES', '10:30', '14:30'),
(11, '856016410', 'JUEVES', '16:00', '18:00'),
(12, '822384592', 'LUNES', '08:30', '14:30'),
(13, '822384592', 'MARTES', '08:30', '14:30'),
(14, '822384592', 'MIÉRCOLES', '08:30', '14:30'),
(15, '822384592', 'JUEVES', '08:30', '14:30'),
(16, '822384592', 'VIERNES', '08:30', '14:30'),
(17, '812902893', 'LUNES', '09:00', '14:00'),
(18, '812902893', 'MIÉRCOLES', '09:00', '14:00'),
(19, '631063011', 'LUNES', '09:00', '14:00'),
(20, '631063011', 'VIERNES', '09:00', '14:00'),
(21, '876757541', 'MARTES', '10:00', '13:00'),
(22, '876757541', 'MARTES', '15:00', '18:00'),
(23, '876757541', 'JUEVES', '10:00', '13:00'),
(24, '876757541', 'JUEVES', '15:00', '18:00'),
(25, '661241086', 'LUNES', '09:00', '14:00'),
(26, '661241086', 'LUNES', '15:00', '18:00'),
(27, '665745989', 'MIÉRCOLES', '08:30', '13:30'),
(28, '665745989', 'VIERNES', '08:30', '13:30');

INSERT INTO "CITA" VALUES 
(2, '2017-05-03', '80940193L', '665745989', '11:00'),
(3, '2017-05-08', '58165170X', '631063011', '09:05'),
(4, '2017-05-08', '09446393V', '661241086', '16:05'),
(5, '2017-05-08', '77835974H', '661241086', '10:15'),
(6, '2017-05-08', '12345678A', '555000000', '10:15'),
(7, '2017-05-08', '42986175P', '555000000', '10:25'),
(8, '2017-05-08', '32368475T', '555000000', '10:35'),
(9, '2017-05-08', '27372480L', '555000000', '11:05'),
(10, '2017-05-08', '55572935J', '555000000', '11:35'),
(11, '2017-05-09', '06769102H', '555000000', '14:00'),
(12, '2017-05-09', '38011485Y', '555000000', '14:10'),
(13, '2017-05-09', '16015425L', '555000000', '14:20'),
(14, '2017-05-09', '60099683Q', '555000000', '14:30'),
(15, '2017-05-09', '00967871P', '555000000', '14:40'),
(16, '2017-05-08', '80940193L', '555000000', '14:50'),
(17, '2017-05-08', '58165170X', '555000000', '15:00'),
(18, '2017-05-08', '77835974H', '555000000', '15:10'),
(19, '2017-05-09', '09446393V', '555000000', '14:50'),
(20, '2017-05-09', '24145949C', '555000000', '15:00'),
(21, '2017-05-09', '79889691L', '555000000', '15:10'),
(22, '2017-05-09', '42367894P', '555000000', '15:20'),
(23, '2017-05-15', '77835974H', '555000000', '14:30'),
(24, '2017-05-15', '06769102H', '555000000', '14:40'),
(25, '2017-05-16', '27372480L', '555000000', '14:30'),
(26, '2017-05-16', '00967871P', '555000000', '14:40'),
(27, '2017-05-15', '38011485Y', '555000000', '14:50'),
(28, '2017-05-16', '00967871P', '555000000', '14:50'),
(29, '2017-05-16', '24145949C', '555000000', '14:50'),
(30, '2017-05-16', '79889691L', '555000000', '15:00'),
(31, '2017-05-16', '60099683Q', '555000000', '15:10'),
(32, '2017-05-15', '16015425L', '555000000', '15:00'),
(33, '2017-05-09', '11062755P', '555000000', '15:30'),
(34, '2017-05-16', '11062755P', '555000000', '15:20'),
(35, '2017-05-22', '45652178Q', '555000000', '09:00'),
(36, '2017-05-22', '11062755P', '555000000', '09:10'),
(37, '2017-05-22', '60099683Q', '555000000', '09:20'),
(38, '2017-05-22', '16015425L', '555000000', '09:30'),
(39, '2017-05-22', '79889691L', '555000000', '09:40'),
(40, '2017-05-22', '24145949C', '555000000', '09:50');