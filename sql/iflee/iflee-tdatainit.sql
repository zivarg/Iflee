/*
	Очистка таблицы аэропорты.
*/
-- DELETE FROM airports; - не выполняется в DataGrip
DELETE FROM airports WHERE 1=1;

/*
	Сброс airports_id_seq в 1 таблицы аэропорты.
*/
ALTER SEQUENCE airports_id_seq RESTART WITH 1;

/*
	Заполнение таблицы аэропорты.
*/
INSERT INTO airports (
	short_name,
	long_name,
	address )
VALUES(
	'VKO',
	'Внуково',
	'119027, Россия, г. Москва, ул. 1-я Рейсовая, 12'
);

INSERT INTO airports (
	short_name,
	long_name,
	address )
VALUES(
	'DME',
	'Домодедово',
	'142015, Россия, Московская область, Домодедовский р-н, а/п Домодедово'
);

INSERT INTO airports (
	short_name,
	long_name,
	address )
VALUES(
	'BKA',
	'Быково',
	'140150, Московская область, Раменский район, п. Быково, ул. Советская, 19'
); 

INSERT INTO airports (
	short_name,
	long_name,
	address )
VALUES(
	'SVO',
	'Шереметьево',
	'124340, Россия, Московская область, Химки, Международный аэропорт "Шереметьево"'
); 

INSERT INTO airports (
	short_name,
	long_name,
	address )
VALUES(
	'KLF',
	'Грабцево',
	'248000, Россия, г. Калуга'
);

/*
	Очистка таблицы пилоты.
*/
-- DELETE FROM pilots; - не выполняется в DataGrip
DELETE FROM pilots WHERE 1=1;

/*
	Сброс pilots_id_seq в 1 таблицы пилоты.
*/
ALTER SEQUENCE pilots_id_seq RESTART WITH 1;

/*
	Заполнение таблицы пилоты.
*/
INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0573',
	'431501',
	'Райкова',
	'Эмилия',
	'Всеволодовна',
	'352191, г. Усть-Цильма, ул. Софьи Ковалевской, дом 16, квартира 42'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0262',
	'785884',
	'Трофимова',
	'Ефросинья',
	'Всеволодовна',
	'461235, г. Северодвинск, ул. Внуковская 1-я, дом 3, квартира 79'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'6799',
	'354561',
	'Бесчастных',
	'Герман',
	'Александрович',
	'393740, г. Ижевск, ул. Новоконюшенный Переулок, дом 39, квартира 288'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'4815',
	'679361',
	'Саврасова',
	'Любава',
	'Федоровна',
	'446171, г. Нефтеюганск, ул. МКАД 44 км Дорога, дом 54, квартира 282'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'1854',
	'245006',
	'Каца',
	'Александра',
	'Германовна',
	'306023, г. Бердюжье, ул. Бескудниковский Проезд, дом 31, квартира 22'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'2220',
	'834569',
	'Сязи',
	'Эвелина',
	'Казимировна',
	'655796, г. Орехово-Зуево, ул. Проектируемый 5556-й Проезд, дом 67, квартира 167'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'3661',
	'688853',
	'Ласкутин',
	'Борислав',
	'Гордеевич',
	'462640, г. Клин, ул. Митинский 2-й Переулок, дом 52, квартира 242'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'2189',
	'046985',
	'Завразин',
	'Степан',
	'Карлович',
	'393352, г. Прокопьевск, ул. Прянишникова, дом 46, квартира 136'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'6567',
	'745331',
	'Бурков',
	'Филимон',
	'Платонович',
	'347037, г. Короча, ул. Минская, дом 2, квартира 219'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'8805',
	'899665',
	'Якушев',
	'Феофан',
	'Юриевич',
	'663168, г. Февральское, ул. Кисельный Тупик, дом 78, квартира 180'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0832',
	'395289',
	'Александров',
	'Бронислав',
	'Альбертович',
	'356831, г. Котельниково, ул. Бухвостова 1-я, дом 35, квартира 110'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'9431',
	'571889',
	'Стручкова',
	'Надежда',
	'Тимофеевна',
	'612150, г. Ейск, ул. Кабельная 2-я, дом 46, квартира 38'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'8696',
	'051133',
	'Наумов',
	'Фрол',
	'Александрович',
	'653035, г. Сураж, ул. Кудринская Площадь, дом 16, квартира 147'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'1093',
	'055640',
	'Андреева',
	'Юлия',
	'Виталиевна',
	'601964, г. Грибки, ул. Добровольческий Переулок, дом 7, квартира 64'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'3005',
	'925432',
	'Козлов',
	'Виктор',
	'Миронович',
	'692171, г. Первомайское, ул. Весенняя, дом 31, квартира 168'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'3724',
	'600500',
	'Гулевич',
	'Фаина',
	'Платоновна',
	'612284, г. Павловск, ул. Боровая, дом 46, квартира 182'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0622',
	'180740',
	'Виноградов',
	'Влас',
	'Филиппович',
	'172035, г. Аромашево, ул. Старокоптевский Переулок, дом 38, квартира 297'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0211',
	'946603',
	'Тарский',
	'Валерьян',
	'Юрьевич',
	'352114, г. Шарыпово, ул. Вознесенский Проезд, дом 22, квартира 157'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'9342',
	'923436',
	'Осипова',
	'Инесса',
	'Львовна',
	'303240, г. Тихвин, ул. Кубинка, дом 91, квартира 79'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'7465',
	'370895',
	'Арсеньева',
	'Зинаида',
	'Артемовна',
	'453068, г. Шуйское, ул. Новоясеневский Проспект, дом 6, квартира 201'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'7288',
	'239302',
	'Чапко',
	'Юрий',
	'Максимович',
	'420014, г. Котово, ул. Каретный Б. Переулок, дом 61, квартира 196'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'2032',
	'169950',
	'Журавель',
	'Егор',
	'Тимурович',
	'160901, г. Ольга, ул. Кузнецкий Мост, дом 45, квартира 174'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'8314',
	'513114',
	'Трифонов',
	'Леонид',
	'Кириллович',
	'403771, г. Ковылкино, ул. Марьиной Рощи 7-й Проезд, дом 57, квартира 264'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0467',
	'654345',
	'Журавлёва',
	'Зинаида',
	'Кирилловна',
	'346940, г. Усть-Пристань, ул. Адмирала Руднева, дом 48, квартира 32'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'2482',
	'579269',
	'Воронина',
	'Татьяна',
	'Сергеевна',
	'426019, г. Баргузин, ул. Николаевка Населенный пункт, дом 65, квартира 292'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'5477',
	'886479',
	'Козырев',
	'Ираклий',
	'Ильич',
	'145116, г. Юрьев- Польский, ул. Мартыновский Переулок, дом 7, квартира 263'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'8697',
	'695698',
	'Сорокина',
	'Варвара',
	'Романовна',
	'413860, г. Черемшаны, ул. Международная, дом 10, квартира 208'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'8217',
	'578046',
	'Васютина',
	'Эмма',
	'Петровна',
	'393147, г. Победино, ул. Ордынский Б. Переулок, дом 26, квартира 206'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'7930',
	'372838',
	'Сморчков',
	'Мстислав',
	'Тимурович',
	'632922, г. Новоалтайск, ул. Бегичева, дом 48, квартира 287'
);

