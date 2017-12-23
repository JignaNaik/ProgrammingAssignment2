# Creates an R object that stores a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) { # Initialization of matrix x
        m <- NULL                           # Initialization of m
        set <- function(y) {                # Initialization of set function
                x <<- y                     # Assign y to x in the parent environment
                m <<- NULL                  # Assign value NULL to m in parent environment
        }                      
        get <- function() x                 # Defines get function for the vector x
        setinverse <- function(make_inverse) m <<- make_inverse 
        getinverse <- function() m          # Defines setinverse and getinverse functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)      # Object returns a list where the functions are

        # elements finally returned to the parent environment
}