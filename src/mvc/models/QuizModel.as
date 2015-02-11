package mvc.models 
{
	import mx.collections.ArrayList;
	import utils.XMLUtils;
	/**
	 * ...
	 * @author liss
	 */
	public class QuizModel extends AbstractNotifier
	{
		public static const MAX_TASK_COUNT:int = 12;
		private var _quizList:ArrayList;
		private var _currentIndex:int;
		private var _score:int;
		
		public function QuizModel() 
		{
			
		}
		
		public function parse(data:XML):void
		{
			score = 0;
			currentIndex = -1;
			_quizList = new ArrayList;
			
			data.task = XMLUtils.shuffle(data.task,MAX_TASK_COUNT);
			
			for each (var node:XML in data.task)
			{
				var task:TaskModel = new TaskModel();
				task.question = node.question[0].text();
				task.answers = new ArrayList();
				task.key = parseInt(node.@key.toString());
				
				if (node.img.length() > 0)
				{
					task.img = node.img[0].text();
				}
				
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
			
			notifyPropertyChanged("quizList");
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
				notifyPropertyChanged("currentIndex");
			}
		}
		
		public function get currentTask():TaskModel
		{
			if (quizList && currentIndex != -1 && currentIndex < quizList.length)
			{
				return quizList.getItemAt(currentIndex) as TaskModel;
			}
			
			return null;
		}
		
		public function get quizList():ArrayList 
		{ 
			return _quizList;
		}
		
		public function get score():int
		{
			return _score;
		}
		
		public function set score(value:int):void
		{
			if (_score != value)
			{
				_score = value;
				notifyPropertyChanged("score");
			}
		}
	}
}