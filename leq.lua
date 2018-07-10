print("Wanna do some linear equations ? \n")
print("Okay give me the starting value. \n")
start = io.read()
print(string.format("Okay your starting value is : %s",start))
print("Now give me the slope.\n")
slope = io.read()
print("Okay your slope is : ", slope , "\n")
function leq(m,x,b)
  eq = m*x + b
  return eq
end
print(string.format("Your linear equation is :  y = %sx + %s",slope,start))
print("Wanna start calculations with that linear equation ? (y/n) \n")
devam = io.read()
if (devam == "y") then
  print("Okay give your max x value.\n")
  maxx = io.read()
  print("Y","X")
  for i=0,maxx,1 do
    leq(slope,i,start)
    print(eq,i)
  end
else
  do return end
end
