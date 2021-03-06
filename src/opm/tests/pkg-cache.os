﻿#Использовать "../src"

Перем юТест;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;
	
	ИменаТестов = Новый Массив;
	
	ИменаТестов.Добавить("ТестДолжен_ПроверитьЧтоПакетУстановлен");
	
	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьЧтоПакетУстановлен() Экспорт

	КаталогБиблиотеки = ОбъединитьПути(КаталогПрограммы(), ПолучитьЗначениеСистемнойНастройки("lib.system"));
	
	ФайлыКаталога = НайтиФайлы(КаталогБиблиотеки, ПолучитьМаскуВсеФайлы());
	НайденныйКаталог = Неопределено;
	Для Каждого Каталог Из ФайлыКаталога Цикл
		Если Каталог.ЭтоКаталог() Тогда
			НайденныйКаталог = Каталог;
			Прервать;
		КонецЕсли;
	КонецЦикла;

	юТест.ПроверитьЛожь(НайденныйКаталог = Неопределено, "в библиотеке должен быть хоть один пакет");
	
	КэшПакетов = Новый КэшУстановленныхПакетов();
	юТест.ПроверитьИстину(КэшПакетов.ПакетУстановлен(Каталог.Имя), "Должен быть найден пакет " + Каталог.Имя);
	
КонецПроцедуры
