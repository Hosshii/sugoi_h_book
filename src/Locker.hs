module Locker where

import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
  Nothing -> Left $ "Locker" ++ show lockerNumber ++ "doesnot exist"
  Just (state, code) ->
    if state /= Taken
      then Right code
      else Left $ "Locker" ++ show lockerNumber ++ "is already taken!"

lockers :: LockerMap
lockers =
  Map.fromList
    [ (100, (Taken, "11111")),
      (101, (Free, "22222")),
      (102, (Taken, "333333"))
    ]