package  
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import mvc.commands.LoadConfigCommand;
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
			//injector.map(QuizModel).toValue(new QuizModel);
			//injector.map(TaskEditor).asSingleton();
			
			//MEDIATORS
			//mediatorMap.map(Main).toMediator(MainMediator);
			//mediatorMap.map(ChapterEditor).toMediator(ChapterEditorMediator);
			
			//Events
			
			//Commands
			directCommandMap.map(LoadConfigCommand).execute();
		}
		
	}

}