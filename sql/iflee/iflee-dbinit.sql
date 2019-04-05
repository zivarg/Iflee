/*
	Удаление таблицы аэропорты, если она существует.
*/
DROP TABLE IF EXISTS airports CASCADE;

/*
	Создание таблицы аэропорты.
*/
CREATE TABLE airports(
	id SERIAL PRIMARY KEY,
	short_name VARCHAR(50) NOT NULL,
	long_name VARCHAR(200) NOT NULL,
	address VARCHAR(255) NOT NULL
);

/*
	Удаление таблицы пилоты, если она существует.
*/
DROP TABLE IF EXISTS pilots CASCADE;

/*
	Создание таблицы пилоты.
*/
CREATE TABLE pilots(
	id SERIAL PRIMARY KEY,
	pasport_series VARCHAR(4) NOT NULL,
	pasport_number VARCHAR(6) NOT NULL,
	surname VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	patronymic VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL
);

/*
	Удаление таблицы самолеты, если она существует.
*/
DROP TABLE IF EXISTS aircrafts CASCADE;

/*
	Создание таблицы самолеты.
*/
CREATE TABLE aircrafts(
	id SERIAL PRIMARY KEY,
	type VARCHAR(255) NOT NULL,
	board_number VARCHAR(20) UNIQUE NOT NULL,
	mark VARCHAR(10) NOT NULL,
	model VARCHAR(255) NOT NULL
);

/*
	Удаление таблицы аэропорты-пилоты, если она существует.
*/
DROP TABLE IF EXISTS airports_pilots CASCADE;

/*
	Создание таблицы аэропорты-пилоты.
*/
CREATE TABLE airports_pilots(
	airport_id INTEGER REFERENCES airports (id) ON DELETE CASCADE,
	pilot_id INTEGER REFERENCES pilots (id) ON DELETE CASCADE
);

/*
	Удаление таблицы аэропорты-самолеты, если она существует.
*/
DROP TABLE IF EXISTS airports_aircrafts CASCADE;

/*
	Создание таблицы аэропорты-самолеты.
*/
CREATE TABLE airports_aircrafts(
	airport_id INTEGER REFERENCES airports (id) ON DELETE CASCADE,
	aircraft_id INTEGER REFERENCES aircrafts (id) ON DELETE CASCADE
);

/*
	Удаление таблицы пилоты-самолеты, если она существует.
*/
DROP TABLE IF EXISTS pilots_aircrafts CASCADE;

/*
	Создание таблицы пилоты-самолеты.
*/
CREATE TABLE pilots_aircrafts(
	pilot_id INTEGER REFERENCES pilots (id) ON DELETE CASCADE,
	aircraft_id INTEGER REFERENCES aircrafts (id) ON DELETE CASCADE
);

/*
	Удаление хранимой функции "список всех аэропортов", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_airports; 

/*
	Создание хранимой функции "список всех аэропортов".
*/
CREATE OR REPLACE FUNCTION get_all_airports()
RETURNS TABLE(
	id INTEGER,
	short_name VARCHAR(255),
	long_name VARCHAR(255),
	address VARCHAR(255) ) AS 
$$
	SELECT * FROM airports;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов аэропорта по краткому
	наименованию аэропорта [airport short name]", если она существует.
*/
DROP FUNCTION IF EXISTS get_airport_pilots_by_airport_short_name; 

/*
	Создание хранимой функции "список пилотов аэропорта по краткому
	наименованию аэропорта [airport short name]".
*/
CREATE OR REPLACE FUNCTION get_airport_pilots_by_airport_short_name(
	in a_airport_short_name VARCHAR(50) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, airports_pilots, airports
	WHERE pilots.id = airports_pilots.pilot_id
	AND airports.id = airports_pilots.airport_id
	AND airports.short_name LIKE a_airport_short_name;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов аэропорта по длинному
	наименованию аэропорта [airport long name]", если она существует.
*/
DROP FUNCTION IF EXISTS get_airport_pilots_by_airport_long_name; 

/*
	Создание хранимой функции "список пилотов аэропорта по длинному
	наименованию аэропорта [airport long name]".
*/
CREATE OR REPLACE FUNCTION get_airport_pilots_by_airport_long_name(
	in a_airport_long_name VARCHAR(50) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, airports_pilots, airports
	WHERE pilots.id = airports_pilots.pilot_id
	AND airports.id = airports_pilots.airport_id
	AND airports.long_name LIKE a_airport_long_name;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов аэропорта по краткому
	наименованию аэропорта [airport short name]", если она существует.
*/
DROP FUNCTION IF EXISTS get_airport_aircrafts_by_airport_short_name; 

/*
	Создание хранимой функции "список самолетов аэропорта по краткому
	наименованию аэропорта [airport short name]".
*/
CREATE OR REPLACE FUNCTION get_airport_aircrafts_by_airport_short_name(
	in a_airport_short_name VARCHAR(50) )
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255) ) AS
$$
	SELECT DISTINCT aircrafts.* FROM aircrafts, airports_aircrafts, airports
	WHERE aircrafts.id = airports_aircrafts.aircraft_id
	AND airports.id = airports_aircrafts.airport_id
	AND airports.short_name LIKE a_airport_short_name;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов аэропорта по длинному
	наименованию аэропорта [airport long name]", если она существует.
