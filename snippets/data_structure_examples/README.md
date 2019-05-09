1. Declare a data structure for the following requirements:
	Add 100 integer values at sparse locations. Check if the value at index 2 and 45 exists. Print the value of first index along with the index.
	Print the value at the last index along with index. Check the array size. Delete 10th, 25th, 48th index if they exist. Print the array size again.

2 Write a SV code to create a 2 state array my_array that holds four 12 bit values. Initialize my_array so that my_array[0] = 12'h012, [1] = 12'h345,[2]= 678,[3]  	=9AB Traverse my_array and print out [7:5] of each 12 bit element 1. using for loop 2. using foreach loop

3. Declare a 5 by 31 multi dimensional array,my_arr1. Each element should hold a 4 state value. Which of the following assignments are legal and not out of bound
	my_arr1  [4][30] = 1'b1 , [29][4] = 1'b1 --> does not throw error but is out of bound and returns x, [4] = 32'b1 --

4. Create a SV code for the following requirements
	Create a 6byte queue and initialzie it with -1,-2,-3,4,8,127
	Print out the sum of the queue in decimal radix
	Sort all the values and print the resulting queue
	Print out all the positive and negative values
	Print the index of above
	Shuffle the queue

5. Define 3 tasks t1,t2,t3. Task t1 is taking 10ms, t2 is taking 5ms to execute. Each task containing one display statement. Task t1 and t2 are inside fork join
	Three differnet execution steps in the following order i. t1,t3,t2  ii. t3,t1,t2   iii. t1,t2,t3

6. Define 1 task which holds 3 arguments i. device no. i/p ii. time to get device ready i/p  iii. o/p flag which indicates device is ready.
   Call this task 3 times with different device no. and time. When anyone of the device is available resume the other process.
