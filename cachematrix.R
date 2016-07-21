## Functions to create a special matrix to facilitate caching it's inverse

## Functions to create a special matrix with is a list of functions to get 
## and set the matrix and it's inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Calculates the inverse if it isn't cached and returns it

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    matrix_norm <- x$get()
    i <- solve(matrix_norm)
    x$setinverse(i)
    i
}

