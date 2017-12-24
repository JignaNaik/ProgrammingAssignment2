# makeCacheMatrix sreates an R object that stores a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) { # Initialization of matrix x
        xI <- NULL                           # Initialization of xI
        set <- function(y) {                # Initialization of set function
                x <<- y                     # Assign y to x in the parent environment
                xI <<- NULL                  # Assign value NULL to m in parent environment
        }                      
        get <- function() x                 # Defines get function for the vector x
        setinverse <- function(make_inverse) xI <<- make_inverse 
        getinverse <- function() xI          # Defines setinverse and getinverse functions
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)      # Object returns a list where the functions are

        # elements finally returned to the parent environment
}

## cacheSolve returns m if already calculated and cached or calculates it
cacheSolve <- function(x, ...) {
        xI <- x$getinverse()
        if(!is.null(xI)) {                    #checks whether x is already cached
                message("getting cached data")
                return(xI)                   #returns inverse of x if already cached
        }
        data <- x$get()
        xI <- solve(data)                 #computes inverse of matrix
        x$setinverse(xI)
        xI                             # Returns inverse
}

