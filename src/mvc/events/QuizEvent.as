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
		
		public var quizId:String;
		
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