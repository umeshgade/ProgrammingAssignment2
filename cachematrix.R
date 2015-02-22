## Author: Umesh Gade
## Date: 22 Feb 2015
## This module is written to excercise use data caching in R

## This is cache object which caches inverse of matrix.

makeCacheMatrix <- function(x = matrix()) {
  xInverse <- NULL
  getMatrix = function(){
    x
  }
  
  setMartrix = function(matrix){
    x <<- matrix
  }
  
  getInverse = function(){
     xInverse
  }
  
  setInverse = function(xInverse){
    xInverse <<- xInverse
  }
  
  list(
    getMatrix = getMatrix,
    setMartrix = setMartrix,
    getInverse = getInverse,
    setInverse =setInverse
    )
}


## This function returns caches inverse value cached by "makeCacheMatrix" function or
## returns computes inverse value and also sets inverse value on makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  xInverse <- x$getInverse();
  if(!is.null(xInverse)){
    print("Returning cached inverse value.")
    return(xInverse)
  }
  matrix = x$getMatrix()
  xInverse <- solve(matrix)
  x$setInverse(xInverse)
  xInverse
}
