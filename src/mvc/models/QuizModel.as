package mvc.models 
{
	import mx.collections.ArrayList;
	/**
	 * ...
	 * @author liss
	 */
	public class QuizModel 
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
		}
		
		public function get currentIndex():int
		{
			return _currentIndex;
		}
	}
}