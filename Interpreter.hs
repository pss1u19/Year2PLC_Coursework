module Interpreter where
{-# LANGUAGE BlockArguments #-}
import Lexer
import Parser

import System.Environment
import Control.Monad
import Data.List
import System.Directory

--utility list-spliting func

splitList :: Eq a => a -> [a] -> [[a]]
splitList x xs | (dropWhile (/= x) xs) == [] = [(takeWhile (/= x) xs)]
             | otherwise = (takeWhile (/= x) xs) : splitList x (tail (dropWhile (/= x) xs))

--main function 

calc :: Prog -> IO String
calc (ProgLink prog1 prog2) =
							do 	a <- (calc prog1)
								b <- (calc prog2)
								return (a ++ b)
calc (Query vars constraints) = query vars constraints

-- main query function also calls printing 

query :: [String] -> [Constraint] -> IO String
query vars constraints = 
				do	(t:ts) <- getTables constraints
					t2 <- (let t1 = (foldl (tableJoin) t ts) in applyEqs t1 eqs)
					return (printTable vars t2)
              where eqs = filter (isEquality) constraints

--function for getting the Tables from Constraints

getTables :: [Constraint] -> IO [Table]
getTables cs = mapM (calcConstraintTable) ( (filter (isTable) cs))

--function for getting the Tables from the CSV files

calcConstraintTable :: Constraint -> IO Table
calcConstraintTable (ConstraintTable rn vs) = parseCSV rn vs [0..(length vs)-1]

--parsing function for CSV

parseCSV :: String -> [VarItem] -> [Int] -> IO Table
parseCSV tableName vars cs =
						do	r <- (readCSV tableName cs)
							return ( map (parseCSVLine vars) r )

parseCSVLine :: [VarItem] -> [String] -> Record
parseCSVLine vars xs = map varItemToString (filter isNotBlank ys)
              where ys = zip vars xs

isNotBlank :: (VarItem,String) -> Bool
isNotBlank ((VarItemBlank),_) = False
isNotBlank (_,_) = True

varItemToString :: (VarItem,String) -> (String,String)
varItemToString ((VarItemVar v),x) = (v,x)

readCSV :: String -> [Int] -> IO [[String]]
readCSV tableName cs =
						do	result <- readFile filename
							return [ [ record !! n | n <- cs ] | record <- (map (splitList ',') (lines result))]
	where
		filename = tableName ++ ".csv"

--functions for checking what is the type of constraint

isTable :: Constraint -> Bool
isTable (ConstraintTable _ _) = True
isTable _ = False

isEquality :: Constraint -> Bool
isEquality (ConstraintEq _ _) = True
isEquality _ = False


-- functions for Equality constraints

applyEqs :: Table -> [Constraint] -> IO Table
applyEqs table (con:constraints) = 
					do	result <- applyEqs (filter (satisfiesEq con) table) constraints
						return result;
applyEqs table [] = return table

satisfiesEq :: Constraint -> Record -> Bool
satisfiesEq (ConstraintEq var1 var2) ps = getVal ps var1 == getVal ps var2
satisfiesEq _ ps = True

-- function getting the value of a specific variable
getVal :: Record -> String -> String
getVal ps v | fs /= [] = snd (head fs)
            | otherwise = error ("Variable unconstrained: " ++ v)
  where
    matchesV (v',val) = v == v'
    fs = filter (matchesV) ps

-- functions making a string of an entire Table (for printing)

printTable :: [String] -> Table -> String
printTable vs r = (concat (sort (map (printTableLine vs) r)))

printTableLine :: [String] -> Record -> String
printTableLine [var] ass  | (head var) == '[' =  (init (drop 1 var)) ++ "\n"
						  | otherwise = (getVal ass var) ++ "\n"
printTableLine (var:vars) ass 	| (head var) == '[' =  (init (drop 1 var)) ++ " , " ++ printTableLine vars ass
								| otherwise = (getVal ass var) ++ " , " ++ printTableLine vars ass 
								
type Record = [(String, String)]
type Table = [Record]

-- utility functions for joining tables

tableJoin :: Table -> Table -> Table
tableJoin (x:xs) ys = map (merge x) (filter (match x) ys) ++ tableJoin xs ys
tableJoin [] ys = []

merge :: Record -> Record -> Record
merge xs ys = xs ++ (filter (\y -> not (y `elem` xs)) ys)

match :: Record -> Record -> Bool
match ((v1,v2):a1s) a2s = filter (\(vary,valy) -> v1 == vary && v2 /= valy) a2s == [] && match a1s a2s
match [] a2s = True