package mvc.mediators 
{
	import mvc.models.QuizModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.views.ScoreScreen;
	import mvc.events.ModelEvent;
	/**
	 * ...
	 * @author liss
	 */
	public class ScoreScreenMediator extends Mediator
	{
		[Inject]
		public var quizModel:QuizModel;
		
		[Inject]
		public var view:ScoreScreen;
		
		public function ScoreScreenMediator() 
		{
			
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			eventMap.mapListener(quizModel, ModelEvent.PROPERTY_CHANGED, _onModelChanged);
		}
		
		private function _onModelChanged(e:ModelEvent):void
		{
			switch(e.propertyName)
			{
				case "score":
					view.updateScore(quizModel);
					break;
					
				case "quizList":
					view.updateScore(quizModel);
					break;
			}
		}
	}
}