INSERT INTO pilots (
	pasport_series,
	pasport_number,
	surname,
	name,
	patronymic,
	address )
VALUES(
	'0867',
	'384070',
	'Пешнин',
	'Виталий',
	'Сергеевич',
	'663244, г. Уяр, ул. Переяславская Ср., дом 87, квартира 245'
);

/*
	Очистка таблицы самолеты.
*/
-- DELETE FROM aircrafts; - не выполняется в DataGrip
DELETE FROM aircrafts WHERE 1=1;

/*
	Сброс aircrafts_id_seq в 1 таблицы самолеты.
*/
ALTER SEQUENCE aircrafts_id_seq RESTART WITH 1;

/*
	Заполнение таблицы самолеты.
*/
INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Боинг 747',
	'7YV4JYY',
	'Боинг',
	'Боинг 747-400'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Боинг 737',
	'2405X4H',
	'Боинг',
	'Боинг 737-800'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Боинг 757',
	'BC1PL06',
	'Боинг',
	'Боинг 757-200'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Боинг 767',
	'PWTCBY1',
	'Боинг',
	'Боинг 767-300'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Боинг 777',
	'FO309BL',
	'Боинг',
	'Боинг 777-300'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Аэробус 310',
	'KA8JRV7',
	'Аэробус',
	'Аэробус 310-300'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'ДС-10',
	'5YM0GHI',
	'ДС',
	'ДС-10-40'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ил-76',
	'A938MFX',
	'Ил',
	'Ил-76МД-90А'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ил-86',
	'RKUXADW',
	'Ил',
	'Ил-86В'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ил-96',
	'9JU91KB',
	'Ил',
	'Ил-96-400М'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ту-134',
	'M3EZFZS',
	'Ту',
	'Ту-134Ш'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ту-154',
	'NG1OCAT',
	'Ту',
	'Ту-154Б'
);

INSERT INTO aircrafts (
	type,
	board_number,
	mark,
	model )
VALUES(
	'Ту-204',
	'577GH5T',
	'Ту',
	'Ту-204-100'
);

/*
	Очистка таблицы аэропорты-пилоты.
*/
-- DELETE FROM airports_pilots; - не выполняется в DataGrip
DELETE FROM airports_pilots WHERE 1=1;

/*
	Заполнение таблицы аэропорты-пилоты.
*/
INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	1,
	1
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	1,
	2
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	1,
	3
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	2,
	4
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	2,
	5
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	2,
	6
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	2,
	7
);

INSERT INTO airports_pilots (
	airport_id,
	pilot_id )
VALUES(
	2,
	8
);

/*
	Очистка таблицы аэропорты-самолеты.
*/
-- DELETE FROM airports_aircrafts; - не выполняется в DataGrip
DELETE FROM airports_aircrafts WHERE 1=1;

/*
	Заполнение таблицы аэропорты-самолеты.
*/
INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	1,
	1
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	1,
	2
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	1,
	3
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	1,
	4
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	1,
	5
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	2,
	6
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	2,
	7
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	3,
	8
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	3,
	9
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	3,
	10
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	3,
	11
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	4,
	12
);

INSERT INTO airports_aircrafts (
	airport_id,
	aircraft_id )
VALUES(
	4,
	13
);

/*
	Очистка таблицы пилоты-самолеты.
*/
-- DELETE FROM pilots_aircrafts; - не выполняется в DataGrip
DELETE FROM pilots_aircrafts WHERE 1=1;

/*
	Заполнение таблицы пилоты-самолеты.
*/
INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	1,
	1
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	1,
	5
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	1,
	13
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	2,
	4
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	2,
	10
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	2,
	7
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	3,
	3
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	3,
	6
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	3,
	10
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	3,
	11
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	3,
	2
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	4,
	9
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	4,
	12
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	4,
	5
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	5,
	8
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	5,
	6
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	5,
	1
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	5,
	10
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	6,
	11
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	6,
	9
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	6,
	3
);

INSERT INTO pilots_aircrafts (
	pilot_id,
	aircraft_id )
VALUES(
	6,
	7
);