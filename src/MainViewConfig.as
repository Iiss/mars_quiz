package  
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import mvc.commands.LoadConfigCommand;
	import mvc.models.ContentsModel;
	import mvc.views.Contents;
	import mvc.mediators.ContentsMediator;
	import mvc.events.QuizEvent;
	import mvc.commands.LoadQuizCommand;
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
			//injector.map(TaskEditor).asSingleton();
			
			//MEDIATORS
			mediatorMap.map(Contents).toMediator(ContentsMediator);
			//mediatorMap.map(Main).toMediator(MainMediator);
			//mediatorMap.map(ChapterEditor).toMediator(ChapterEditorMediator);
			
			//Events
			eventCommandMap.map(QuizEvent.QUIZ_START, QuizEvent).toCommand(LoadQuizCommand);
			//Commands
			directCommandMap.map(LoadConfigCommand).execute();
		}
		
	}

}