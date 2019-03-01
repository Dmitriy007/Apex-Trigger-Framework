Apex Trigger Framework

// ============ Trigger Implementation ============= //

1. Create ObjectTrigger (i.e. trigger CaseTrigger on Case)
- Includes ALL trigger events: before insert, before update...
- Inits triggerHandler just with ONE line: TriggerManager.InitHandler(CaseTriggerHandler.class); (polymorphic dependency injection)
2. Create TriggerManager (controlls all ObjectTriggerHandler behaviour) 
3. Create ITriggerHandler (controlls all ObjectTriggerHandler stucture)
4. Create ObjectTriggerHandler 
- Implements ITriggerHandler interface
- implements trigger methods separatly for each trigger event

// ============ Преимущества фреймворка && best practice ============= // 

1. Легко реализовать - несколько классов и один интерфейс. 
2. Легко использовать и понимать без дополнительной документации, комментариев или особого посвящения.
3. ОДИН триггер на объекте, остальная логика в handler (Salesforce best practice)
4. Триггер содержит ОДНУ строку кода для вызова ObjectTriggerHandler. ВСЕ! 
5. Убираем логику с триггера в ОДИН класс обработчик ObjectTriggerHandler (Salesforce best practice)
6. Структура всех triggerHandler контролируется в ОДНОМ месте - ITriggerHandler, что гарантирует последовательность во всех триггерах
7. Поведение всех triggerHandler контролируется в одном месте - TriggerManager
8. В ObjectTriggerHandler каждый метод отвечает за ОДНО событие триггера, например - BeforeInsert(), BeforeUpdate()...
- (здесь ИМХО :) что должно помочь избежать смешанных еретических конструкций типа: 
  if(Trigger.isBefore && (Trigger.IsInsert || Trigger.IsUpdate)) // ОБЩАЯ ЛОГИКА INSERT/UPDATE
- то есть, // ОБЩАЯ ЛОГИКА INSERT/UPDATE - должна быть вынесена в ОТДЕЛЬНЫЙ private method(), который вызывается из BeforeInsert() и BeforeUpdate()
(Salesforce best practice - позволит избежать оргоменных методов с повторяющимся кодом)
9. Поддержка отключения триггера: CaseTriggerHandler.triggerDisabled = true;
10. Поддержка предотвращения рекурсии в триггере, используя статические переменные (что зачастую ааагромная проблема)

// To improve??? Trigger Errors/Exception/Validation handling
