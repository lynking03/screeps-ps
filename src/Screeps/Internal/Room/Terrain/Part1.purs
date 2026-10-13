module Screeps.Internal.Room.Terrain.Part1
  ( newRoomTerrain
  , get
  , getRawBuffer
  , getRawBufferDestinationArray
  ) where

import Data.Either (Either(..))
import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn4, runEffectFn1, runEffectFn4)
import Foreign (Foreign)
import Screeps.Constants (ReturnCode)
import Screeps.Types (RoomTerrain)

-- NOTE: Uint8Array is not available in this project (no Data.ArrayBuffer.Types); Foreign is used instead

type Uint8Array = Foreign

foreign import newRoomTerrainImpl :: EffectFn1 String RoomTerrain

-- | Creates a new `Terrain` of room by its name. `Terrain` objects can be constructed for any room in the world even if you have no access to it.
newRoomTerrain :: String -> Effect RoomTerrain
newRoomTerrain = runEffectFn1 newRoomTerrainImpl

foreign import getImpl :: Fn3 RoomTerrain Int Int Int

-- | Get terrain type at the specified room position by `(x,y)` coordinates. Returns 0 for plain, 1 for wall (`TERRAIN_MASK_WALL`), 2 for swamp (`TERRAIN_MASK_SWAMP`).
get :: RoomTerrain -> Int -> Int -> Int
get = runFn3 getImpl

foreign import getRawBufferImpl :: EffectFn1 RoomTerrain Uint8Array

-- | Get copy of underlying static terrain buffer as a new `Uint8Array` of size 2500. Rooms are stored row by row.
getRawBuffer :: RoomTerrain -> Effect Uint8Array
getRawBuffer = runEffectFn1 getRawBufferImpl

foreign import getRawBufferDestinationArrayImpl :: EffectFn4 (ReturnCode -> Either ReturnCode Uint8Array) (Uint8Array -> Either ReturnCode Uint8Array) RoomTerrain Uint8Array (Either ReturnCode Uint8Array)

-- | Get copy of underlying static terrain buffer, copied into the given typed array. Returns the filled array, or `ERR_INVALID_ARGS` if the array type is incompatible.
getRawBufferDestinationArray :: RoomTerrain -> Uint8Array -> Effect (Either ReturnCode Uint8Array)
getRawBufferDestinationArray = runEffectFn4 getRawBufferDestinationArrayImpl Left Right
