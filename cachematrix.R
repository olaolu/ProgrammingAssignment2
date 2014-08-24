## These two fuctions work together to cache the inverse of the matrix 
## and test if the matrix already has an inverse computed for it before the inverse 
## is calculated

## The following function takes the matrix and wraps addition information arround it.
## It provides additonal functions access to get and set the inverse of the matrix.
## we can call it a "special matrix"

makeCacheMatrix <- function(x = matrix()) {
  inv <-NULL
  set <- function(y) {
     x <<- y
     inv <<-NULL
  }
  get <- function() x
  setinv <- function(invers) inv<<-invers
 getinv <-function() inv
 list(set = set, get = get, setinverse=setinv, getinverse=getinv)
 
}


## This function takes the "special matrix", and checks if it already has an inverse and return the inverse
## If not, it access the original matrix, compute the inverse and cache the inverse 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<- x$getinv()
  if(!is.null(inv)){
    message("getting cached inverse of the matrix")
    return(inv)
  }
  data=x$get()
  inv= solve(data)
  
  x$setinv(inv)
  
}
