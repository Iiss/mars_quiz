package mvc.mediators 
{
	import mvc.models.QuizModel;
	import mvc.models.TaskModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.views.Quiz;
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
			view.quiestion_txt.text = "hello";
			super.initialize();
		}
		
		private function updateQuizPage():void
		{
			var task:TaskModel = quizModel.quizList[0] as TaskModel;
			view.quiestion_txt.text = task.question;
			view.answers_list.dataProvider = task.answers;
		}
	
	}

}