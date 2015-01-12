package mvc.commands 
{
	import mvc.events.QuizEvent;
	import mvc.models.QuizModel;
	/**
	 * ...
	 * @author liss
	 */
	public class LoadQuizCommand extends LoadCommandBase 
	{
		public static const QUIZ_URL_BASE:String = "data/quiz/";
		public static const QUIZ_EXTENSION:String = ".xml";
		
		[Inject]
		public var quizEvent:QuizEvent
		
		public function LoadQuizCommand() 
		{
			super();
		}
		
		override public function execute():void 
		{
			var url:String = QUIZ_URL_BASE + quizEvent.quizId + QUIZ_EXTENSION;
			load(url);
		}
		
		override protected function onComplete(result:*):void 
		{
			var data:XML = new XML(result);
			var quizModel:QuizModel = new QuizModel();
			quizModel.parse(data);
		}
		
	}

}