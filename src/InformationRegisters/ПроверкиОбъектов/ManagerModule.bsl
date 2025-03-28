// @strict-types


#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий

// Код процедур и функций

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс


// Записать результат проверки.
// 
// Параметры:
//  ОбъектКластера - СправочникСсылка.ИнформационныеБазы,
//			 - СправочникСсылка.Кластеры1С,
//  		 - 	СправочникСсылка.СерверыБД,
//  		 - 	СправочникСсылка.ПользователиИБ,
//  		 - 	СправочникСсылка.ВебСерверы,
//  		 - 	СправочникСсылка.ХранилищаКонфигураций - Объект информацио о проверке которого записывается
//  		 
//  Правило - СправочникСсылка.ПравилаПроверкиОбъектов - Правило
//  ПроеверкаПройдена - Булево - В случае если Истина, запись об результате проверки удаляется.
Процедура ЗаписатьРезультатПроверки(ОбъектКластера, Правило, ПроеверкаПройдена = Ложь) Экспорт
	
	ТипОбъектаКластера = ТипЗнч(ОбъектКластера);
	ТипОбъектовПроверки = Метаданные.РегистрыСведений.ПроверкиОбъектов.Измерения.Объект.Тип;
	Если ТипОбъектовПроверки.СодержитТип(ТипОбъектаКластера)
		И ЗначениеЗаполнено(ОбъектКластера) Тогда
			
			ЗаписьРегистра = СоздатьМенеджерЗаписи();
			ЗаписьРегистра.Объект     = ОбъектКластера;
			ЗаписьРегистра.Правило    = Правило;
			
			Если ПроеверкаПройдена Тогда
				ЗаписьРегистра.Удалить();
			Иначе
				ЗаписьРегистра.Записать(Истина);
			КонецЕсли;
	КонецЕсли;
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти

#КонецЕсли