*/
DROP FUNCTION IF EXISTS get_airport_aircrafts_by_airport_long_name; 

/*
	Создание хранимой функции "список самолетов аэропорта по длинному
	наименованию аэропорта [airport long name]".
*/
CREATE OR REPLACE FUNCTION get_airport_aircrafts_by_airport_long_name(
	in a_airport_long_name VARCHAR(50) )
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255) ) AS
$$
	SELECT DISTINCT aircrafts.* FROM aircrafts, airports_aircrafts, airports
	WHERE aircrafts.id = airports_aircrafts.aircraft_id
	AND airports.id = airports_aircrafts.airport_id
	AND airports.long_name LIKE a_airport_long_name;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов закрепленных за пилотом по его
	ФИО [pilot surname, pilot name, pilot patronymic]", если она существует.
*/
DROP FUNCTION IF EXISTS get_pilot_aircrafts_by_pilot_snp;

/*
	Создание хранимой функции "список самолетов закрепленных за пилотом по его
	ФИО [pilot surname, pilot name, pilot patronymic]".
*/
CREATE OR REPLACE FUNCTION get_pilot_aircrafts_by_pilot_snp(
	in a_pilot_surname VARCHAR(255),
	in a_pilot_name VARCHAR(255),
	in a_pilot_patronymic VARCHAR(255) )
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255) ) AS
$$
	SELECT DISTINCT aircrafts.* FROM aircrafts, pilots_aircrafts, pilots
	WHERE aircrafts.id = pilots_aircrafts.aircraft_id
	AND pilots.id = pilots_aircrafts.pilot_id
	AND pilots.surname LIKE a_pilot_surname
	AND pilots.name LIKE a_pilot_name
	AND pilots.patronymic LIKE a_pilot_patronymic;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов которые могут летать на самолете
	по его типу [aircraft type]", если она существует.
*/
DROP FUNCTION IF EXISTS get_aircraft_pilots_by_aircraft_type;

/*
	Создание хранимой функции "список пилотов которые могут летать на самолете
	по его типу [aircraft type]".
*/
CREATE OR REPLACE FUNCTION get_aircraft_pilots_by_aircraft_type(
	in a_aircraft_type VARCHAR(255) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, pilots_aircrafts, aircrafts
	WHERE pilots.id = pilots_aircrafts.pilot_id
	AND aircrafts.id = pilots_aircrafts.aircraft_id
	AND aircrafts.type LIKE a_aircraft_type;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов которые могут летать на самолете
	по его борт номеру [aircraft board number]", если она существует.
*/
DROP FUNCTION IF EXISTS get_aircraft_pilots_by_aircraft_board_number;

/*
	Создание хранимой функции "список пилотов которые могут летать на самолете
	по его борт номеру [aircraft board number]".
*/
CREATE OR REPLACE FUNCTION get_aircraft_pilots_by_aircraft_board_number(
	in a_aircraft_board_number VARCHAR(20) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, pilots_aircrafts, aircrafts
	WHERE pilots.id = pilots_aircrafts.pilot_id
	AND aircrafts.id = pilots_aircrafts.aircraft_id
	AND aircrafts.board_number LIKE a_aircraft_board_number;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов которые могут летать на самолете
	по его марке [aircraft mark]", если она существует.
*/
DROP FUNCTION IF EXISTS get_aircraft_pilots_by_aircraft_mark;

/*
	Создание хранимой функции "список пилотов которые могут летать на самолете
	по его марке [aircraft mark]".
*/
CREATE OR REPLACE FUNCTION get_aircraft_pilots_by_aircraft_mark(
	in a_aircraft_mark VARCHAR(10) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, pilots_aircrafts, aircrafts
	WHERE pilots.id = pilots_aircrafts.pilot_id
	AND aircrafts.id = pilots_aircrafts.aircraft_id
	AND aircrafts.mark LIKE a_aircraft_mark;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов которые могут летать на самолете
	по его модели [aircraft model]", если она существует.
*/
DROP FUNCTION IF EXISTS get_aircraft_pilots_by_aircraft_model;

/*
	Создание хранимой функции "список пилотов которые могут летать на самолете
	по его модели [aircraft model]".
*/
CREATE OR REPLACE FUNCTION get_aircraft_pilots_by_aircraft_model(
	in a_aircraft_model VARCHAR(10) )
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT pilots.* FROM pilots, pilots_aircrafts, aircrafts
	WHERE pilots.id = pilots_aircrafts.pilot_id
	AND aircrafts.id = pilots_aircrafts.aircraft_id
	AND aircrafts.model LIKE a_aircraft_model;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список аэропортов с количеством прикрепленных
	пилотов больше [nember]", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_airports_where_number_of_pilots_is_greater;

/*
	Создание хранимой функции "список аэропортов с количеством прикрепленных
	пилотов больше [nember]".
*/
CREATE OR REPLACE FUNCTION get_all_airports_where_number_of_pilots_is_greater(
	in a_minimum_number_of_pilots INTEGER )
RETURNS TABLE(
	id INTEGER,
	short_name VARCHAR(50),
	long_name VARCHAR(200),
	address VARCHAR(255) ) AS
$$
	SELECT DISTINCT airports.* FROM airports, airports_pilots
	WHERE airports.id = airports_pilots.airport_id
	GROUP BY airports.id
	HAVING COUNT(airports_pilots.pilot_id) > a_minimum_number_of_pilots;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список пилотов с количеством прикрепленных
	к ним самолетов", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_pilots_with_number_of_aircrafts;

/*
	Создание хранимой функции "список пилотов с количеством прикрепленных
	к ним самолетов".
*/
CREATE OR REPLACE FUNCTION get_all_pilots_with_number_of_aircrafts()
RETURNS TABLE(
	id INTEGER,
	pasport_series VARCHAR(4),
	pasport_number VARCHAR(6),
	surname VARCHAR(255),
	name VARCHAR(255),
	patronymic VARCHAR(255),
	address VARCHAR(255),
	number_of_aircrafts INTEGER ) AS
$$
	SELECT DISTINCT pilots.*, COUNT(pilots_aircrafts.aircraft_id)
	AS number_of_aircrafts FROM pilots, pilots_aircrafts
	WHERE pilots.id = pilots_aircrafts.pilot_id
	GROUP BY pilots.id;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов с зеленой подсветкой по типу
	[type]", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_aircrafts_with_green_backlight_on_type;

/*
	Создание хранимой функции "список самолетов с зеленой подсветкой по типу
	[type]".
*/
CREATE OR REPLACE FUNCTION get_all_aircrafts_with_green_backlight_on_type(
	in a_type VARCHAR(255)
)
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255),
	is_green_backlight BOOLEAN ) AS
$$
	SELECT DISTINCT *,
	CASE
		WHEN aircrafts.type LIKE a_type
		THEN TRUE
		ELSE FALSE
	END AS is_green_backlight FROM aircrafts ORDER BY aircrafts.id;;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов с зеленой подсветкой по
	борт номеру [board number]", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_aircrafts_with_green_backlight_on_board_number;

/*
	Создание хранимой функции "список самолетов с зеленой подсветкой по
	борт номеру [board number]".
*/
CREATE OR REPLACE FUNCTION get_all_aircrafts_with_green_backlight_on_board_number(
	in a_board_number VARCHAR(20)
)
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255),
	is_green_backlight BOOLEAN ) AS
$$
	SELECT DISTINCT *,
	CASE
		WHEN aircrafts.board_number LIKE a_board_number
		THEN TRUE
		ELSE FALSE
	END AS is_green_backlight FROM aircrafts ORDER BY aircrafts.id;;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов с зеленой подсветкой по
	марке [mark]", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_aircrafts_with_green_backlight_on_mark;

/*
	Создание хранимой функции "список самолетов с зеленой подсветкой по
	марке [mark]".
*/
CREATE OR REPLACE FUNCTION get_all_aircrafts_with_green_backlight_on_mark(
	in a_mark VARCHAR(10)
)
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255),
	is_green_backlight BOOLEAN ) AS
$$
	SELECT DISTINCT *,
	CASE
		WHEN aircrafts.mark LIKE a_mark
		THEN TRUE
		ELSE FALSE
	END AS is_green_backlight FROM aircrafts ORDER BY aircrafts.id;;
$$
LANGUAGE SQL;

/*
	Удаление хранимой функции "список самолетов с зеленой подсветкой по
	модели [model]", если она существует.
*/
DROP FUNCTION IF EXISTS get_all_aircrafts_with_green_backlight_on_model;

/*
	Создание хранимой функции "список самолетов с зеленой подсветкой по
	модели [model]".
*/
CREATE OR REPLACE FUNCTION get_all_aircrafts_with_green_backlight_on_model(
	in a_model VARCHAR(255)
)
RETURNS TABLE(
	id INTEGER,
	type VARCHAR(255),
	board_number VARCHAR(20),
	mark VARCHAR(10),
	model VARCHAR(255),
	is_green_backlight BOOLEAN ) AS
$$
	SELECT DISTINCT *,
	CASE
		WHEN aircrafts.model LIKE a_model
		THEN TRUE
		ELSE FALSE
	END AS is_green_backlight FROM aircrafts ORDER BY aircrafts.id;;
$$
LANGUAGE SQL;

