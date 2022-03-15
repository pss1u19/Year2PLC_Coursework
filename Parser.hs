{-# OPTIONS_GHC -w #-}
module Parser where 
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,55) ([3072,32768,1,512,0,1,32,0,8192,12288,0,12,384,6144,0,128,16384,16384,0,4,0,0,0,32,48,512,16384,128,12,0,0,0,64,16384,0,0,0,0,0,0,513,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Prog","VarList","StrictVarList","VarItem","ConstraintList","Constraint","table","var","cons","'='","'('","')'","'{'","'}'","','","';'","'_'","%eof"]
        bit_start = st Prelude.* 21
        bit_end = (st Prelude.+ 1) Prelude.* 21
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..20]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (11) = happyShift action_3
action_0 (12) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (6) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_3
action_1 (12) = happyShift action_4
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (16) = happyShift action_10
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (18) = happyShift action_9
action_3 _ = happyReduce_5

action_4 (18) = happyShift action_8
action_4 _ = happyReduce_6

action_5 (21) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (16) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (10) = happyShift action_13
action_7 (11) = happyShift action_14
action_7 (8) = happyGoto action_17
action_7 (9) = happyGoto action_12
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (11) = happyShift action_3
action_8 (12) = happyShift action_4
action_8 (6) = happyGoto action_16
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (11) = happyShift action_3
action_9 (12) = happyShift action_4
action_9 (6) = happyGoto action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (10) = happyShift action_13
action_10 (11) = happyShift action_14
action_10 (8) = happyGoto action_11
action_10 (9) = happyGoto action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (17) = happyShift action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (14) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (13) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_7

action_16 _ = happyReduce_8

action_17 (17) = happyShift action_18
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (11) = happyShift action_3
action_18 (12) = happyShift action_4
action_18 (4) = happyGoto action_29
action_18 (6) = happyGoto action_6
action_18 _ = happyReduce_1

action_19 (11) = happyShift action_28
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (11) = happyShift action_26
action_20 (20) = happyShift action_27
action_20 (5) = happyGoto action_24
action_20 (7) = happyGoto action_25
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_13
action_21 (11) = happyShift action_14
action_21 (8) = happyGoto action_23
action_21 (9) = happyGoto action_12
action_21 _ = happyReduce_11

action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_12

action_24 (15) = happyShift action_31
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (18) = happyShift action_30
action_25 _ = happyReduce_3

action_26 _ = happyReduce_9

action_27 _ = happyReduce_10

action_28 _ = happyReduce_14

action_29 _ = happyReduce_2

action_30 (11) = happyShift action_26
action_30 (20) = happyShift action_27
action_30 (5) = happyGoto action_32
action_30 (7) = happyGoto action_25
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_13

action_32 _ = happyReduce_4

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Query happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ProgLink (Query happy_var_1 happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyTerminal (TokenCons _ happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenCons _ happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (VarItemVar happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn7
		 (VarItemBlank
	)

happyReduce_11 = happySpecReduce_2  8 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenTable _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ConstraintTable happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn9
		 (ConstraintEq happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 21 21 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTable _ happy_dollar_dollar -> cont 10;
	TokenVar _ happy_dollar_dollar -> cont 11;
	TokenCons _ happy_dollar_dollar -> cont 12;
	TokenEq _ -> cont 13;
	TokenLParen _ -> cont 14;
	TokenRParen _ -> cont 15;
	TokenOpenBrace _ -> cont 16;
	TokenCloseBrace _ -> cont 17;
	TokenComma _ -> cont 18;
	TokenSemiColon _ -> cont 19;
	TokenUnderscore _ -> cont 20;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 21 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => E a -> (a -> E b) -> E b
happyThen = (thenE)
happyReturn :: () => a -> E a
happyReturn = (returnE)
happyThen1 m k tks = (thenE) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> E a
happyReturn1 = \a tks -> (returnE) a
happyError' :: () => ([(Token)], [Prelude.String]) -> E a
happyError' = (\(tokens, _) -> parseError tokens)
parseCalc tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
