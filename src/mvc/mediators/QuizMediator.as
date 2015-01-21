package mvc.mediators 
{
	import mvc.models.QuizModel;
	import mvc.models.TaskModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.views.Quiz;
	import flash.events.MouseEvent;
	import mvc.events.QuizEvent;
	/**
	 * ...
	 * @author liss
	 */
	public class QuizMediator extends Mediator 
	{
		[Inject]
		public var quizModel:QuizModel;
		
		[Inject]
		public var view:Quiz
		
		public function QuizMediator() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			//MODEL
			eventMap.mapListener(quizModel, QuizEvent.CURRENT_INDEX_CHANGED, updateQuizPage);
			//VIEW
			eventMap.mapListener(view.answers_list, MouseEvent.MOUSE_DOWN, _onAnswerClick);
			
			updateQuizPage();
		}
		
		private function updateQuizPage(e:*=null):void
		{
			var task:TaskModel = quizModel.quizList.getItemAt(quizModel.currentIndex) as TaskModel;
			
			if (task)
			{
				view.quiestion_txt.text = task.question;
				view.answers_list.dataProvider = task.answers;
			}
		}
		
		private function _onAnswerClick(e:MouseEvent):void
		{
			var quizEvent:QuizEvent = new QuizEvent(QuizEvent.ANSWER_SELECTED);
				dispatch(quizEvent);
		}
	
	}

}