## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # initializing the value of m to NULL as a default 
  set <- function(y){ 
    x <<- y # x creates and stores the values of the matrix passed in argument
    m <<- NULL # makes sure that the cached is set to NULL
  } 
  get <- function() x # calls the matrix 
  setsolve <- function(solve) m <<- solve # computes the inverse of the matrix and stores the results
  getsolve <- function() m     # Stores the value of the inverse of the function that has benn computed
  list( set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve) # create a list to store the functions created

}


## Write a short comment describing this function
# This function tests the matrix returned by the makeCachedMatrix previous function, checks if its inverse has been already cached
# If so it returns the cached value otherwise it computes the inverse, caches it and returns the results
cacheSolve <- function(x, ...) {
          ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve() # checks if an inverse of this matrix has been already computed and stored
  if(!is.null(m)){     # Test the value of the m variable
    message("getting cached data") # Print the "Getting cached data" message
    return(m)    # Return the cached value that has been previously computed
  }
  data <- x$get() # Otherwise gt the new matrix values
  m <- solve(data, ...)  # compute its inverse
  x$setsolve(m)         # caches the values
  m                 # Print the results of the inverse of the new matrix
}
