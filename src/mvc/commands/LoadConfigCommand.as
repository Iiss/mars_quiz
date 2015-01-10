package mvc.commands 
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import services.ErrorReportService;
	import flash.net.URLLoaderDataFormat;
	/**
	 * ...
	 * @author liss
	 */
	public class LoadConfigCommand extends AsyncCommand 
	{
		private static const PACK_MAP_PATH:String = "data/packages.xml";
		
		public function LoadConfigCommand() 
		{
			super();
		}
		
		override public function execute():void 
		{
			var loader:URLLoader = new URLLoader();
			addListeners(loader);
			loader.load(new URLRequest(PACK_MAP_PATH));
		}
		
		private function addListeners(l:IEventDispatcher):void
		{
			l.addEventListener(Event.COMPLETE, _onComplete);
			l.addEventListener(IOErrorEvent.IO_ERROR, _onError);
			l.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
		}
		
		private function removeListeners(l:IEventDispatcher):void
		{
			l.removeEventListener(Event.COMPLETE, _onComplete);
			l.removeEventListener(IOErrorEvent.IO_ERROR, _onError);
			l.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
		}
		
		private function _onComplete(e:Event):void
		{
			var l:URLLoader = e.currentTarget as URLLoader;
			removeListeners(l);
			
			if (l != null && l.data!=null)
			{
				try 
				{
					var result:XML = new XML(l.data);
					trace(result);
				}
				catch (e:Error)
				{
					ErrorReportService.reportError(e);
					dispatchComplete(false);
				}
			}
			
			dispatchComplete(false);
		}
		
		private function _onError(e:Event):void
		{
			removeListeners(e.currentTarget as IEventDispatcher);
			ErrorReportService.reportError(e);
			
			dispatchComplete(false);
		}
	}
}