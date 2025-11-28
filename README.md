
Sistema de Gestión de Clases - Proyecto Asistencia

Administra estudiantes, docentes y registros de asistencia de manera rápida y sencilla. Este proyecto es una aplicación web desarrollada con Spring Boot, utilizando una arquitectura MVC y persistencia de datos en MySQL.
Tecnologías Utilizadas
Spring Boot (Versión $3.5.8$)Framework principal.PersistenciaSpring Data JPAMapeo Objeto-Relacional.Base de DatosMySQLBase de datos relacional.FrontendThymeleafMotor de plantillas.SeguridadSpring SecurityAutenticación y autorización.LenguajeJava 17Versión del lenguaje.

PrerrequisitosJava Development Kit (JDK) 17Apache MavenServidor de base de datos MySQL

Configuración e Instalación1. Clonar el RepositorioBashgit clone 
cd ProyectoCorte2
2. Configuración de la Base de DatosCrea la Base de Datos:SQLCREATE DATABASE db_asistencia_clases; -- Nombre basado en el dump
Configura application.properties (en src/main/resources):Propertiesspring.datasource.url=jdbc:mysql://localhost:3306/db_asistencia_clases?serverTimezone=UTC
spring.datasource.username= root
spring.datasource.password= 1651
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
Para cargar la estructura y datos iniciales, puedes ejecutar el archivo Dump20251127.sql después de crear la base de datos.

Ejecución de la AplicaciónBashmvn clean install
mvn spring-boot:run
La aplicación estará disponible en: http://localhost:8090


Estructura de la Base de Datos y Relaciones

El esquema de la base de datos es robusto y gestiona las relaciones muchos a muchos (N:M) y uno a muchos (1:N) de manera efectiva.Tablas Principales (Entidades JPA)TablaClave Primaria (PK)Descripcióntb_docenteid_docenteInformación del docente.tb_estudiantecodigoInformación del estudiante.cursosid_cursoDefinición de los cursos o asignaturas.tb_registro_asistenciaid_registroRegistro de asistencia por estudiante, docente y curso.usersid_userCredenciales y referencia a roles.rolesid_rolRoles de usuario (superadmin, docente, estudiante).Tablas de Relación (Muchos a Muchos N:M)El proyecto utiliza tablas intermedias para gestionar relaciones complejas:curso_estudiante: Relación N:M entre cursos y tb_estudiante.Claves Foráneas (FK): id_curso (hacia cursos) y codigo_estudiante (hacia tb_estudiante).Propósito: Matrícula de un estudiante en un curso.docente_curso: Relación N:M entre tb_docente y cursos.Claves Foráneas (FK): id_docente (hacia tb_docente) y id_curso (hacia cursos).Propósito: Asignación de un docente a uno o varios cursos.

Autenticación y AutorizaciónLa tabla users es el centro de la seguridad y establece las siguientes relaciones:1:N con roles: Un usuario tiene un único rol (id_rol).1:1 con tb_docente o tb_estudiante: Un usuario está vinculado a un único registro de docente (referencia_docente) o estudiante (referencia_estudiante).


Funcionalidades PrincipalesEl sistema permite la administración de:Gestión de Docentes y Estudiantes: Alta, baja y modificación de la información.Gestión de Cursos: Creación y asignación de cursos a docentes.Gestión de Matrículas: Registro de estudiantes en cursos (curso_estudiante).Registro de Asistencia: Guardado de la asistencia diaria (tb_registro_asistencia), vinculando al estudiante, docente y curso.

Autores

Jaime Alberto Almeida Moreno - jaimealmeida@uts.edu.co
Justino Cuadros Useda - jcuadrosu@uts.edu.co
Fausto Alexander García Mendivelso - falexandergarcia@uts.edu.co
