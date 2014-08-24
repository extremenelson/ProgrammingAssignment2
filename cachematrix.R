## Put comments here that give an overall description of what your
## functions doc
## This set of functions manages the calculation of the inverse of a matrix. 
## If the matrix being passed in has already had its inverse calculated, the 
## Methods will return the cached inverse of the matrix. If the inverse matrix
## is not in the cache, the functions will compute the inverse of the matrix
## and cache the inverted matrix

## Write a short comment describing this function
## This function manages the cache and functions for setting and getting
## items from the cache.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  setSolve <- function(solve) {
    m <<- solve
  }
  getSolve <- function() {
    m
  }
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}


## Write a short comment describing this function
## This function calculates the inverse of a matrix. It uses the makeCacheMatrix
## function to cache the results and uses the cached value if the matrix is 
## passed in again.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()
  if(!is.null(m)) {
    message("Getting cached inverse of matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}
