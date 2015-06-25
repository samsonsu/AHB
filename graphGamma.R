graphGamma = function(alpha=1, beta=1, y=1:20) {
  output = ((beta^alpha)*((y^(alpha-1)*(exp(-beta*y)))))/factorial(alpha-1)
  plot(y, output, color = "red")
}
