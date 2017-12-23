## Returns m if already calculated and cached or calculates it
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {                    #checks whether m is already cached
                message("getting cached data")
                return(m)                   #returns m if already cached
        }
        data <- x$get()
        m <- solve(data)                 #computes inverse of matrix
        x$setinverse(m)
        m                             # inverse returned
}

