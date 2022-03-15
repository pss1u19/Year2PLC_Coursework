{ 
module Parser where 
import Lexer
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token
    table 	{ TokenTable _ $$ } 
    var 	{ TokenVar _ $$ } 
	cons 	{ TokenCons _ $$ }
    '=' 	{ TokenEq _ } 
    '(' 	{ TokenLParen _ } 
    ')' 	{ TokenRParen _ } 
    '{' 	{ TokenOpenBrace _ }
    '}' 	{ TokenCloseBrace _ }
    ',' 	{ TokenComma _ }
    ';' 	{ TokenSemiColon _ }
    '_' 	{ TokenUnderscore _ }

%monad { E } { thenE } { returnE }

%% 
Prog : StrictVarList '{' ConstraintList '}'  {Query $1 $3}
| StrictVarList '{' ConstraintList '}' Prog {ProgLink (Query $1 $3) $5}

VarList : VarItem {[$1]}
| VarItem ',' VarList {$1 : $3}

StrictVarList : var {[$1]} 
| cons {[$1]}
| var ',' StrictVarList {$1 : $3}
| cons ',' StrictVarList {$1 : $3}

VarItem : var {VarItemVar $1}
| '_' {VarItemBlank}

ConstraintList : Constraint ';' {[$1]}
| Constraint ';' ConstraintList {$1 : $3}

Constraint : table '(' VarList ')' {ConstraintTable $1 $3}
| var '=' var {ConstraintEq $1 $3}

{ 

data E a = Ok a | Failed String

parseError :: [Token] -> E a
parseError ((TokenOpenBrace p):ts) = failE (prettyPrint "" "{" p)
parseError ((TokenCloseBrace p):ts) = failE (prettyPrint "" "}" p)
parseError ((TokenVar p id):ts) = failE (prettyPrint "variable " id p)
parseError ((TokenTable p id):ts) = failE (prettyPrint "table " id p)
parseError ((TokenCons p id):ts) = failE (prettyPrint "constant " id p)
parseError ((TokenEq p):ts) = failE (prettyPrint "" "=" p)
parseError ((TokenLParen p):ts) = failE (prettyPrint "" "(" p)
parseError ((TokenRParen p):ts) = failE (prettyPrint "" ")" p)
parseError ((TokenSemiColon p):ts) = failE (prettyPrint "" ";" p)
parseError ((TokenUnderscore p):ts) = failE (prettyPrint "" "_" p)
parseError ((TokenComma p):ts) = failE (prettyPrint "" "," p)
parseError t = failE "Parse Error"

prettyPrint :: String -> String -> AlexPosn -> String
prettyPrint cat s (AlexPn _ l c) = "Parse Error - Line " ++ (show l) ++ ", Column " ++ (show c) ++ " - Near " ++ cat ++ "'" ++ s ++ "'"


thenE :: E a -> (a -> E b) -> E b
m `thenE` k = 
   case m of 
       Ok a -> k a
       Failed e -> Failed e

returnE :: a -> E a
returnE a = Ok a

failE :: String -> E a
failE err = Failed err

catchE :: E a -> (String -> E a) -> E a
catchE m k = 
   case m of
      Ok a -> Ok a
      Failed e -> k e
  
data Prog = Query [String] [Constraint]
         | ProgLink Prog Prog
         deriving Show

data VarItem = VarItemVar String
  | VarItemBlank
  deriving Show

data Constraint = ConstraintTable String [VarItem]
  | ConstraintEq String String
  deriving Show
} 