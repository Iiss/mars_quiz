package mvc.models 
{
	import flash.events.EventDispatcher;
	import mvc.events.QuizEvent;
	import mx.collections.ArrayList;
	/**
	 * ...
	 * @author liss
	 */
	public class QuizModel extends EventDispatcher
	{
		private var _quizList:ArrayList;
		private var _currentIndex:int;
		
		public function QuizModel() 
		{
			
		}
		
		public function parse(data:XML):void
		{
			_currentIndex = -1;
			_quizList = new ArrayList;
			
			for each (var node:XML in data.task)
			{
				var task:TaskModel = new TaskModel();
				task.question = node.question[0].text();
				task.answers = new ArrayList();
				
				for each(var answer:XML in node.answers.children())
				{
					task.answers.addItem(answer.toString());
				}
				
				_quizList.addItem(task)
			}
			
			if (_quizList.length > 0)
			{
				currentIndex = 0;
			}
		}
		
		public function get currentIndex():int
		{
			return _currentIndex;
		}
		
		public function set currentIndex(value:int):void
		{
			if (_currentIndex != value)
			{
				_currentIndex = value;
				dispatchEvent(new QuizEvent(QuizEvent.CURRENT_INDEX_CHANGED));
			}
		}
		
		public function get quizList():ArrayList 
		{ 
			return _quizList;
		}
	}
}