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