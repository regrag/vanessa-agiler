﻿
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ОбновитьПодсказку();
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьПодсказку()
	ШаблонHTML =
	"<html>
	|<head>
	|  <style>
	|   p {
	|    font-family: 'Courier New'; 
	|    font-size: 12pt;
	|   }
	|  </style>
	| </head>	
	|<body>
	|<p>#Текст</p>
	|</body>
	|</html>";
	
	Текст = "Чтобы добиться цели #Цель, #Персона будет #ВыполнятьКлючевоеДействие и для этого он(она) хочет #НеобходимаяФункциональность";
	
	Если ЗначениеЗаполнено(Объект.Владелец) Тогда
		Текст = СтрЗаменить(Текст, "#Цель", "<strong>" + Объект.Владелец + "</strong>");		
	Иначе
		Текст = СтрЗаменить(Текст, "#Цель", "<strong>?</strong>");		
	КонецЕсли;
	Если ЗначениеЗаполнено(Объект.Персона) Тогда
		Текст = СтрЗаменить(Текст, "#Персона", "<strong>" + Объект.Персона + "</strong>");		
	Иначе
		Текст = СтрЗаменить(Текст, "#Персона", "<strong>Персона</strong>");		
	КонецЕсли;
	Если ЗначениеЗаполнено(Объект.КлючевоеДействие) Тогда
		Текст = СтрЗаменить(Текст, "#ВыполнятьКлючевоеДействие", "<strong>" + Объект.КлючевоеДействие + "</strong>");		
	Иначе
		Текст = СтрЗаменить(Текст, "#ВыполнятьКлючевоеДействие", "<strong>выполнять ключевое действие</strong>");		
	КонецЕсли;
	Если ЗначениеЗаполнено(Объект.НеобходимыйФункционал) Тогда
		Текст = СтрЗаменить(Текст, "#НеобходимыйФункционал", "<strong>" + Объект.НеобходимыйФункционал + "</strong>");		
	Иначе
		Текст = СтрЗаменить(Текст, "#НеобходимаяФункциональность", "<strong>необходимая функциональность</strong>");		
	КонецЕсли;
	
	Текст = СтрЗаменить(ШаблонHTML, "#Текст", Текст);
	
	Подсказка = Текст;
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьЗаголовокФункционала(Автоматически = Ложь)
	Если Автоматически Тогда
		Объект.Заголовок = Объект.НеобходимыйФункционал;
		
	Иначе
		ПоказатьВопрос(Новый ОписаниеОповещения("ПодвердитьАвтоопределениеЗаголовкаЗавершение", ЭтотОбъект), "Взять в качестве заголовка определение необходимой функциональности?", РежимДиалогаВопрос.ДаНет);	
		
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПодвердитьАвтоопределениеЗаголовкаЗавершение(Ответ, ДополнительныеПараметры) Экспорт
	Если Ответ = КодВозвратаДиалога.Да Тогда
		Объект.Заголовок = Объект.НеобходимыйФункционал;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПерсонаПриИзменении(Элемент)
	ОбновитьПодсказку();
КонецПроцедуры

&НаКлиенте
Процедура КлючевоеДействиеПриИзменении(Элемент)
	ОбновитьПодсказку();
КонецПроцедуры

&НаКлиенте
Процедура НеобходимыйФункционалПриИзменении(Элемент)
	ОбновитьПодсказку();
	ОбновитьЗаголовокФункционала(Истина);	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	ОбщегоНазначениеКлиент.УбратьСКонцовПробелы(Объект.Заголовок);
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьНаименованиеИзНеобходимогоФункционала(Команда)
	ОбновитьЗаголовокФункционала();	
КонецПроцедуры

&НаКлиенте
Процедура ПутьКФичеОткрытие(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	
	НачатьЗапускПриложения(Новый ОписаниеОповещения("ОткрытьФичуЗавершение", ЭтотОбъект), Объект.ПутьКФиче);
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьФичуЗавершение(КодВозврата, ДополнительныеПараметры) Экспорт
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "Feature открыта во внешней программе.";
	Сообщение.Сообщить();	
КонецПроцедуры
