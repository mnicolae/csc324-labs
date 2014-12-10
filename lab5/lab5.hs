data Tree a =  Node a (Tree a) (Tree a) | Empty

-- Note: without an explicit type signature,
-- Haskell infers to Tree Integer (numeric types are a bit odd...).
x :: Tree Int
x = Node 5 (Node 3 Empty (Node (-1) Empty Empty)) (Node 4 Empty Empty)

isEmpty :: Tree a -> Bool
isEmpty Empty = True
isEmpty _ = False

-- We could actually make this a more general type,
-- treeSum :: Num a => Tree a -> a
treeSum :: Tree Int -> Int
treeSum Empty = 0
treeSum (Node root left right) = root + (treeSum left) + (treeSum right)

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap _ Empty = Empty
treeMap f (Node root left right) = Node (f root) (treeMap f left) (treeMap f right)
