package Managers 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	
	public class MapRoom 
	{

		private const CHANCE_OF_CORRIDOR:Number = 0.2;

		private var _isCorridor:Boolean;
		private var _positionX:int;
		private var _positionY:int;
		private var _connectedRooms:Array;

		public function get positionX():int
		{
			return _positionX;
		}

		public function get positionY():int
		{
			return _positionY;
		}

		public function get connectedRooms():Array
		{
			return _connectedRooms;
		}

		public function get isCorridor():Boolean
		{
			return _isCorridor && _connectedRooms.length > 1;
		}

		public function get connected():Boolean
		{
			return _connectedRooms.length > 0;
		}

		public function get lightCount():int
		{
			return _lights.length;
		}

		public function MapRoom(positionX:int, positionY:int, roomWidth:int, roomHeight:int)
		{
			_positionX = positionX;
			_positionY = positionY;
			_isCorridor = FlxG.random() <= CHANCE_OF_CORRIDOR;
			_connectedRooms = new Array();
			_overlay = null;
		}

		public function connectTo(room:MapRoom):void
		{
			_connectedRooms.push(room);
			room._connectedRooms.push(this);
		}

		public function getNeighborWhere(rooms:Array, columns:int, rows:int, predicate:Function):MapRoom
		{
			var neighbors:Array = new Array();

			for (var x:int = positionX - 1; x <= positionX + 1; ++x)
			{
				if (x < 0 || x >= columns)
					continue;

				for (var y:int = positionY - 1; y <= positionY + 1; ++y)
				{
					if (y < 0 || y >= rows)
						continue;
					if (positionX == x && positionY == y)
						continue;
					if (x - positionX != 0 && y - positionY != 0)
						continue;

					var room:MapRoom = rooms[x][y];
					if (predicate(room))
						neighbors.push(room);
				}
			}

			if (neighbors.length > 0)
				return ArrayHelpers.sample(neighbors) as MapRoom;
			return null;
		}



	}

}
