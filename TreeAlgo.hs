module TreeAlgo (BinaryTree,valuesPreorder,valuesInOrder,valuesPostOrder) where
-- 1)create the binary tree data structure
-- 2)make tree showable trough deriving (Show)
data BinaryTree a =
    Empty
    |Node (BinaryTree a) a (BinaryTree a)
    |Leaf a 
    deriving (Show)
-- 3)map over the entire tree
treeMap :: (a->b) -> BinaryTree a -> BinaryTree b
treeMap _ Empty = Empty
treeMap f (Leaf a) = Leaf (f a)
treeMap f (Node leftSubTree a rightSubTree) = Node (treeMap f leftSubTree) (f a) (treeMap f rightSubTree)

instance Functor BinaryTree where
    fmap = treeMap 
-- 4)implement pre-order
valuesPreorder::BinaryTree a -> [a]
valuesPreorder Empty = []
valuesPreorder (Leaf a) = [a]
valuesPreorder (Node leftSubTree a rightSubTree) = [a] ++ valuesPreorder leftSubTree ++ valuesPreorder rightSubTree
-- 5)implement in-order
valuesInOrder::BinaryTree a -> [a]
valuesInOrder Empty = []
valuesInOrder (Leaf a) = [a]
valuesInOrder (Node leftSubTree a rightSubTree) = valuesInOrder leftSubTree ++ [a] ++ valuesInOrder rightSubTree
-- 6)implement post-order
valuesPostOrder::BinaryTree a -> [a]
valuesPostOrder Empty = []
valuesPostOrder (Leaf a) = [a]
valuesPostOrder (Node leftSubTree a rightSubTree) = valuesPostOrder leftSubTree ++ valuesPostOrder rightSubTree ++ [a]
