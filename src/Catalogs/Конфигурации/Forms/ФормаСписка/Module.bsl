

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	КонфигурацииДляЗагрузки = Справочники.Конфигурации.ПолучитьСписокНовыхКонфигураций();

КонецПроцедуры

&НаКлиенте
Процедура КомандаПроверитьКонфигурации(Команда)
	
	ЗагрузитьСписокКонфигураций();

КонецПроцедуры
// @strict-types

&НаСервере
Процедура ЗагрузитьСписокКонфигураций()
	
	КонфигурацииДляЗагрузки = Справочники.Конфигурации.ПолучитьСписокНовыхКонфигураций();
	
КонецПроцедуры

&НаКлиенте
Процедура КонфигурацииДляЗагрузкиВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	ДобавитьКонфигурациюВСправочник(ВыбраннаяСтрока);

КонецПроцедуры

&НаКлиенте
Асинх Процедура ДобавитьКонфигурациюВСправочник(ВыбраннаяСтрока, Конфигурация = Неопределено)
	
	ЭлементСпискаКонфигураций = КонфигурацииДляЗагрузки.НайтиПоИдентификатору(ВыбраннаяСтрока);
	Если Конфигурация = Неопределено Тогда
		ТекстВопроса = НСтр("ru='Добавить конфигурацию в справочник?'");
	Иначе
		ТекстВопроса = НСтр("ru='Перезаполнить описание конфигурации '") + Строка(Конфигурация) + "?";		
	КонецЕсли;
		
	ОбещаниеОтвет = ВопросАсинх(ТекстВопроса, РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Да);
	Результат = Ждать ОбещаниеОтвет;
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		Отказ = Ложь;
		ДобавитьКонфигурациюНаСервере(ЭлементСпискаКонфигураций.Значение, Конфигурация, Отказ);
		
		Если Не Отказ Тогда
			КонфигурацииДляЗагрузки.Удалить(ЭлементСпискаКонфигураций);
			Элементы.Список.Обновить();
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура КонфигурацииДляЗагрузкиЗагрузитьНажатие(Элемент, СтандартнаяОбработка)
	
	ВыбраннаяСтрока = Элементы.КонфигурацииДляЗагрузки.ТекущаяСтрока;
	ДобавитьКонфигурациюВСправочник(ВыбраннаяСтрока);	

КонецПроцедуры


&НаСервере
Процедура ДобавитьКонфигурациюНаСервере(СтруктураРеквизитов, Конфигурация, Отказ)
	
	Справочники.Конфигурации.ДобавитьКонфигурациюПоОписанию(СтруктураРеквизитов, Конфигурация, Отказ);	
	
КонецПроцедуры

&НаКлиенте
Процедура СписокПеретаскивание(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	
	СтандартнаяОбработка = Ложь;
	ДобавитьКонфигурациюВСправочник(ПараметрыПеретаскивания.Значение[0], Строка);	

КонецПроцедуры

&НаКлиенте
Процедура СписокПроверкаПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	
	//ПараметрыПеретаскивания.ДопустимыеДействия = ДопустимыеДействияПеретаскивания.Перемещение;
	СтандартнаяОбработка = Ложь;		

КонецПроцедуры

&НаКлиенте
Процедура КонфигурацииДляЗагрузкиНачалоПеретаскивания(Элемент, ПараметрыПеретаскивания, Выполнение)
	
	Выполнение = Истина;

КонецПроцедуры




#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

// Код процедур и функций



#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти
