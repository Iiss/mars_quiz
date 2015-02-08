package mvc.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author liss
	 */
	public class QuizEvent extends Event 
	{
		public static const QUIZ_START:String = "QuizEvent.QUIZ_START";
		public static const ANSWER_SELECTED:String = "QuizEvent.ANSWER_SELECTED";
		public static const SHOW_NEXT_TASK:String = "QuizEvent.SHOW_NEXT_TASK";
		public static const QUIZ_FINISHED:String = "QuizEvent.QUIZ_FINISHED";
		
		public var quizId:String;
		public var key:int=-1;

		public function QuizEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);		
		} 
		
		public override function clone():Event 
		{ 
			return new QuizEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("QuizEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}