# Similarly to the makeVector fuction, the following function creates
# four functions:
#   1. One to set the value of the matrix
#   2. One to get the value of the matrix
#   3. One to set the value of its inverse
#   4. One to get the value of its inverse 
# In the end, it puts all of the functions together in a list and 
# returns the list. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolved <- function(solved) m <<- solved
  getSolved <- function() m
  list(set = set, get = get,
       setSolved = setSolved,
       getSolved = getSolved)
}

# Similarly to the cachemean function, this function calculates and 
# stores the inverse of the matrix by using the previously defined 
# functions, but first it checks whether the matrix exists 
# in order to not calculate it twice.

cacheSolve <- function(x) {
  m <- x$getSolved()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setSolved(m)
  m
}
