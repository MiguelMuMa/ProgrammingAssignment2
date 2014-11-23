## Put comments here that give an overall description of what your
## functions do

## This fuction creates an object of type list that stores both the original matrix and the chached value. 
##For both things created, there is one function that sets the values and one that gets the value. This functions
## will be used after by the fucntion that caches the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinver <- function(solve) inv <<- solve
    getinver <- function() inv
    list(set = set, get = get,
         setinver = setinver,
         getinver = getinver)
}


#Calls function getinv, if inv is not Null, it means that the inverse it has been already created and 
#thereforeit cahces the data. Otherwise it gets inv, and calculates the inverse using "solve()".

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
