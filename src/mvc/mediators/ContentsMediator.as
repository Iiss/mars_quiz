package mvc.mediators 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mvc.events.QuizEvent;
	import mvc.models.ChapterModel;
	import mvc.models.ContentsModel;
	import mvc.views.Contents;
	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * ...
	 * @author liss
	 */
	public class ContentsMediator extends Mediator 
	{
		[Inject]
		public var view:Contents;
		
		[Inject]
		public var contentsModel:ContentsModel
		
		public function ContentsMediator() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			//MODEL
			eventMap.mapListener(contentsModel, Event.CHANGE, _onContentsChanged);
			
			//VIEW
			eventMap.mapListener(view.contentsList, MouseEvent.MOUSE_DOWN, _onChapterClick);
		}
		
		private function _onChapterClick(e:MouseEvent):void
		{
			if (view.contentsList.selectedItem)
			{
				trace((view.contentsList.selectedItem as ChapterModel).name);
				
				var quizEvent:QuizEvent = new QuizEvent(QuizEvent.QUIZ_START);
				quizEvent.quizId = (view.contentsList.selectedItem as ChapterModel).id;
				
				view.contentsList.selectedItem = null;
				
				dispatch(quizEvent);
			}
		}
		
		private function _onContentsChanged(e:*):void
		{
			view.contentsList.dataProvider = contentsModel.chapters;
		}
	}

}