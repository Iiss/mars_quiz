package mvc.mediators 
{
	import mvc.events.ModelEvent;
	import mvc.models.QuizModel;
	import mvc.models.TaskModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.views.Quiz;
	import flash.events.MouseEvent;
	import mvc.events.QuizEvent;
	import com.greensock.TweenNano;
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
			eventMap.mapListener(quizModel, ModelEvent.PROPERTY_CHANGED, onQuizModelChanged);
			
			updateQuizPage();
		}
		
		private function onQuizModelChanged(e:ModelEvent):void
		{
			switch(e.propertyName)
			{
				case "currentIndex":
					updateQuizPage();
					break;
			}
		}
		
		private function updateQuizPage():void
		{
			var task:TaskModel = quizModel.currentTask;
			
			if (task)
			{
				eventMap.mapListener(view.answers_list, MouseEvent.MOUSE_DOWN, _onAnswerClick);
				
				view.quiestion_txt.text = task.question;
				view.answers_list.dataProvider = task.answers;
				view.task_img.source = task.img;
			}
		}
		
		private function _onAnswerClick(e:MouseEvent):void
		{
			eventMap.unmapListener(view.answers_list, MouseEvent.MOUSE_DOWN, _onAnswerClick);
			
			var quizEvent:QuizEvent = new QuizEvent(QuizEvent.ANSWER_SELECTED);
				quizEvent.key = view.answers_list.selectedIndex;
				dispatch(quizEvent);
				
			view.answer_mark.isCorrect = (quizModel.currentTask && (quizModel.currentTask.key == quizEvent.key));
			view.answer_mark.alpha = 1;
			view.answer_mark.visible = true;
			
			TweenNano.to(view.answer_mark, .6, {delay:.5, alpha:0, onComplete:_dispatchNext } );
		}
		
		private function _dispatchNext():void
		{
			view.answer_mark.visible = false;	
			dispatch(new QuizEvent(QuizEvent.SHOW_NEXT_TASK));
		}
	
	}

}