package Entities.Players 
{
import org.flixel.*;
import org.flixel.FlxG;
               
	public class playerEntity extends FlxSprite
	{	
		private var destination:FlxPoint;
		[Embed(source = '../../../assets/player.png')] private var playerPNG:Class;
	
		
		public function playerEntity(x:uint, y:uint)
		{
			super(x, y);
			
			loadGraphic(playerPNG, true, true, 16, 18, true);
			
			addAnimation("walk", [0, 1, 0, 2], 30, false);
			
			maxVelocity.x = 80;
			
			maxVelocity.y = 80;
			
			destination = new FlxPoint(x, y);
			
			velocity = new FlxPoint(0,0);
			
		
		}
                               
		override public function update():void
		{             
			acceleration.x = 0;
		
			var distanceX : Number;
			var distanceY : Number;
			var possibleX : Number;
			var possibleY : Number;
			
			distanceX = x - destination.x;
			distanceY = y - destination.y;
			trace(distanceX);
			
		if (distanceX == 0 && (distanceY == 0))
		{
			
		if (FlxG.keys.justPressed ("RIGHT"))
		{
			play("walk");
			destination.x  = x + 10;
			//acceleration.x = -maxVelocity.x * 4; 
		}
			
		if (FlxG.keys.justPressed ("LEFT"))
		{
			play("walk");
			destination.x =  x - 10;
			//acceleration.x = maxVelocity.x * 4;
		}
		
		if (FlxG.keys.justPressed ("UP"))
		{
			play("walk");
			destination.y = y - 10;
			//acceleration.y = -maxVelocity.y * 4;
		}
			
		if (FlxG.keys.justPressed ("DOWN"))
		{
			play("walk");
			destination.y = y + 10;
			//acceleration.y = maxVelocity.y * 4;
		}
		}
			if (distanceX < 0)
			{
				velocity.x = 100;
			}
			
			if (distanceX > 0)
			{
				velocity.x = -100;
			}
			
			if (distanceY < 0)
			{
				velocity.y = 100;
			}
			
			if (distanceY > 0)
			{
				velocity.y = -100;
			}
			
			var tempX:Number = x + (velocity.x * FlxG.elapsed);
			var tempY:Number = y + (velocity.y * FlxG.elapsed);
			var tempdisX : Number;
			var tempdisY : Number;
			
			tempdisX = tempX - destination.x;
			tempdisY = tempY - destination.y;
			
			if ((tempdisX > 0 && distanceX < 0) || (tempdisX < 0 && distanceX  > 0))
			{
				velocity.x = 0;
				x = destination.x;
			}
			
			if ((tempdisY > 0 && distanceY < 0) || (tempdisY < 0 && distanceY > 0))
			{
				velocity.y = 0;
				y = destination.y;
			}
			
			super.update();

		}
	}

}