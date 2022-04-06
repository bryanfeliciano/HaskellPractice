import Control.State.Transition
  ( Environment
  , PredicateFailure
  , STS
  , Signal
  , State
  , TransitionRule
  , initialRules
  , transitionRules
  , TRC (TRC)
  , judgmentContext
  , (?!)
  )

-- | A Vending Machine State Transistion System
data VMACHINE

instance STS VMACHINE where
    type Environment VMACHINE = VEnv
    type State VMACHINE = VState
    type Signal VMACHINE = VSignal

    data PredicateFailure VMACHINE =           
        SmallDeposit
      | OutOfSoda
      | OutOfOrder
      deriving (Eq, Show)

    initialRules = [return $ VState 0 initNumOfSodas ]

    transitionRules = [vendingRule] 

-- | Initial Number of available sodas
initNumOfSodas :: Int
initNumOfSodas = 100

-- | The enviroinment of the Vending Machine
data VEnv = VEnv {
    _power :: Bool
    ,_cost :: Int
} deriving (Eq, Show)

-- | The state of a Vending Machine
data VState = VState {
    _tokens :: Int -- ^ Number of unspent tokens
    ,_sodas ::Int   -- ^ Number of remaining sodas
} deriving (Eq, Show)

-- | There are two signals that can cause a state transition
data VSignal = Push | Deposit Int deriving (Eq, Show)

-- | This implements the possible vending rules based on the available signals 
vendingRule :: TransitionRule VMACHINE
vendingRule = do
    TRC (env, state, sig) <- judgmentContext
    let VState t sd  = state
        VEnv p c = env
    case sig of
      Deposit amnt ->
        return $ VState (t+amnt) sd 
      Push ->
        do
          p == True ?! OutOfOrder
          c <= t ?! SmallDeposit
          sd > 0 ?! OutOfSoda    
          return $ VState (t-c) (sd-1)

     --initial attempts--

-- type Drink = [String,Int,Double]
-- type Balance = Double
-- type Inventory = [Drink]
-- data Dispense = 
--     Purchased Drink Balance
--     | OutOfStock Drink
--     | PurchaseFailed String
--     deriving (Eq, Show)
-- data VendingMachine = 
--     Products Inventory
--     deriving (Eq, Show)
-- --functions--
-- --check available inventory function--
-- --takes in Vending Machine and compares input to product--
-- --make it a helper function within purchase--
-- --checkbal would be the same--
-- --purchase function--
-- purchase :: Drink -> Balance -> Dispense
-- purchase d@(_,_,b) bal
--          |(b <= bal) = Purchased Drink Balance
--          |(b > bal)  = PurchaseFailed "insufficient balance"
-- --if item is both in stock and wallet has enough balance--
--     --then dispense purchased drink--
--     --optionally update the inventory count--
           --code to refactor--
-- data VendingMachine = VendingMachine { 
--                                         product :: String 
--                                       , price :: Double
--                                       , ammount :: Int 
--                                       }
--                                       deriving (Show)
-- data UserWallet = UserWallet {
--                                balance :: Int
--                              }
-- displayOptions :: String -> IO ()
-- displayOptions n = putStrLn n
-- -- inventoryStatus :: p -> String
-- -- inventoryStatus n
-- --           |(ammount >= 1) = "item in stock"
-- --           |otherwise = "item out of stock"
-- dispenseItem :: [Char] -> [[Char]] -> [Char]
-- dispenseItem n (x:xs)
--          |( n == x ) = "enjoy your" ++ n
--          |( n /= x ) = dispenseItem n xs
--          |otherwise = "sorry " ++  n  ++ "is no longer in stock"
-- --this should remove 1 of the item, use monad?--
-- products =  [("coke",1.00,20),("pepsi",1.00,20),("sprite",1.00,20)]