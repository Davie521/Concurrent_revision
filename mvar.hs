import Control.Concurrent 


thread1 :: MVar () -> MVar() -> MVar() -> IO()
thread1 m1 m2 h = do
    putMVar m1 ()
    putMVar m2 ()
    takeMVar m1 
    takeMVar m2 
    putMVar h ()


thread2 :: MVar () -> MVar() -> MVar() -> IO()
thread2 m1 m2 h = do
    putMVar m1 ()
    putMVar m2 ()
    takeMVar m1 
    takeMVar m2 
    putMVar h ()

main = do
    m1 <- newEmptyMVar
    m2 <- newEmptyMVar
    h1 <- newEmptyMVar
    h2 <- newEmptyMVar

    forkIO(thread1 m1 m2 h1)
    forkIO(thread2 m2 m1 h2)

    takeMVar h1
    takeMVar h2 



