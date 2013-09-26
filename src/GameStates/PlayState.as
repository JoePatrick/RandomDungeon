package GameStates 
{
	import Managers.levelManager;
	import org.flixel.*;
	import Entities.Players.*;
	public class PlayState extends FlxState
	{
		
		public function PlayState() 
		{
			Registry.player = new playerEntity(0, 0);
			add(Registry.player); 
			
			/*Registry.level1 = new levelManager;
			add(Registry.level1);*/
		}
		
	}

}