package  
{
	import mvc.commands.LoadConfigCommand;
	import mvc.commands.LoadQuizCommand;
	import mvc.events.QuizEvent;
	import mvc.mediators.ContentsMediator;
	import mvc.mediators.QuizMediator;
	import mvc.models.ContentsModel;
	import mvc.models.QuizModel;
	import mvc.views.Contents;
	import mvc.views.Quiz;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import mvc.commands.ShowNextTaskCommand;
	/**
	 * ...
	 * @author liss
	 */
	public class MainViewConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var eventCommandMap:IEventCommandMap;

		[Inject]
		public var directCommandMap:IDirectCommandMap;
		
		[Inject]
		public var contextView:ContextView;
		
		
		public function MainViewConfig() 
		{
			
		}
		
		public function configure():void
		{
			//MODELS
			injector.map(ContentsModel).toValue(new ContentsModel);
			injector.map(QuizModel).asSingleton();
			
			//MEDIATORS
			mediatorMap.map(Contents).toMediator(ContentsMediator);
			mediatorMap.map(Quiz).toMediator(QuizMediator);
			
			//Events
			eventCommandMap.map(QuizEvent.QUIZ_START, QuizEvent).toCommand(LoadQuizCommand);
			eventCommandMap.map(QuizEvent.ANSWER_SELECTED, QuizEvent).toCommand(ShowNextTaskCommand);
			
			//Commands
			directCommandMap.map(LoadConfigCommand).execute();
		}
		
	}

}